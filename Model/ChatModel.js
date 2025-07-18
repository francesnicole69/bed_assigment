import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// ai问答
const ChatModel = sequelize.define('ChatModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	adminid: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '管理员id',
		field: 'adminid' // 映射数据库字段
	},
	ask: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '提问内容',
		field: 'ask' // 映射数据库字段
	},
	reply: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '回复内容',
		field: 'reply' // 映射数据库字段
	},
	isreply: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '是否回复',
		field: 'isreply' // 映射数据库字段
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
	tableName: 'chat'
})

export default ChatModel
