import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 用户
const YonghuModel = sequelize.define('YonghuModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	yonghuzhanghao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '用户账号',
		field: 'yonghuzhanghao' // 映射数据库字段
	},
	yonghumima: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '用户密码',
		field: 'yonghumima' // 映射数据库字段
	},
	yonghuxingming: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '用户姓名',
		field: 'yonghuxingming' // 映射数据库字段
	},
	touxiang: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '头像',
		field: 'touxiang' // 映射数据库字段
	},
	xingbie: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '性别',
		field: 'xingbie' // 映射数据库字段
	},
	shoujihaoma: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '手机号码',
		field: 'shoujihaoma' // 映射数据库字段
	},
	nianling: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '年龄',
		field: 'nianling' // 映射数据库字段
	},
	zhuzhi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '住址',
		field: 'zhuzhi' // 映射数据库字段
	},
	addtime: {
  		type: DataTypes.DATE,
  		defaultValue: DataTypes.NOW,
    	allowNull: false,
    	get() {
            return moment(this.getDataValue('addtime')).format('YYYY-MM-DD HH:mm:ss')
        },
		comment: '添加时间'
	}
}, {
	timestamps: false,
	freezeTableName: true,
	tableName: 'yonghu'
})

export default YonghuModel
