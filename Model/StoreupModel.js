import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 我的收藏
const StoreupModel = sequelize.define('StoreupModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	refid: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: 'refid',
		field: 'refid' // 映射数据库字段
	},
	tablename: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '表名',
		field: 'tablename' // 映射数据库字段
	},
	name: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '名称',
		field: 'name' // 映射数据库字段
	},
	picture: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '图片',
		field: 'picture' // 映射数据库字段
	},
	type: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
		field: 'type' // 映射数据库字段
	},
	inteltype: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '推荐类型',
		field: 'inteltype' // 映射数据库字段
	},
	remark: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '备注',
		field: 'remark' // 映射数据库字段
	},
	userid: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '用户id',
		field: 'userid' // 映射数据库字段
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
	tableName: 'storeup'
})

export default StoreupModel
