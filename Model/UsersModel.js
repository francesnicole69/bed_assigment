import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 管理员
const UsersModel = sequelize.define('UsersModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	username: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '用户名',
		field: 'username' // 映射数据库字段
	},
	password: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '密码',
		field: 'password' // 映射数据库字段
	},
	role: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '角色',
		field: 'role' // 映射数据库字段
	},
	tupian: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '图片',
		field: 'tupian' // 映射数据库字段
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
},

	{
		timestamps: false,
		freezeTableName: true,
		tableName: 'users'
	})

export default UsersModel
