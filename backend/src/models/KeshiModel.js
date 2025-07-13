import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 科室
const KeshiModel = sequelize.define('KeshiModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	keshi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '科室',
		field: 'keshi' // 映射数据库字段
	},
	keshiweizhi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '科室位置',
		field: 'keshiweizhi' // 映射数据库字段
	},
	yishengzhanghao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '医生账号',
		field: 'yishengzhanghao' // 映射数据库字段
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
	tableName: 'keshi'
})

export default KeshiModel
