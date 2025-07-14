import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 医生坐诊
const YishengzuozhenModel = sequelize.define('YishengzuozhenModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	touxiang: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '头像',
		field: 'touxiang' // 映射数据库字段
	},
	yishenggonghao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '医生工号',
		field: 'yishenggonghao' // 映射数据库字段
	},
	yishengxingming: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '医生姓名',
		field: 'yishengxingming' // 映射数据库字段
	},
	xingbie: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '性别',
		field: 'xingbie' // 映射数据库字段
	},
	zhicheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '职称',
		field: 'zhicheng' // 映射数据库字段
	},
	keshi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '科室',
		field: 'keshi' // 映射数据库字段
	},
	shanzhanglingyu: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '擅长领域',
		field: 'shanzhanglingyu' // 映射数据库字段
	},
	lianxifangshi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '联系方式',
		field: 'lianxifangshi' // 映射数据库字段
	},
	zuozhenshijian: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '坐诊时间',
		field: 'zuozhenshijian' // 映射数据库字段
	},
	guahaofei: {
		type: DataTypes.DOUBLE,
		defaultValue: 0,
		allowNull: true,
		comment: '挂号费',
		field: 'guahaofei' // 映射数据库字段
	},
	keguashuliang: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '可挂数量',
		field: 'keguashuliang' // 映射数据库字段
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
	tableName: 'yishengzuozhen'
})

export default YishengzuozhenModel
