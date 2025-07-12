<template>
	<div>
		<el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="60%"
			destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
				<el-row>
					<el-col :span="24">
						<el-form-item label="physical examination item" prop="tijianxiangmu">
							<el-input class="list_inp" v-model="form.tijianxiangmu"
								placeholder="physical examination item" type="text"
								:readonly="!isAdd || disabledForm.tijianxiangmu ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="physical examination type" prop="tijianleixing">
							<el-select class="list_sel" :disabled="!isAdd || disabledForm.tijianleixing ? true : false"
								v-model="form.tijianleixing" placeholder="Please select physical examination type">
								<el-option v-for="(item, index) in tijianleixingLists" :label="item" :value="item">
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item prop="tijiantupian" label="Medical examination photos">
							<uploads :disabled="!isAdd || disabledForm.tijiantupian ? true : false" action="file/upload"
								tip="Please upload medical examination photos" style="width: 100%;text-align: left;"
								:fileUrls="form.tijiantupian ? form.tijiantupian : ''" @change="tijiantupianUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="Medical examination location" prop="tijiandidian">
							<el-input class="list_inp" v-model="form.tijiandidian" placeholder="Medical examination location" type="text"
								:readonly="!isAdd || disabledForm.tijiandidian ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="number of reservations" prop="keyuerenshu">
							<el-input class="list_inp" v-model.number="form.keyuerenshu" placeholder="number of reservations" type="text"
								:readonly="!isAdd || disabledForm.keyuerenshu ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="Medical examination cost" prop="tijianfeiyong">
							<el-input class="list_inp" v-model.number="form.tijianfeiyong" placeholder="Medical examination cost"
								type="number" @mousewheel.native.prevent
								:readonly="!isAdd || disabledForm.tijianfeiyong ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="Release time" prop="fabushijian">
							<el-date-picker class="list_date" v-model="form.fabushijian" format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss" type="datetime"
								:readonly="!isAdd || disabledForm.fabushijian ? true : false" placeholder="Please select release time" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="Institutional Account Number" prop="jigouzhanghao">
							<el-input class="list_inp" v-model="form.jigouzhanghao" placeholder="Institutional Account Number" type="text"
								:readonly="!isAdd || disabledForm.jigouzhanghao ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="Institution Name" prop="jigoumingcheng">
							<el-input class="list_inp" v-model="form.jigoumingcheng" placeholder="Institution Name" type="text"
								:readonly="!isAdd || disabledForm.jigoumingcheng ? true : false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="Physical examination process" prop="tijianliucheng">
							<editor :value="form.tijianliucheng" placeholder="Please enter the physical examination process"
								:readonly="!isAdd || disabledForm.tijianliucheng ? true : false" class="list_editor"
								@change="(e) => editorChange(e, 'tijianliucheng')"></editor>
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
const tableName = 'tijianxiangmu'
const formName = 'physical examination item'
//基础信息
//form表单
const form = ref({})
const disabledForm = ref({
	tijianxiangmu: false,
	tijianleixing: false,
	tijiantupian: false,
	tijiandidian: false,
	keyuerenshu: false,
	tijianfeiyong: false,
	tijianliucheng: false,
	fabushijian: false,
	jigouzhanghao: false,
	jigoumingcheng: false,
	sfsh: false,
	shhf: false,
	storeupNumber: false,
	clicktime: false,
})
const formVisible = ref(false)
const isAdd = ref(false)
const formTitle = ref('')

const rules = ref({
	tijianxiangmu: [
	],
	tijianleixing: [
	],
	tijiantupian: [
	],
	tijiandidian: [
	],
	keyuerenshu: [
		{ validator: context.$toolUtil.validator.intNumber, trigger: 'blur' },
	],
	tijianfeiyong: [
		{ validator: context.$toolUtil.validator.number, trigger: 'blur' },
	],
	tijianliucheng: [
	],
	fabushijian: [
	],
	jigouzhanghao: [
	],
	jigoumingcheng: [
	],
	sfsh: [
	],
	shhf: [
	],
	storeupNumber: [
		{ validator: context.$toolUtil.validator.intNumber, trigger: 'blur' },
	],
	clicktime: [
	],
})
//表单验证

