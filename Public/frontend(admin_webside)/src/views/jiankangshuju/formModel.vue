<template>
	<div>
		<el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="60%"
			destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
				<el-row>
					<el-col :span="24">
						<el-form-item label="user account" prop="yonghuzhanghao">
							<el-input class="list_inp" v-model="form.yonghuzhanghao" placeholder="user account"
								type="text" :readonly="!isAdd || disabledForm.yonghuzhanghao ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="user name" prop="yonghuxingming">
							<el-input class="list_inp" v-model="form.yonghuxingming" placeholder="user name" type="text"
								:readonly="!isAdd || disabledForm.yonghuxingming ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="gender" prop="xingbie">
							<el-input class="list_inp" v-model="form.xingbie" placeholder="gender" type="text"
								:readonly="!isAdd || disabledForm.xingbie ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="age" prop="nianling">
							<el-input class="list_inp" v-model="form.nianling" placeholder="age" type="text"
								:readonly="!isAdd || disabledForm.nianling ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="weight (kg)" prop="tizhong">
							<el-input class="list_inp" v-model="form.tizhong" placeholder="weight (kg)" type="text"
								:readonly="!isAdd || disabledForm.tizhong ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="blood pressure (mmHg)" prop="xueya">
							<el-input class="list_inp" v-model="form.xueya" placeholder="blood pressure (mmHg)" type="text"
								:readonly="!isAdd || disabledForm.xueya ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="blood sugar (mg/dL)" prop="xuetang">
							<el-input class="list_inp" v-model="form.xuetang" placeholder="blood sugar (mg/dL)" type="text"
								:readonly="!isAdd || disabledForm.xuetang ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="heart rate (bpm)" prop="xinlv">
							<el-input class="list_inp" v-model="form.xinlv" placeholder="heart rate (bpm)" type="text"
								:readonly="!isAdd || disabledForm.xinlv ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="blood lipids (mmol/L)" prop="xuezhi">
							<el-input class="list_inp" v-model="form.xuezhi" placeholder="blood lipids (mmol/L)" type="text"
								:readonly="!isAdd || disabledForm.xuezhi ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="sleep duration (days/hours)" prop="shuimianshijian">
							<el-input class="list_inp" v-model="form.shuimianshijian" placeholder="sleep duration (days/hours)"
								type="text" :readonly="!isAdd || disabledForm.shuimianshijian ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="total cholesterol (mg/dL)" prop="zongdanguchun">
							<el-input class="list_inp" v-model="form.zongdanguchun" placeholder="total cholesterol (mg/dL)"
								type="text" :readonly="!isAdd || disabledForm.zongdanguchun ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="blood oxygen (bpm)" prop="xueyang">
							<el-input class="list_inp" v-model="form.xueyang" placeholder="blood oxygen (bpm)" type="text"
								:readonly="!isAdd || disabledForm.xueyang ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="registration time" prop="dengjishijian">
							<el-date-picker class="list_date" v-model="form.dengjishijian" format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss" type="datetime"
								:readonly="!isAdd || disabledForm.dengjishijian ? true : false" placeholder="Please select the registration time." />
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd || type == 'logistics' || type == 'reply'">
				<span class="formModel_btn_box">
					<el-button class="cancel_btn" @click="closeClick">Cancel</el-button>
					<el-button class="confirm_btn" type="primary" @click="save">
						Submit
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
import {
	reactive,
	ref,
	getCurrentInstance,
	nextTick,
	computed,
	defineEmits
} from 'vue'
import {
	useStore
} from 'vuex';
const store = useStore()
const user = computed(() => store.getters['user/session'])
const context = getCurrentInstance()?.appContext.config.globalProperties;
const emit = defineEmits(['formModelChange'])
//基础信息
const tableName = 'jiankangshuju'
const formName = '健康数据'
//基础信息
//form表单
const form = ref({})
const disabledForm = ref({
	yonghuzhanghao: false,
	yonghuxingming: false,
	xingbie: false,
	nianling: false,
	tizhong: false,
	xueya: false,
	xuetang: false,
	xinlv: false,
	xuezhi: false,
	shuimianshijian: false,
	zongdanguchun: false,
	xueyang: false,
	dengjishijian: false,
})
const formVisible = ref(false)
const isAdd = ref(false)
const formTitle = ref('')

