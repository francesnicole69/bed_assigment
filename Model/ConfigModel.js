import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from '../backend/src/models/sequelize'

// 轮播图
const ConfigModel = sequelize.define('ConfigModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	name: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '名称',
		field: 'name' // 映射数据库字段
	},
	value: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '值',
		field: 'value' // 映射数据库字段
	},
}, {
	timestamps: false,
	freezeTableName: true,
	tableName: 'config'
})

export default ConfigModel
