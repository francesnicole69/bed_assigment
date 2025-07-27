import { version } from '../../package.json'
import { Router } from 'express'
import { Sequelize, Op,literal, QueryTypes } from 'sequelize'
import sequelize from '../models/sequelize'
import toRes from '../lib/toRes'
import JiankangshujuModel from '../models/JiankangshujuModel'
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
	    "yonghuzhanghao": "yonghuzhanghao",
	    "yonghuxingming": "yonghuxingming",
	    "xingbie": "xingbie",
	    "nianling": "nianling",
	    "tizhong": "tizhong",
	    "xueya": "xueya",
	    "xuetang": "xuetang",
	    "xinlv": "xinlv",
	    "xuezhi": "xuezhi",
	    "shuimianshijian": "shuimianshijian",
	    "zongdanguchun": "zongdanguchun",
	    "xueyang": "xueyang",
	    "dengjishijian": "dengjishijian",
	};


	// 分页接口（后端）
	api.get('/page', async (req, res) => {

		try {

			let page = parseInt(req.query.page) || 1
			let limit = parseInt(req.query.limit) || 10
			let sort = req.query.sort || 'id'
			let order = req.query.order || 'asc'

			let where = {}
			let yonghuzhanghao = req.query.yonghuzhanghao
			if (yonghuzhanghao) {

				if (yonghuzhanghao.indexOf('%') != -1) {
					where.yonghuzhanghao = {
						[Op.like]: yonghuzhanghao
					}
				} else {
					where.yonghuzhanghao = {
						[Op.eq]: yonghuzhanghao
					}
				}
			}
			let yonghuxingming = req.query.yonghuxingming
			if (yonghuxingming) {

				if (yonghuxingming.indexOf('%') != -1) {
					where.yonghuxingming = {
						[Op.like]: yonghuxingming
					}
				} else {
					where.yonghuxingming = {
						[Op.eq]: yonghuxingming
					}
				}
			}
			let xingbie = req.query.xingbie
			if (xingbie) {

				if (xingbie.indexOf('%') != -1) {
					where.xingbie = {
						[Op.like]: xingbie
					}
				} else {
					where.xingbie = {
						[Op.eq]: xingbie
					}
				}
			}
			let nianling = req.query.nianling
			if (nianling) {

				if (nianling.indexOf('%') != -1) {
					where.nianling = {
						[Op.like]: nianling
					}
				} else {
					where.nianling = {
						[Op.eq]: nianling
					}
				}
			}
			let tizhong = req.query.tizhong
			if (tizhong) {

				if (tizhong.indexOf('%') != -1) {
					where.tizhong = {
						[Op.like]: tizhong
					}
				} else {
					where.tizhong = {
						[Op.eq]: tizhong
					}
				}
			}
			let xueya = req.query.xueya
			if (xueya) {

				if (xueya.indexOf('%') != -1) {
					where.xueya = {
						[Op.like]: xueya
					}
				} else {
					where.xueya = {
						[Op.eq]: xueya
					}
				}
			}
			let xuetang = req.query.xuetang
			if (xuetang) {

				if (xuetang.indexOf('%') != -1) {
					where.xuetang = {
						[Op.like]: xuetang
					}
				} else {
					where.xuetang = {
						[Op.eq]: xuetang
					}
				}
			}
			let xinlv = req.query.xinlv
			if (xinlv) {

				if (xinlv.indexOf('%') != -1) {
					where.xinlv = {
						[Op.like]: xinlv
					}
				} else {
					where.xinlv = {
						[Op.eq]: xinlv
					}
				}
			}
			let xuezhi = req.query.xuezhi
			if (xuezhi) {

				if (xuezhi.indexOf('%') != -1) {
					where.xuezhi = {
						[Op.like]: xuezhi
					}
				} else {
					where.xuezhi = {
						[Op.eq]: xuezhi
					}
				}
			}
			let shuimianshijian = req.query.shuimianshijian
			if (shuimianshijian) {

				if (shuimianshijian.indexOf('%') != -1) {
					where.shuimianshijian = {
						[Op.like]: shuimianshijian
					}
				} else {
					where.shuimianshijian = {
						[Op.eq]: shuimianshijian
					}
				}
			}
			let zongdanguchun = req.query.zongdanguchun
			if (zongdanguchun) {

				if (zongdanguchun.indexOf('%') != -1) {
					where.zongdanguchun = {
						[Op.like]: zongdanguchun
					}
				} else {
					where.zongdanguchun = {
						[Op.eq]: zongdanguchun
					}
				}
			}
			let xueyang = req.query.xueyang
			if (xueyang) {

				if (xueyang.indexOf('%') != -1) {
					where.xueyang = {
						[Op.like]: xueyang
					}
				} else {
					where.xueyang = {
						[Op.eq]: xueyang
					}
				}
			}
			let dengjishijian = req.query.dengjishijian
			if (dengjishijian) {

				if (dengjishijian.indexOf('%') != -1) {
					where.dengjishijian = {
						[Op.like]: dengjishijian
					}
				} else {
					where.dengjishijian = {
						[Op.eq]: dengjishijian
					}
				}
			}
			let tableName = req.session.userinfo === undefined ? jwt.decode(req.headers.token).tableName : req.session.userinfo.tableName
			if(tableName == 'yonghu') {
				where.yonghuzhanghao = {
					[Op.eq]: req.session.userinfo === undefined ? jwt.decode(req.headers.token).username : req.session.userinfo.yonghuzhanghao
				}
				if (where['userid'] != undefined) {
					delete where.userid
				}
			}
			let orders =[]
			const sortList = sort.split(",")
			const orderList = order.split(",")
			sortList.forEach((item, index) => {
				orders.push([item,orderList[index]])
			  });
			let result = await JiankangshujuModel.findAndCountAll({
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
			let result = await JiankangshujuModel.findAll()
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
			let result = await JiankangshujuModel.findOne({where:dictionary})
			
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

			let result = await JiankangshujuModel.findAndCountAll({
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



			const userinfo = await JiankangshujuModel.create(req.body)

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


			const userinfo = await JiankangshujuModel.create(req.body)

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


			await JiankangshujuModel.update(req.body, {
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

			await JiankangshujuModel.destroy({
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


			toRes.record(res, 0, await JiankangshujuModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, 'server error！', '', 500)
		}
	})
    // 详情接口（前端）
	api.all('/detail/:id', async (req, res) => {

		try {


			toRes.record(res, 0, await JiankangshujuModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, 'server error！', '', 500)
		}
	})

	// 获取需要提醒的记录数接口
	api.get('/remind/:columnName/:type', async (req, res) => {

		try {

			let sql = 'SELECT 0 AS count'
			
			if (req.params.type == 1) {
				if (req.query.remindstart) sql = "SELECT COUNT(*) AS count FROM jiankangshuju WHERE " + req.params.columnName + " >= '" + req.query.remindstart + "'"
				if (req.query.remindend) sql = "SELECT COUNT(*) AS count FROM jiankangshuju WHERE " + req.params.columnName + " <= '" + req.query.remindend + "'"

				if (req.query.remindstart && req.query.remindend) {
					sql = "SELECT COUNT(*) AS count FROM jiankangshuju WHERE " + req.params.columnName + " >= '" + req.query.remindstart + "' AND " + req.params.columnName + " <= '" + req.query.remindend + "'"
				}
			}

			if (req.params.type == 2) {
				if (req.query.remindstart) {
					let remindStart = util.getDateTimeFormat(0 + Number(req.query.remindstart), "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM jiankangshuju WHERE " + req.params.columnName + " >= '" + remindStart + "'"
				}
				if (req.query.remindend) {
					let remindEnd = util.getDateTimeFormat(req.query.remindend, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM jiankangshuju WHERE " + req.params.columnName + " <= '" + remindEnd + "'"
				}

				if (req.query.remindstart && req.query.remindend) {
					let remindStart = util.getDateTimeFormat(0 + Number(req.query.remindstart), "yyyy-MM-dd")
					let remindEnd = util.getDateTimeFormat(req.query.remindend, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM jiankangshuju WHERE " + req.params.columnName + " >= '" + remindStart + "' AND " + req.params.columnName + " <= '" + remindEnd + "'"
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
			// let tableName = "jiankangshuju"
			let where = " WHERE 1 = 1 "
			let tableName = req.session.userinfo === undefined ? jwt.decode(req.headers.token).tableName : req.session.userinfo.tableName
			if(tableName == 'yonghu') {
				where += " AND yonghuzhanghao = '" + jwt.decode(req.headers.token).username + "' ";
			}
			sql = "SELECT COUNT(*) AS total, " + columnName + " FROM jiankangshuju " + where + " GROUP BY " + columnName
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
			// let tableName = "jiankangshuju"
			let where = " WHERE 1 = 1 "
			let tableName = req.session.userinfo === undefined ? jwt.decode(req.headers.token).tableName : req.session.userinfo.tableName
			if(tableName == 'yonghu') {
				where += " AND yonghuzhanghao = '" + jwt.decode(req.headers.token).username + "' ";
			}
			if ("jiankangshuju" == "orders") {
				where += " AND status IN ('已支付', '已发货', '已完成') ";
			}

			sql = "SELECT " + xColumnName + ", SUM(" + yColumnName + ") AS total FROM jiankangshuju " + where + " GROUP BY " + xColumnName 
			
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
			let tableName = "jiankangshuju"
			let where = " WHERE 1 = 1 "
			let userTableName = req.session.userinfo === undefined ? jwt.decode(req.headers.token).tableName : req.session.userinfo.tableName;
			if(userTableName == 'yonghu') {
				where += " AND yonghuzhanghao = '" + jwt.decode(req.headers.token).username + "' ";
			}
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
			let tableName = "jiankangshuju"
			let where = " WHERE 1 = 1 "
			let userTableName = req.session.userinfo === undefined ? jwt.decode(req.headers.token).tableName : req.session.userinfo.tableName;
			if(userTableName == 'yonghu') {
				where += " AND yonghuzhanghao = '" + jwt.decode(req.headers.token).username + "' ";
			}

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
			let tableName = "jiankangshuju"
			let where = " WHERE 1 = 1 "
			let userTableName = req.session.userinfo === undefined ? jwt.decode(req.headers.token).tableName : req.session.userinfo.tableName;
			if(userTableName == 'yonghu') {
				where += " AND yonghuzhanghao = '" + jwt.decode(req.headers.token).username + "' ";
			}
			if ("jiankangshuju" == "orders") {
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
