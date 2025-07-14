import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from '../backend/src/models/sequelize'

// 健康数据
const JiankangshujuModel = sequelize.define('JiankangshujuModel', {
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
	nianling: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '年龄',
		field: 'nianling' // 映射数据库字段
	},
	tizhong: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '体重（kg）',
		field: 'tizhong' // 映射数据库字段
	},
	xueya: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '血压（mmHg）',
		field: 'xueya' // 映射数据库字段
	},
	xuetang: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '血糖（mg/dL）',
		field: 'xuetang' // 映射数据库字段
	},
	xinlv: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '心率（次/分）',
		field: 'xinlv' // 映射数据库字段
	},
	xuezhi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '血脂（mmol/L）',
		field: 'xuezhi' // 映射数据库字段
	},
	shuimianshijian: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '睡眠时间（天/小时）',
		field: 'shuimianshijian' // 映射数据库字段
	},
	zongdanguchun: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '总胆固醇（mg/dL）',
		field: 'zongdanguchun' // 映射数据库字段
	},
	xueyang: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '血氧（ bpm）',
		field: 'xueyang' // 映射数据库字段
	},
	dengjishijian: {
		type: DataTypes.DATE,
		allowNull: true,
		set: function(value) {
			this.setDataValue('dengjishijian', value ? moment(value).format('YYYY-MM-DD HH:mm:ss') : null);
		},
		get() {
			const value = this.getDataValue('dengjishijian');
            return value ? moment(value).format('YYYY-MM-DD HH:mm:ss') : '';
        },
		comment: '登记时间',
		field: 'dengjishijian' // 映射数据库字段
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
	tableName: 'jiankangshuju'
})

export default JiankangshujuModel
