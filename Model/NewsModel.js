import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from '../backend/src/models/sequelize'

// 健康科普
const NewsModel = sequelize.define('NewsModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	title: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '标题',
		field: 'title' // 映射数据库字段
	},
	introduction: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '简介',
		field: 'introduction' // 映射数据库字段
	},
	picture: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '图片',
		field: 'picture' // 映射数据库字段
	},
	content: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '内容',
		field: 'content' // 映射数据库字段
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
	tableName: 'news'
})

export default NewsModel
