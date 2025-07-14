import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from '../backend/src/models/sequelize'

// 吃药提醒
const PopupRemindModel = sequelize.define('PopupRemindModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	userid: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '发布人用户ID',
		field: 'userid' // 映射数据库字段
	},
	title: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '标题',
		field: 'title' // 映射数据库字段
	},
	type: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '类型',
		field: 'type' // 映射数据库字段
	},
	brief: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '简介',
		field: 'brief' // 映射数据库字段
	},
	content: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '内容',
		field: 'content' // 映射数据库字段
	},
	remindTime: {
		type: DataTypes.DATE,
		allowNull: true,
		set: function(value) {
			this.setDataValue('remindTime', value ? moment(value).format('YYYY-MM-DD HH:mm:ss') : null);
		},
		get() {
			const value = this.getDataValue('remindTime');
            return value ? moment(value).format('YYYY-MM-DD HH:mm:ss') : '';
        },
		comment: '提醒时间',
		field: 'remind_time' // 映射数据库字段
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
	tableName: 'popup_remind'
})

export default PopupRemindModel