const formRef = ref(null)
const id = ref(0)
const type = ref('')
//体检类型列表
const tijianleixingLists = ref([])
//体检图片上传回调
const tijiantupianUploadSuccess = (e) => {
	form.value.tijiantupian = e
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
		tijiantupian: '',
		tijiandidian: '',
		keyuerenshu: '',
		tijianfeiyong: '',
		tijianliucheng: '',
		fabushijian: '',
		jigouzhanghao: '',
		jigoumingcheng: '',
		sfsh: 'Pending Review',
		shhf: '',
		clicktime: '',
	}
}
//获取info
const getInfo = () => {
	context?.$http({
		url: `${tableName}/info/${id.value}`,
		method: 'get'
	}).then(res => {
		let reg = new RegExp('../../../file', 'g')
		res.data.data.tijianliucheng = res.data.data.tijianliucheng ? (res.data.data.tijianliucheng.replace(reg, '../../../cl581915127/file')) : '';
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
	form.value.fabushijian = context?.$toolUtil.getCurDateTime()
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
			if (x == 'tijiantupian') {
				form.value.tijiantupian = row[x];
				disabledForm.value.tijiantupian = true;
				continue;
			}
			if (x == 'tijiandidian') {
				form.value.tijiandidian = row[x];
				disabledForm.value.tijiandidian = true;
				continue;
			}
			if (x == 'keyuerenshu') {
				form.value.keyuerenshu = row[x];
				disabledForm.value.keyuerenshu = true;
				continue;
			}
			if (x == 'tijianfeiyong') {
				form.value.tijianfeiyong = row[x];
				disabledForm.value.tijianfeiyong = true;
				continue;
			}
			if (x == 'tijianliucheng') {
				form.value.tijianliucheng = row[x];
				disabledForm.value.tijianliucheng = true;
				continue;
			}
			if (x == 'fabushijian') {
				form.value.fabushijian = row[x];
				disabledForm.value.fabushijian = true;
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
			if (x == 'storeupNumber') {
				form.value.storeupNumber = row[x];
				disabledForm.value.storeupNumber = true;
				continue;
			}
			if (x == 'clicktime') {
				form.value.clicktime = row[x];
				disabledForm.value.clicktime = true;
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
		form.value.sfsh = '待审核'
		formVisible.value = true
	}

	context?.$http({
		url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
		method: 'get'
	}).then(res => {
		var json = res.data.data
		if (json.hasOwnProperty('jigouzhanghao') && context?.$toolUtil.storageGet("role") != "管理员") {
			form.value.jigouzhanghao = json.jigouzhanghao
			disabledForm.value.jigouzhanghao = true;
		}
		if (json.hasOwnProperty('jigoumingcheng') && context?.$toolUtil.storageGet("role") != "管理员") {
			form.value.jigoumingcheng = json.jigoumingcheng
			disabledForm.value.jigoumingcheng = true;
		}
	})
	context?.$http({
		url: `option/tijianleixing/tijianleixing`,
		method: 'get'
	}).then(res => {
		tijianleixingLists.value = res.data.data
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
	if (form.value.tijiantupian != null) {
		form.value.tijiantupian = form.value.tijiantupian.replace(new RegExp(context?.$config.url, "g"), "");
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
							context?.$toolUtil.message(`Operation successful`, 'success')
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
					context?.$toolUtil.message(`Operation successful`, 'success')
					formVisible.value = false
				})
			}
		} else {
			context.$message.error('Please complete the information')
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

			// 下拉框
			.list_sel {

				//去掉默认样式
				.select-trigger {
					height: 100%;

					.el-input {
						height: 100%;
					}
				}
			}

			// 富文本
			.list_editor {}

			//图片上传样式
			.el-upload-list {

				//提示语
				.el-upload__tip {}

				//外部盒子
				.el-upload--picture-card {

					//图标
					.el-icon {}
				}

				.el-upload-list__item {}
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
