import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 体检项目
const TijianxiangmuModel = sequelize.define('TijianxiangmuModel', {
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
	tijiantupian: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '体检图片',
		field: 'tijiantupian' // 映射数据库字段
	},
	tijiandidian: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '体检地点',
		field: 'tijiandidian' // 映射数据库字段
	},
	keyuerenshu: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '可约人数',
		field: 'keyuerenshu' // 映射数据库字段
	},
	tijianfeiyong: {
		type: DataTypes.DOUBLE,
		defaultValue: 0,
		allowNull: true,
		comment: '体检费用',
		field: 'tijianfeiyong' // 映射数据库字段
	},
	tijianliucheng: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '体检流程',
		field: 'tijianliucheng' // 映射数据库字段
	},
	fabushijian: {
		type: DataTypes.DATE,
		allowNull: true,
		set: function(value) {
			this.setDataValue('fabushijian', value ? moment(value).format('YYYY-MM-DD HH:mm:ss') : null);
		},
		get() {
			const value = this.getDataValue('fabushijian');
            return value ? moment(value).format('YYYY-MM-DD HH:mm:ss') : '';
        },
		comment: '发布时间',
		field: 'fabushijian' // 映射数据库字段
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
	sfsh: {
		type: DataTypes.STRING,
		defaultValue: '待审核',
		allowNull: true,
		comment: '是否审核',
		field: 'sfsh' // 映射数据库字段
	},
	shhf: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '回复内容',
		field: 'shhf' // 映射数据库字段
	},
	storeupNumber: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '收藏数',
		field: 'storeup_number' // 映射数据库字段
	},
	clicktime: {
		type: DataTypes.DATE,
		allowNull: true,
		set: function(value) {
			this.setDataValue('clicktime', value ? moment(value).format('YYYY-MM-DD HH:mm:ss') : null);
		},
		get() {
			const value = this.getDataValue('clicktime');
            return value ? moment(value).format('YYYY-MM-DD HH:mm:ss') : '';
        },
		comment: '最近点击时间',
		field: 'clicktime' // 映射数据库字段
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
	tableName: 'tijianxiangmu'
})

export default TijianxiangmuModel
