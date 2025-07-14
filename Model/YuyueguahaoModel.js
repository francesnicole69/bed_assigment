import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 预约挂号
const YuyueguahaoModel = sequelize.define('YuyueguahaoModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	yuyuebianhao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '预约编号',
		field: 'yuyuebianhao' // 映射数据库字段
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
		comment: '挂号数',
		field: 'keguashuliang' // 映射数据库字段
	},
	yuyueshijian: {
		type: DataTypes.DATE,
		allowNull: true,
		set: function(value) {
			this.setDataValue('yuyueshijian', value ? moment(value).format('YYYY-MM-DD HH:mm:ss') : null);
		},
		get() {
			const value = this.getDataValue('yuyueshijian');
            return value ? moment(value).format('YYYY-MM-DD HH:mm:ss') : '';
        },
		comment: '预约时间',
		field: 'yuyueshijian' // 映射数据库字段
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
	ispay: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '是否支付',
		field: 'ispay' // 映射数据库字段
	},
	jiwangbingshi: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '既往病史',
		field: 'jiwangbingshi' // 映射数据库字段
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
	tableName: 'yuyueguahao'
})

export default YuyueguahaoModel
