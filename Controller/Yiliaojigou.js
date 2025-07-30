import { version } from '../../package.json'
import { Router } from 'express'
import { Sequelize, Op,literal, QueryTypes } from 'sequelize'
import sequelize from '../models/sequelize'
import toRes from '../lib/toRes'
import YiliaojigouModel from '../models/YiliaojigouModel'
import md5 from 'md5-node'
import util from '../lib/util'
import jwt from 'jsonwebtoken'
import moment from 'moment'
import ConfigModel from '../models/ConfigModel'
import https from 'https'
import request from 'request'
import qs from 'querystring'
import path from 'path'
import fs from 'fs'



export default ({ config, db }) => {
	let api = Router()

	const renameMap = {
	    "jigouzhanghao": "jigouzhanghao",
	    "mima": "mima",
	    "jigoumingcheng": "jigoumingcheng",
	    "touxiang": "touxiang",
	    "lianxidianhua": "lianxidianhua",
	    "sfsh": "sfsh",
	    "shhf": "shhf",
	};

	// 用户登录接口
	api.all('/login', async (req, res) => {

		try {

			let pwd = req.query.password
			let userQuery = await YiliaojigouModel.findOne({ where: { jigouzhanghao: req.query.username} })
			if (userQuery!=null){
				if (userQuery.isLocked==1){
					toRes.session(res, 500, '账号已锁定，请联系管理员审核!')
				}
				if(pwd!=userQuery.mima){//密码错误,累计错误次数
					userQuery.maxPasswordWrong+=1
					if(userQuery.maxPasswordWrong>=0){
						userQuery.isLocked=1
					}
					await userQuery.save()
					toRes.session(res, 10028, '用户名或密码错误！')
					return
				}
			}
			let userinfo = await YiliaojigouModel.findOne({ where: { jigouzhanghao: req.query.username, mima: pwd } })
			if (userinfo === null) {
				toRes.session(res, -1, '用户名或密码错误！')
				return
			}

			if (userinfo.dataValues.sfsh === '否' || userinfo.dataValues.sfsh == '待审核' || userinfo.dataValues.sfsh == '')
			{
				toRes.session(res, -1, '账号已锁定，请联系管理员审核!')
				return
			}
			const token = jwt.sign(
				{
					id: userinfo.dataValues.id,
					username: userinfo.dataValues.jigouzhanghao,
					role: '医疗机构',
                    loginUserColumn: 'jigouzhanghao',
                    tableName: 'yiliaojigou'
				},
				config.jwtSecret,
				{
					expiresIn: 60 * 60 * 24 * 1
				}
			)

			userinfo.dataValues.token = token
			userinfo.dataValues.role = '医疗机构'
			userinfo.dataValues.loginUserColumn = 'jigouzhanghao'
			userinfo.dataValues.tableName = 'yiliaojigou'
			delete userinfo.dataValues.mima
			req.session.userinfo = userinfo

			toRes.session(res, 0, '登录成功！', token)
		} catch(err) {

			toRes.session(res, 500, 'server error！', '', 500)
		}
	})


	// 用户退出接口
	api.all('/logout', (req, res) => {
		
		req.session.destroy(err => {
			toRes.session(res, 0, '退出成功！')
		})
	})

	// 注册接口
	api.post('/register', async (req, res) => {

		try {

			Object.keys(req.body).forEach(item=>{
				if(req.body[item] == '')  delete req.body[item]
			})


			const userinfo = await YiliaojigouModel.create(req.body)

			if (userinfo === null) {

				toRes.session(res, -1, '注册失败！')
			} else {

				toRes.session(res, 0, '注册成功！')
			}
		} catch(err) {
			
			toRes.session(res, -2, '请检查是否正确输入或用户名重复！', '', 200)
		}
	})

	// 获取session接口
	api.all('/session', async (req, res) => {

		try {

			toRes.record(res, 0, await YiliaojigouModel.findOne({ where: { id:jwt.decode(req.headers.token).id} }))
		} catch(err) {
			
			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

	// 忘记密码（找回密码）
	api.all('/resetPass', async (req, res) => {

		try {

    		let pwd = '123456'
			await YiliaojigouModel.update({
				mima: pwd
			}, {
				where: {
				  jigouzhanghao: req.query.username
				}
			})

			toRes.session(res, 0, '密码已重置为：123456')
		} catch(err) {
			
			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

	// 分页接口（后端）
	api.get('/page', async (req, res) => {

		try {

			let page = parseInt(req.query.page) || 1
			let limit = parseInt(req.query.limit) || 10
			let sort = req.query.sort || 'id'
			let order = req.query.order || 'asc'

			let where = {}
			let jigouzhanghao = req.query.jigouzhanghao
			if (jigouzhanghao) {

				if (jigouzhanghao.indexOf('%') != -1) {
					where.jigouzhanghao = {
						[Op.like]: jigouzhanghao
					}
				} else {
					where.jigouzhanghao = {
						[Op.eq]: jigouzhanghao
					}
				}
			}
			let mima = req.query.mima
			if (mima) {

				if (mima.indexOf('%') != -1) {
					where.mima = {
						[Op.like]: mima
					}
				} else {
					where.mima = {
						[Op.eq]: mima
					}
				}
			}
			let jigoumingcheng = req.query.jigoumingcheng
			if (jigoumingcheng) {

				if (jigoumingcheng.indexOf('%') != -1) {
					where.jigoumingcheng = {
						[Op.like]: jigoumingcheng
					}
				} else {
					where.jigoumingcheng = {
						[Op.eq]: jigoumingcheng
					}
				}
			}
			let touxiang = req.query.touxiang
			if (touxiang) {

				if (touxiang.indexOf('%') != -1) {
					where.touxiang = {
						[Op.like]: touxiang
					}
				} else {
					where.touxiang = {
						[Op.eq]: touxiang
					}
				}
			}
			let lianxidianhua = req.query.lianxidianhua
			if (lianxidianhua) {

				if (lianxidianhua.indexOf('%') != -1) {
					where.lianxidianhua = {
						[Op.like]: lianxidianhua
					}
				} else {
					where.lianxidianhua = {
						[Op.eq]: lianxidianhua
					}
				}
			}
			let sfsh = req.query.sfsh
			if (sfsh) {

				if (sfsh.indexOf('%') != -1) {
					where.sfsh = {
						[Op.like]: sfsh
					}
				} else {
					where.sfsh = {
						[Op.eq]: sfsh
					}
				}
			}
			let shhf = req.query.shhf
			if (shhf) {

				if (shhf.indexOf('%') != -1) {
					where.shhf = {
						[Op.like]: shhf
					}
				} else {
					where.shhf = {
						[Op.eq]: shhf
					}
				}
			}
			let orders =[]
			const sortList = sort.split(",")
			const orderList = order.split(",")
			sortList.forEach((item, index) => {
				orders.push([item,orderList[index]])
			  });
			let result = await YiliaojigouModel.findAndCountAll({
				order: [orders],
				where,
				offset: (page - 1) * limit,
				limit
			})
			
			result.currPage = page
			result.pageSize = limit

			toRes.page(res, 0, result)
		} catch(err) {

			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

	  // 分页接口（前端）
	api.get('/lists', async (req, res) => {

		try {
			let result = await YiliaojigouModel.findAll()
			toRes.record(res, 0, result)
		} catch(err) {
			
			toRes.session(res, 401, '您的权限不够！', '', 200)
		}
	})

	// 查询单条记录（前端）
	api.get('/query', async (req, res) => {

		try {
			const dictionary = {};
			for (let key in req.query) {
				dictionary[key] = req.query[key];
			}
			let result = await YiliaojigouModel.findOne({where:dictionary})
			
			toRes.record(res, 0, result)
		} catch(err) {
			res.status(500).render(err)
		}
	})
	
    // 分页接口（前端）
	api.get('/list', async (req, res) => {

		try {

			let page = parseInt(req.query.page) || 1
			let limit = parseInt(req.query.limit) || 10
			let sort = req.query.sort || 'id'
			let order = req.query.order || 'asc'

			let where = {}
			for (let key in req.query) {
				if (req.query[key]!= '' && req.query[key]!= '%%'&& key!= 'page' && key!= 'limit' && key!='sort' && key!= 'order' && key!='t') {
					if	(req.query[key].startsWith("%")) {
						where[key] = {
							[Op.like]: req.query[key]
						}
					} else {
						where[key] = {
							[Op.eq]: req.query[key]
						}
					}
				}
			}

			let orders =[]
			const sortList = sort.split(",")
			const orderList = order.split(",")
			sortList.forEach((item, index) => {
				orders.push([item,orderList[index]])
			  });

			let result = await YiliaojigouModel.findAndCountAll({
				order: [orders],
				where,
				offset: (page - 1) * limit,
				limit
			})
			
			result.currPage = page
			result.pageSize = limit

			toRes.page(res, 0, result)
		} catch(err) {
			toRes.session(res, 401, err.message, '', 200)
		}
	})


	// 保存接口（后端）
	api.post('/save', async (req, res) => {

		try {

			Object.keys(req.body).forEach(item=>{
				if(req.body[item] == '')  delete req.body[item]
			})

			let jigouzhanghaocount = await YiliaojigouModel.count({
				where: {
					jigouzhanghao: req.body["jigouzhanghao"]
				}
			})
            if (jigouzhanghaocount > 0) {
				toRes.session(res, -1, '机构账号已存在')
            }


			const userinfo = await YiliaojigouModel.create(req.body)

			if (userinfo === null) {

				toRes.session(res, -1, 'failed to add！')
			} else {

				toRes.session(res, 0, 'added successfully！')
			}
		} catch(err) {
			
			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

    // 保存接口（前端）
	api.post('/add', async (req, res) => {

		try {

			Object.keys(req.body).forEach(item=>{
				if(req.body[item] == '')  delete req.body[item]
			})

			if (jwt.decode(req.headers.token) == null) {
				toRes.session(res, 401, 'Please log in to proceed', '', 401)
			}
			let jigouzhanghaocount = await YiliaojigouModel.count({
				where: {
					jigouzhanghao: req.body["jigouzhanghao"]
				}
			})
            if (jigouzhanghaocount > 0) {
				toRes.session(res, -1, '机构账号已存在')
            }


			const userinfo = await YiliaojigouModel.create(req.body)

			if (userinfo === null) {

				toRes.session(res, -1, 'failed to add！')
			} else {

				toRes.session(res, 0, 'added successfully！')
			}
		} catch(err) {
			
			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

	// 更新接口
	api.post('/update', async (req, res) => {

		try {
			let jigouzhanghaocount = await YiliaojigouModel.count({
				where :{
					id:{
						[Op.ne]:req.body.id
					},
					jigouzhanghao:{
						[Op.eq]:req.body.jigouzhanghao
					}
				}
			})
            if (jigouzhanghaocount > 0) {
				toRes.session(res, -1, '机构账号已存在')
            }


			await YiliaojigouModel.update(req.body, {
				where: {
				  id: req.body.id || 0
				}
			})


			toRes.session(res, 0, '编辑成功！')
		} catch(err) {
			
			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

	// 删除接口
	api.post('/delete', async (req, res) => {

		try {

			await YiliaojigouModel.destroy({
				where: {
				  id: {
					[Op.in]: req.body
				  }
				}
			})

			toRes.session(res, 0, '删除成功！')
		} catch(err) {

			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

	// 详情接口（后端）
	api.all('/info/:id', async (req, res) => {

		try {


			toRes.record(res, 0, await YiliaojigouModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, 'server error！', '', 500)
		}
	})
    // 详情接口（前端）
	api.all('/detail/:id', async (req, res) => {

		try {


			toRes.record(res, 0, await YiliaojigouModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

	// 获取需要提醒的记录数接口
	api.get('/remind/:columnName/:type', async (req, res) => {

		try {

			let sql = 'SELECT 0 AS count'
			
			if (req.params.type == 1) {
				if (req.query.remindstart) sql = "SELECT COUNT(*) AS count FROM yiliaojigou WHERE " + req.params.columnName + " >= '" + req.query.remindstart + "'"
				if (req.query.remindend) sql = "SELECT COUNT(*) AS count FROM yiliaojigou WHERE " + req.params.columnName + " <= '" + req.query.remindend + "'"

				if (req.query.remindstart && req.query.remindend) {
					sql = "SELECT COUNT(*) AS count FROM yiliaojigou WHERE " + req.params.columnName + " >= '" + req.query.remindstart + "' AND " + req.params.columnName + " <= '" + req.query.remindend + "'"
				}
			}

			if (req.params.type == 2) {
				if (req.query.remindstart) {
					let remindStart = util.getDateTimeFormat(0 + Number(req.query.remindstart), "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM yiliaojigou WHERE " + req.params.columnName + " >= '" + remindStart + "'"
				}
				if (req.query.remindend) {
					let remindEnd = util.getDateTimeFormat(req.query.remindend, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM yiliaojigou WHERE " + req.params.columnName + " <= '" + remindEnd + "'"
				}

				if (req.query.remindstart && req.query.remindend) {
					let remindStart = util.getDateTimeFormat(0 + Number(req.query.remindstart), "yyyy-MM-dd")
					let remindEnd = util.getDateTimeFormat(req.query.remindend, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM yiliaojigou WHERE " + req.params.columnName + " >= '" + remindStart + "' AND " + req.params.columnName + " <= '" + remindEnd + "'"
				}
			}

			const results = await sequelize.query(sql, {
				plain: true,
				raw: true,
				type: QueryTypes.SELECT
			})

			toRes.count(res, 0, results.count)
		} catch(err) {
			
			toRes.session(res, 500, 'server error！', '', 500)
		}
	})










	// 分组统计接口
	api.get('/group/:columnName', async (req, res) => {

		try {

			let sql = ""
			let columnName = req.params.columnName
			for (const key in renameMap) {
			    if (key === columnName) {
			        columnName = renameMap[key]; // 转换值
			    }
			}
			// let tableName = "yiliaojigou"
			let where = " WHERE 1 = 1 "
			sql = "SELECT COUNT(*) AS total, " + columnName + " FROM yiliaojigou " + where + " GROUP BY " + columnName
			let limit = parseInt(req.query.limit) || 0
			let order = req.query.order || ''
			let data = await sequelize.query(sql, {
				plain: false,
				raw: true,
				type: QueryTypes.SELECT
			})
			
			if (order == 'asc') {
				data = data.sort((a, b) => parseInt(a.total) - parseInt(b.total));
			}else{
				data = data.sort((a, b) => parseInt(b.total) - parseInt(a.total));
			}
			if (limit>0 && limit<data.length) {
				data = data.slice(0, limit);
			}else{
				data = data.slice(0, 10);
			}
			toRes.record(res, 0, data)
		} catch(err) {

			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

	// 统计指定字段
	api.get('/value/:xColumnName/:yColumnName', async (req, res) => {

		try {

			let sql = ""
			let xColumnName = req.params.xColumnName
			let yColumnName = req.params.yColumnName
			for (const key in renameMap) {
			    if (key === yColumnName) {
			        yColumnName = renameMap[key]; // 转换值
			    }
			}
			// let tableName = "yiliaojigou"
			let where = " WHERE 1 = 1 "
			if ("yiliaojigou" == "orders") {
				where += " AND status IN ('已支付', '已发货', '已完成') ";
			}

			sql = "SELECT " + xColumnName + ", SUM(" + yColumnName + ") AS total FROM yiliaojigou " + where + " GROUP BY " + xColumnName 
			
			let limit = parseInt(req.query.limit) || 0
			let order = req.query.order || ''
			let data = await sequelize.query(sql, {
				plain: false,
				raw: true,
				type: QueryTypes.SELECT
			})
			
			if (order == 'asc') {
				data = data.sort((a, b) => parseInt(a.total) - parseInt(b.total));
			}else{
				data = data.sort((a, b) => parseInt(b.total) - parseInt(a.total));
			}
			if (limit>0 && limit<data.length) {
				data = data.slice(0, limit);
			}else{
				data = data.slice(0, 10);
			}
			toRes.record(res, 0, data)
		} catch(err) {

			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

	// (按值统计）时间统计类型(多)
	api.get('/valueMul/:xColumnName', async (req, res) => {

		try {	
			let sql = ""
			let xColumnName = req.params.xColumnName
			let yColumnName = req.query.yColumnNameMul
			let tableName = "yiliaojigou"
			let where = " WHERE 1 = 1 "
			const promises = yColumnName.split(',').map(async(item)=>{
				sql = "SELECT " + xColumnName + ", sum(" + item + ") total FROM " + tableName + where + " GROUP BY " + xColumnName;
				const results = await sequelize.query(sql, {
					plain: false,
					raw: true,
					type: QueryTypes.SELECT
				});
				return results;
			})
            	
			toRes.record(res, 0, await Promise.all(promises))
		} catch(err) {

			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

	// (按值统计）时间统计类型(多)
	api.get('/valueMul/:xColumnName/:timeStatType', async (req, res) => {

		try {	
			let sql = ""
			let xColumnName = req.params.xColumnName
			let yColumnName = req.query.yColumnNameMul
			let timeStatType = req.params.timeStatType
			let tableName = "yiliaojigou"
			let where = " WHERE 1 = 1 "

			const promises = yColumnName.split(',').map(async(item)=>{
				sql = "SELECT " + xColumnName + ", sum(" + item + ") total FROM " + tableName + where + " GROUP BY " + xColumnName;
				if (config.dbConnection.dbtype.toLowerCase() == "mysql") {
            	    if (timeStatType == "日")
            	        sql = "SELECT DATE_FORMAT(" + xColumnName + ", '%Y-%m-%d') " + xColumnName + ", sum(" + item + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(" + xColumnName + ", '%Y-%m-%d')";
            	    if (timeStatType == "月")
            	        sql = "SELECT DATE_FORMAT(" + xColumnName + ", '%Y-%m') " + xColumnName + ", sum(" + item + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(" + xColumnName + ", '%Y-%m')";
            	    if (timeStatType == "年")
            	        sql = "SELECT DATE_FORMAT(" + xColumnName + ", '%Y') " + xColumnName + ", sum(" + item + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(" + xColumnName + ", '%Y')";
            	} else {
            	    if (timeStatType == "日")
            	        sql = "SELECT DATE_FORMAT(VARCHAR(10)," + xColumnName + ", 120) " + xColumnName + ", sum(" + item + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(VARCHAR(10)," + xColumnName + ", 120)";
            	    if (timeStatType == "月")
            	        sql = "SELECT DATE_FORMAT(VARCHAR(7)," + xColumnName + ", 120) " + xColumnName + ", sum(" + item + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(VARCHAR(7)," + xColumnName + ", 120)";
            	    if (timeStatType == "年")
            	        sql = "SELECT DATE_FORMAT(VARCHAR(4)," + xColumnName + ", 120) " + xColumnName + ", sum(" + item + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(VARCHAR(4)," + xColumnName + ", 120)";
            	}
				const results = await sequelize.query(sql, {
					plain: false,
					raw: true,
					type: QueryTypes.SELECT
				});
				return results;
			})
            	
			toRes.record(res, 0, await Promise.all(promises))
		} catch(err) {

			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

	// 按日期统计
	api.get('/value/:xColumnName/:yColumnName/:timeStatType', async (req, res) => {

		try {
			
			let sql = ""
			let xColumnName = req.params.xColumnName
			let yColumnName = req.params.yColumnName
			for (const key in renameMap) {
			    if (key === yColumnName) {
			        yColumnName = renameMap[key]; // 转换值
			    }
			}
			let timeStatType = req.params.timeStatType
			let tableName = "yiliaojigou"
			let where = " WHERE 1 = 1 "
			if ("yiliaojigou" == "orders") {
				where += " AND status IN ('已支付', '已发货', '已完成') ";
			}

            if (config.dbConnection.dbtype.toLowerCase() == "mysql") {
                if (timeStatType == "日")
                    sql = "SELECT DATE_FORMAT(" + xColumnName + ", '%Y-%m-%d') " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(" + xColumnName + ", '%Y-%m-%d')";
                if (timeStatType == "月")
                    sql = "SELECT DATE_FORMAT(" + xColumnName + ", '%Y-%m') " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(" + xColumnName + ", '%Y-%m')";
                if (timeStatType == "年")
                    sql = "SELECT DATE_FORMAT(" + xColumnName + ", '%Y') " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(" + xColumnName + ", '%Y')";
            } else {
                if (timeStatType == "日")
                    sql = "SELECT DATE_FORMAT(VARCHAR(10)," + xColumnName + ", 120) " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(VARCHAR(10)," + xColumnName + ", 120)";
                if (timeStatType == "月")
                    sql = "SELECT DATE_FORMAT(VARCHAR(7)," + xColumnName + ", 120) " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(VARCHAR(7)," + xColumnName + ", 120)";
                if (timeStatType == "年")
                    sql = "SELECT DATE_FORMAT(VARCHAR(4)," + xColumnName + ", 120) " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(VARCHAR(4)," + xColumnName + ", 120)";
            }
			let limit = parseInt(req.query.limit) || 0
			let order = req.query.order || ''
			let data = await sequelize.query(sql, {
				plain: false,
				raw: true,
				type: QueryTypes.SELECT
			})
			
			if (order == 'asc') {
				data = data.sort((a, b) => parseInt(a.total) - parseInt(b.total));
			}else{
				data = data.sort((a, b) => parseInt(b.total) - parseInt(a.total));
			}
			if (limit>0 && limit<data.length) {
				data = data.slice(0, limit);
			}else{
				data = data.slice(0, 10);
			}
			toRes.record(res, 0, data)
		} catch(err) {

			toRes.session(res, 500, 'server error！', '', 500)
		}
	})
















	return api
}
