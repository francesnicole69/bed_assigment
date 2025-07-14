import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 取消预约
const QuxiaoyuyueModel = sequelize.define('QuxiaoyuyueModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	tijianxiangmu: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '体检项目',
		field: 'tijianxiangmu' // 映射数据库字段
	},
	tijianleixing: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '体检类型',
		field: 'tijianleixing' // 映射数据库字段
	},
	tijiandidian: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '体检地点',
		field: 'tijiandidian' // 映射数据库字段
	},
	tijianfeiyong: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '体检费用',
		field: 'tijianfeiyong' // 映射数据库字段
	},
	yonghuzhanghao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '用户账号',
		field: 'yonghuzhanghao' // 映射数据库字段
	},
	yonghuxingming: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '用户姓名',
		field: 'yonghuxingming' // 映射数据库字段
	},
	xingbie: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '性别',
		field: 'xingbie' // 映射数据库字段
	},
	jigouzhanghao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '机构账号',
		field: 'jigouzhanghao' // 映射数据库字段
	},
	jigoumingcheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '机构名称',
		field: 'jigoumingcheng' // 映射数据库字段
	},
	quxiaoyuanyin: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '取消原因',
		field: 'quxiaoyuanyin' // 映射数据库字段
	},
	quxiaoshijian: {
		type: DataTypes.DATE,
		allowNull: true,
		set: function(value) {
			this.setDataValue('quxiaoshijian', value ? moment(value).format('YYYY-MM-DD HH:mm:ss') : null);
		},
		get() {
			const value = this.getDataValue('quxiaoshijian');
            return value ? moment(value).format('YYYY-MM-DD HH:mm:ss') : '';
        },
		comment: '取消时间',
		field: 'quxiaoshijian' // 映射数据库字段
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
	tableName: 'quxiaoyuyue'
})

export default QuxiaoyuyueModel
