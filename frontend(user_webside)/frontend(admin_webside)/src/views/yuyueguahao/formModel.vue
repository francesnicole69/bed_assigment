<template>
	<div>
		<el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="60%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
				<el-row >
					<el-col :span="24">
						<el-form-item label="reservation number" prop="yuyuebianhao">
							<el-input class="list_inp" v-model="form.yuyuebianhao" :readonly="true" placeholder="reservation number" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="Doctor's ID number" prop="yishenggonghao">
							<el-input class="list_inp" v-model="form.yishenggonghao" placeholder="Doctor's ID number"
                                type="text"
								:readonly="!isAdd||disabledForm.yishenggonghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="Doctor's Name" prop="yishengxingming">
							<el-input class="list_inp" v-model="form.yishengxingming" placeholder="Doctor's Name"
                                type="text"
								:readonly="!isAdd||disabledForm.yishengxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="Registration Fee" prop="guahaofei">
							<el-input class="list_inp" v-model.number="form.guahaofei" placeholder="Registration Fee"
                                type="number"
                                @mousewheel.native.prevent
								:readonly="!isAdd||disabledForm.guahaofei?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="Number of registrations" prop="keguashuliang">
							<el-input class="list_inp" v-model.number="form.keguashuliang" placeholder="Number of registrations"
                                type="text"
								:readonly="!isAdd||disabledForm.keguashuliang?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="appointment time" prop="yuyueshijian">
							<el-date-picker
								class="list_date"
								v-model="form.yuyueshijian"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.yuyueshijian?true:false"
								placeholder="Please select the appointment time." />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="User Account" prop="yonghuzhanghao">
							<el-input class="list_inp" v-model="form.yonghuzhanghao" placeholder="User Account"
                                type="text"
								:readonly="!isAdd||disabledForm.yonghuzhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="User Name" prop="yonghuxingming">
							<el-input class="list_inp" v-model="form.yonghuxingming" placeholder="User Name"
                                type="text"
								:readonly="!isAdd||disabledForm.yonghuxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="Institutional Account Number" prop="jigouzhanghao">
							<el-input class="list_inp" v-model="form.jigouzhanghao" placeholder="Institutional Account Number"
                                type="text"
								:readonly="!isAdd||disabledForm.jigouzhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="Institution Name" prop="jigoumingcheng">
							<el-input class="list_inp" v-model="form.jigoumingcheng" placeholder="Institution Name"
                                type="text"
								:readonly="!isAdd||disabledForm.jigoumingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="past medical history" prop="jiwangbingshi">
							<editor :value="form.jiwangbingshi" placeholder="Please enter past medical history" :readonly="!isAdd||disabledForm.jiwangbingshi?true:false"
								class="list_editor" @change="(e)=>editorChange(e,'jiwangbingshi')"></editor>
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
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
    const user = computed(()=>store.getters['user/session'])
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'yuyueguahao'
	const formName = '预约挂号'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
        yuyuebianhao : false,
        yishenggonghao : false,
        yishengxingming : false,
        guahaofei : false,
        keguashuliang : false,
        yuyueshijian : false,
        yonghuzhanghao : false,
        yonghuxingming : false,
        ispay : false,
        jiwangbingshi : false,
        jigouzhanghao : false,
        jigoumingcheng : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
    
	const rules = ref({
		yuyuebianhao: [
		],
		yishenggonghao: [
		],
		yishengxingming: [
		],
		guahaofei: [
			{ validator: context.$toolUtil.validator.number, trigger: 'blur' },
		],
		keguashuliang: [
			{ validator: context.$toolUtil.validator.intNumber, trigger: 'blur' },
		],
		yuyueshijian: [
		],
		yonghuzhanghao: [
		],
		yonghuxingming: [
		],
		ispay: [
		],
		jiwangbingshi: [
		],
		jigouzhanghao: [
		],
		jigoumingcheng: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			yuyuebianhao: getUUID(),
			yishenggonghao: '',
			yishengxingming: '',
			guahaofei: '',
			keguashuliang: '1',
			yuyueshijian: '',
			yonghuzhanghao: '',
			yonghuxingming: '',
			ispay: 'non-payment',
			jiwangbingshi: '',
			jigouzhanghao: '',
			jigoumingcheng: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			res.data.data.jiwangbingshi = res.data.data.jiwangbingshi?(res.data.data.jiwangbingshi.replace(reg,'../../../cl581915127/file')):'';
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
			form.value.yuyueshijian = context?.$toolUtil.getCurDateTime()
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
				if(x=='yuyuebianhao'){
					form.value.yuyuebianhao = row[x];
					disabledForm.value.yuyuebianhao = true;
					continue;
				}
				if(x=='yishenggonghao'){
					form.value.yishenggonghao = row[x];
					disabledForm.value.yishenggonghao = true;
					continue;
				}
				if(x=='yishengxingming'){
					form.value.yishengxingming = row[x];
					disabledForm.value.yishengxingming = true;
					continue;
				}
				if(x=='guahaofei'){
					form.value.guahaofei = row[x];
					disabledForm.value.guahaofei = true;
					continue;
				}
				if(x=='keguashuliang'){
					form.value.keguashuliang = row[x];
					disabledForm.value.keguashuliang = true;
					continue;
				}
				if(x=='yuyueshijian'){
					form.value.yuyueshijian = row[x];
					disabledForm.value.yuyueshijian = true;
					continue;
				}
				if(x=='yonghuzhanghao'){
					form.value.yonghuzhanghao = row[x];
					disabledForm.value.yonghuzhanghao = true;
					continue;
				}
				if(x=='yonghuxingming'){
					form.value.yonghuxingming = row[x];
					disabledForm.value.yonghuxingming = true;
					continue;
				}
				if(x=='jiwangbingshi'){
					form.value.jiwangbingshi = row[x];
					disabledForm.value.jiwangbingshi = true;
					continue;
				}
				if(x=='jigouzhanghao'){
					form.value.jigouzhanghao = row[x];
					disabledForm.value.jigouzhanghao = true;
					continue;
				}
				if(x=='jigoumingcheng'){
					form.value.jigoumingcheng = row[x];
					disabledForm.value.jigoumingcheng = true;
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
			form.value.keguashuliang='1'
			form.value.ispay='non-payment'
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(context?.$toolUtil.storageGet("role")!="管理员" && !context?.$toolUtil.storageGet("isAdmin")) {
				disabledForm.value.keguashuliang = true;
			}
			if(json.hasOwnProperty('yonghuzhanghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.yonghuzhanghao = json.yonghuzhanghao
				disabledForm.value.yonghuzhanghao = true;
			}
			if(json.hasOwnProperty('yonghuxingming')&& context?.$toolUtil.storageGet("role")!="管理员"){
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
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save= async ()=>{
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		if(objcross!='') {
            if(form.value.keguashuliang==0){
                return context.$message.error('The registration number cannot be left blank.')
            }
			objcross.keguashuliang = objcross.keguashuliang - form.value.keguashuliang
			if(objcross.keguashuliang<0){
				context?.$toolUtil.message('Insufficient registration number','error')
				return false
			}
		}
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
								//修改跨表数据
								await changeCrossData(objcross)
								emit('formModelChange')
								context?.$toolUtil.message(`operate successfully`,'success')
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
						//修改跨表数据
						await changeCrossData(objcross)
						emit('formModelChange')
						context?.$toolUtil.message(`operate successfully`,'success')
                        formVisible.value = false
					})
				}
			}else{
                context.$message.error('Please complete the information.')
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
				//日期选择器
				.list_date {
				}
				// 富文本
				.list_editor {
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