const rules = ref({
	yonghuzhanghao: [
	],
	yonghuxingming: [
	],
	xingbie: [
	],
	nianling: [
	],
	tizhong: [
		{ required: true, message: 'Please enter', trigger: 'blur' },
	],
	xueya: [
		{ required: true, message: 'Please enter', trigger: 'blur' },
	],
	xuetang: [
		{ required: true, message: 'Please enter', trigger: 'blur' },
	],
	xinlv: [
		{ required: true, message: 'Please enter', trigger: 'blur' },
	],
	xuezhi: [
		{ required: true, message: 'Please enter', trigger: 'blur' },
	],
	shuimianshijian: [
		{ required: true, message: 'Please enter', trigger: 'blur' },
	],
	zongdanguchun: [
		{ required: true, message: 'Please enter', trigger: 'blur' },
	],
	xueyang: [
		{ required: true, message: 'Please enter', trigger: 'blur' },
	],
	dengjishijian: [
	],
})
//表单验证

const formRef = ref(null)
const id = ref(0)
const type = ref('')

//获取唯一标识
const getUUID = () => {
	return new Date().getTime();
}
//重置
const resetForm = () => {
	form.value = {
		yonghuzhanghao: '',
		yonghuxingming: '',
		xingbie: '',
		nianling: '',
		tizhong: '',
		xueya: '',
		xuetang: '',
		xinlv: '',
		xuezhi: '',
		shuimianshijian: '',
		zongdanguchun: '',
		xueyang: '',
		dengjishijian: '',
	}
}
//获取info
const getInfo = () => {
	context?.$http({
		url: `${tableName}/info/${id.value}`,
		method: 'get'
	}).then(res => {
		let reg = new RegExp('../../../file', 'g')
		form.value = res.data.data
		formVisible.value = true
	})
}
const crossRow = ref('')
const crossTable = ref('')
const crossTips = ref('')
const crossColumnName = ref('')
const crossColumnValue = ref('')
//初始化
const init = (formId = null, formType = 'add', formNames = '', row = null, table = null, statusColumnName = null, tips = null, statusColumnValue = null) => {
	resetForm()
	form.value.dengjishijian = context?.$toolUtil.getCurDateTime()
	if (formId) {
		id.value = formId
		type.value = formType
	}
	if (formType == 'add') {
		isAdd.value = true
		formTitle.value = 'add ' + formName
		formVisible.value = true
	} else if (formType == 'info') {
		isAdd.value = false
		formTitle.value = 'view ' + formName
		getInfo()
	} else if (formType == 'edit') {
		isAdd.value = true
		formTitle.value = 'edit ' + formName
		getInfo()
	}
	else if (formType == 'cross') {
		isAdd.value = true
		formTitle.value = formNames
		// getInfo()
		for (let x in row) {
			if (x == 'yonghuzhanghao') {
				form.value.yonghuzhanghao = row[x];
				disabledForm.value.yonghuzhanghao = true;
				continue;
			}
			if (x == 'yonghuxingming') {
				form.value.yonghuxingming = row[x];
				disabledForm.value.yonghuxingming = true;
				continue;
			}
			if (x == 'xingbie') {
				form.value.xingbie = row[x];
				disabledForm.value.xingbie = true;
				continue;
			}
			if (x == 'nianling') {
				form.value.nianling = row[x];
				disabledForm.value.nianling = true;
				continue;
			}
			if (x == 'tizhong') {
				form.value.tizhong = row[x];
				disabledForm.value.tizhong = true;
				continue;
			}
			if (x == 'xueya') {
				form.value.xueya = row[x];
				disabledForm.value.xueya = true;
				continue;
			}
			if (x == 'xuetang') {
				form.value.xuetang = row[x];
				disabledForm.value.xuetang = true;
				continue;
			}
			if (x == 'xinlv') {
				form.value.xinlv = row[x];
				disabledForm.value.xinlv = true;
				continue;
			}
			if (x == 'xuezhi') {
				form.value.xuezhi = row[x];
				disabledForm.value.xuezhi = true;
				continue;
			}
			if (x == 'shuimianshijian') {
				form.value.shuimianshijian = row[x];
				disabledForm.value.shuimianshijian = true;
				continue;
			}
			if (x == 'zongdanguchun') {
				form.value.zongdanguchun = row[x];
				disabledForm.value.zongdanguchun = true;
				continue;
			}
			if (x == 'xueyang') {
				form.value.xueyang = row[x];
				disabledForm.value.xueyang = true;
				continue;
			}
			if (x == 'dengjishijian') {
				form.value.dengjishijian = row[x];
				disabledForm.value.dengjishijian = true;
				continue;
			}
		}
		if (row) {
			crossRow.value = row
		}
		if (table) {
			crossTable.value = table
		}
		if (tips) {
			crossTips.value = tips
		}
		if (statusColumnName) {
			crossColumnName.value = statusColumnName
		}
		if (statusColumnValue) {
			crossColumnValue.value = statusColumnValue
		}
		formVisible.value = true
	}

	context?.$http({
		url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
		method: 'get'
	}).then(res => {
		var json = res.data.data
		if (json.hasOwnProperty('yonghuzhanghao') && context?.$toolUtil.storageGet("role") != "管理员") {
			form.value.yonghuzhanghao = json.yonghuzhanghao
			disabledForm.value.yonghuzhanghao = true;
		}
		if (json.hasOwnProperty('yonghuxingming') && context?.$toolUtil.storageGet("role") != "管理员") {
			form.value.yonghuxingming = json.yonghuxingming
			disabledForm.value.yonghuxingming = true;
		}
		if (json.hasOwnProperty('xingbie') && context?.$toolUtil.storageGet("role") != "管理员") {
			form.value.xingbie = json.xingbie
			disabledForm.value.xingbie = true;
		}
		if (json.hasOwnProperty('nianling') && context?.$toolUtil.storageGet("role") != "管理员") {
			form.value.nianling = json.nianling
			disabledForm.value.nianling = true;
		}
	})
}
//初始化
//声明父级调用
defineExpose({
	init
})
//关闭
const closeClick = () => {
	formVisible.value = false
}
//富文本
const editorChange = (e, name) => {
	form.value[name] = e
}
//提交
const save = async () => {
	var table = crossTable.value
	var objcross = JSON.parse(JSON.stringify(crossRow.value))
	let crossUserId = ''
	let crossRefId = ''
	let crossOptNum = ''
	if (type.value == 'cross') {
		if (crossColumnName.value != '') {
			if (!crossColumnName.value.startsWith('[')) {
				for (let o in objcross) {
					if (o == crossColumnName.value) {
						objcross[o] = crossColumnValue.value
					}
				}
				//修改跨表数据
				changeCrossData(objcross)
			} else {
				crossUserId = user.value.id
				crossRefId = objcross['id']
				crossOptNum = crossColumnName.value.replace(/\[/, "").replace(/\]/, "")
			}
		}
	}
	formRef.value.validate((valid) => {
		if (valid) {
			if (crossUserId && crossRefId) {
				form.value.crossuserid = crossUserId
				form.value.crossrefid = crossRefId
				let params = {
					page: 1,
					limit: 1000,
					crossuserid: form.value.crossuserid,
					crossrefid: form.value.crossrefid,
				}
				context?.$http({
					url: `${tableName}/page`,
					method: 'get',
					params: params
				}).then(res => {
					if (res.data.data.total >= crossOptNum) {
						context?.$toolUtil.message(`${crossTips.value}`, 'error')
						return false
					} else {
						context?.$http({
							url: `${tableName}/${!form.value.id ? "save" : "update"}`,
							method: 'post',
							data: form.value
						}).then(async res => {
							emit('formModelChange')
							context?.$toolUtil.message(`operate successfully`, 'success')
							formVisible.value = false
						})
					}
				})
			} else {
				context?.$http({
					url: `${tableName}/${!form.value.id ? "save" : "update"}`,
					method: 'post',
					data: form.value
				}).then(async (res) => {
					emit('formModelChange')
					context?.$toolUtil.message(`operate successfully`, 'success')
					formVisible.value = false
				})
			}
		} else {
			context.$message.error('Please complete the information.')
		}
	})
}
//修改跨表数据
const changeCrossData = async (row) => {
	if (type.value == 'cross') {
		await context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res => { })
	}
}
</script>
<style lang="scss" scoped>
// 表单
.formModel_form {

	// form item
	:deep(.el-form-item) {

		//label
		.el-form-item__label {}

		// 内容盒子
		.el-form-item__content {

			// 输入框
			.list_inp {}

			//日期选择器
			.list_date {}
		}
	}
}

// 按钮盒子
.formModel_btn_box {
	.cancel_btn {}

	.cancel_btn:hover {}

	.confirm_btn {}

	.confirm_btn:hover {}
}
</style>
