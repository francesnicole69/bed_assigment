<template>
	<div>
		<el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="60%"
			destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
				<el-row>
					<el-col :span="24">
						<el-form-item label="physical examination item" prop="tijianxiangmu">
							<el-input class="list_inp" v-model="form.tijianxiangmu" placeholder="physical examination item" type="text"
								:readonly="!isAdd || disabledForm.tijianxiangmu ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="physical examination type" prop="tijianleixing">
							<el-input class="list_inp" v-model="form.tijianleixing" placeholder="physical examination type" type="text"
								:readonly="!isAdd || disabledForm.tijianleixing ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="physical examination location" prop="tijiandidian">
							<el-input class="list_inp" v-model="form.tijiandidian" placeholder="physical examination location" type="text"
								:readonly="!isAdd || disabledForm.tijiandidian ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="physical examination fee" prop="tijianfeiyong">
							<el-input class="list_inp" v-model.number="form.tijianfeiyong" placeholder="physical examination fee"
								type="text" :readonly="!isAdd || disabledForm.tijianfeiyong ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="user account" prop="yonghuzhanghao">
							<el-input class="list_inp" v-model="form.yonghuzhanghao" placeholder="user account" type="text"
								:readonly="!isAdd || disabledForm.yonghuzhanghao ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="user name" prop="yonghuxingming">
							<el-input class="list_inp" v-model="form.yonghuxingming" placeholder="user name" type="text"
								:readonly="!isAdd || disabledForm.yonghuxingming ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="institutional account number" prop="jigouzhanghao">
							<el-input class="list_inp" v-model="form.jigouzhanghao" placeholder="institutional account number" type="text"
								:readonly="!isAdd || disabledForm.jigouzhanghao ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="institution name" prop="jigoumingcheng">
							<el-input class="list_inp" v-model="form.jigoumingcheng" placeholder="institution name" type="text"
								:readonly="!isAdd || disabledForm.jigoumingcheng ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="report details" prop="baogaoxiangqing">
							<uploads :disabled="!isAdd || disabledForm.baogaoxiangqing ? true : false" type="file"
								action="file/upload" tip="Please upload report details" :limit="1" style="width: 100%;text-align: left;"
								:fileUrls="form.baogaoxiangqing ? form.baogaoxiangqing : ''"
								@change="baogaoxiangqingUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="report time" prop="baogaoshijian">
							<el-date-picker class="list_date" v-model="form.baogaoshijian" format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss" type="datetime"
								:readonly="!isAdd || disabledForm.baogaoshijian ? true : false" placeholder="Please select report time" />
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd || type == 'logistics' || type == 'reply'">
				<span class="formModel_btn_box">
					<el-button class="cancel_btn" @click="closeClick">cancel</el-button>
					<el-button class="confirm_btn" type="primary" @click="save">
						submit
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
const tableName = 'tijianbaogao'
const formName = 'medical examination report'
//基础信息
//form表单
const form = ref({})
const disabledForm = ref({
	tijianxiangmu: false,
	tijianleixing: false,
	tijiandidian: false,
	tijianfeiyong: false,
	yonghuzhanghao: false,
	yonghuxingming: false,
	jigouzhanghao: false,
	jigoumingcheng: false,
	baogaoxiangqing: false,
	baogaoshijian: false,
})
const formVisible = ref(false)
const isAdd = ref(false)
const formTitle = ref('')

const rules = ref({
	tijianxiangmu: [
	],
	tijianleixing: [
	],
	tijiandidian: [
	],
	tijianfeiyong: [
		{ validator: context.$toolUtil.validator.intNumber, trigger: 'blur' },
	],
	yonghuzhanghao: [
	],
	yonghuxingming: [
	],
	jigouzhanghao: [
	],
	jigoumingcheng: [
	],
	baogaoxiangqing: [
	],
	baogaoshijian: [
	],
})
//表单验证

const formRef = ref(null)
const id = ref(0)
const type = ref('')
//报告详情上传回调
const baogaoxiangqingUploadSuccess = (e) => {
	form.value.baogaoxiangqing = e
}

//获取唯一标识
const getUUID = () => {
	return new Date().getTime();
}
//重置
const resetForm = () => {
	form.value = {
		tijianxiangmu: '',
		tijianleixing: '',
		tijiandidian: '',
		tijianfeiyong: '',
		yonghuzhanghao: '',
		yonghuxingming: '',
		jigouzhanghao: '',
		jigoumingcheng: '',
		baogaoxiangqing: '',
		baogaoshijian: '',
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
	form.value.baogaoshijian = context?.$toolUtil.getCurDateTime()
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
			if (x == 'tijianxiangmu') {
				form.value.tijianxiangmu = row[x];
				disabledForm.value.tijianxiangmu = true;
				continue;
			}
			if (x == 'tijianleixing') {
				form.value.tijianleixing = row[x];
				disabledForm.value.tijianleixing = true;
				continue;
			}
			if (x == 'tijiandidian') {
				form.value.tijiandidian = row[x];
				disabledForm.value.tijiandidian = true;
				continue;
			}
			if (x == 'tijianfeiyong') {
				form.value.tijianfeiyong = row[x];
				disabledForm.value.tijianfeiyong = true;
				continue;
			}
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
			if (x == 'jigouzhanghao') {
				form.value.jigouzhanghao = row[x];
				disabledForm.value.jigouzhanghao = true;
				continue;
			}
			if (x == 'jigoumingcheng') {
				form.value.jigoumingcheng = row[x];
				disabledForm.value.jigoumingcheng = true;
				continue;
			}
			if (x == 'baogaoxiangqing') {
				form.value.baogaoxiangqing = row[x];
				disabledForm.value.baogaoxiangqing = true;
				continue;
			}
			if (x == 'baogaoshijian') {
				form.value.baogaoshijian = row[x];
				disabledForm.value.baogaoshijian = true;
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
	if (form.value.baogaoxiangqing != null) {
		form.value.baogaoxiangqing = form.value.baogaoxiangqing.replace(new RegExp(context?.$config.url, "g"), "");
	}
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

			//文件上传样式
			.upload-demo {
				width: 100%;

				//外部盒子
				.el-upload-dragger {}

				//图标
				.el-icon--upload {}

				//提示文字
				.el-upload__text {
					em {}
				}

				//提示文字
				.el-upload__tip {}
			}
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
