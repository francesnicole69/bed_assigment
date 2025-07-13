<template>
	<div>
		<el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="60%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
				<el-row >
					<el-col :span="24">
						<el-form-item label="administrative office" prop="keshi">
							<el-input class="list_inp" v-model="form.keshi" placeholder="administrative office"
                                type="text"
								:readonly="!isAdd||disabledForm.keshi?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="administrative office location" prop="keshiweizhi">
							<el-input class="list_inp" v-model="form.keshiweizhi" placeholder="administrative office location"
                                type="text"
								:readonly="!isAdd||disabledForm.keshiweizhi?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="doctor account" prop="yishengzhanghao">
							<el-input class="list_inp" v-model="form.yishengzhanghao" placeholder="doctor account"
                                type="text"
								:readonly="!isAdd||disabledForm.yishengzhanghao?true:false" />
							<!-- <el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.yishengzhanghao?true:false"
								v-model="form.yishengzhanghaos" 
								placeholder="please select doctor account"
								multiple
								@change="keshiyishengzhanghaoChange">
								<el-option v-for="(item,index) in yishengzhanghaoLists" :label="item" :value="item">
								</el-option>
							</el-select> -->
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="cancel_btn" @click="closeClick">Cancel</el-button>
					<el-button class="confirm_btn" type="primary" @click="save"
						>
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
    const user = computed(()=>store.getters['user/session'])
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'keshi'
	const formName = 'administrative office'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
        keshi : false,
        keshiweizhi : false,
        yishengzhanghao : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
    
	const rules = ref({
		keshi: [
			{required: true,message: 'Please enter',trigger: 'blur'}, 
		],
		keshiweizhi: [
		],
		yishengzhanghao: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//医生账号列表
	const yishengzhanghaoLists = ref([])

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			keshi: '',
			keshiweizhi: '',
			yishengzhanghao: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			if(res.data.data.yishengzhanghao){
				res.data.data.yishengzhanghaos = res.data.data.yishengzhanghao.split(",")
			}else{
				res.data.data.yishengzhanghaos = []
			}
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
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = 'add ' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = 'view ' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = 'edit ' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='keshi'){
					form.value.keshi = row[x];
					disabledForm.value.keshi = true;
					continue;
				}
				if(x=='keshiweizhi'){
					form.value.keshiweizhi = row[x];
					disabledForm.value.keshiweizhi = true;
					continue;
				}
				if(x=='yishengzhanghao'){
					form.value.yishengzhanghao = row[x];
					disabledForm.value.yishengzhanghao = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
		})
		// context?.$http({
		// 	url: `option/yisheng/yishengzhanghao`,
		// 	method: 'get'
		// }).then(res=>{
		// 	yishengzhanghaoLists.value = res.data.data
		// })
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
	const keshiyishengzhanghaoChange= ()=> {
		form.value.yishengzhanghao = form.value.yishengzhanghaos.join(',')
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save= async ()=>{
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = user.value.id
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(async res=>{
								emit('formModelChange')
								context?.$toolUtil.message(`Operation successful`,'success')
                                formVisible.value = false
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(async (res)=>{
						emit('formModelChange')
						context?.$toolUtil.message(`Operation successful`,'success')
                        formVisible.value = false
					})
				}
			}else{
                context.$message.error('Please complete the information')
            }
		})
	}
	//修改跨表数据
	const changeCrossData = async (row)=>{
        if(type.value == 'cross'){
            await context?.$http({
                url: `${crossTable.value}/update`,
                method: 'post',
                data: row
            }).then(res=>{})
        }
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		// form item
		:deep(.el-form-item) {
			//label
			.el-form-item__label {
			}
			// 内容盒子
			.el-form-item__content {
				// 输入框
				.list_inp {
				}
				// 下拉框
				.list_sel {
					//去掉默认样式
					.select-trigger{
						height: 100%;
						.el-input{
							height: 100%;
						}
					}
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		.cancel_btn {
		}
		.cancel_btn:hover {
		}
		
		.confirm_btn {
		}
		.confirm_btn:hover {
		}
	}
</style>
