<template>
	<div>
		<el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="60%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
				<el-row >
					<el-col :span="24">
						<el-form-item prop="touxiang"
									  label="头像"
						>
							<uploads
								:disabled="!isAdd||disabledForm.touxiang?true:false"
								action="file/upload"
								tip="请上传头像"
								style="width: 100%;text-align: left;"
								:fileUrls="form.touxiang?form.touxiang:''" 
								@change="touxiangUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="医生工号" prop="yishenggonghao">
							<el-input class="list_inp" v-model="form.yishenggonghao" placeholder="医生工号"
                                type="text"
								:readonly="!isAdd||disabledForm.yishenggonghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="医生姓名" prop="yishengxingming">
							<el-input class="list_inp" v-model="form.yishengxingming" placeholder="医生姓名"
                                type="text"
								:readonly="!isAdd||disabledForm.yishengxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="性别" prop="xingbie">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.xingbie?true:false"
								v-model="form.xingbie" 
								placeholder="请选择性别"
								>
								<el-option v-for="(item,index) in xingbieLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="职称" prop="zhicheng">
							<el-input class="list_inp" v-model="form.zhicheng" placeholder="职称"
                                type="text"
								:readonly="!isAdd||disabledForm.zhicheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="科室" prop="keshi">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.keshi?true:false"
								v-model="form.keshi" 
								placeholder="请选择科室"
								>
								<el-option v-for="(item,index) in keshiLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="擅长领域" prop="shanzhanglingyu">
							<el-input class="list_inp" v-model="form.shanzhanglingyu" placeholder="擅长领域"
                                type="text"
								:readonly="!isAdd||disabledForm.shanzhanglingyu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="联系方式" prop="lianxifangshi">
							<el-input class="list_inp" v-model="form.lianxifangshi" placeholder="联系方式"
                                type="text"
								:readonly="!isAdd||disabledForm.lianxifangshi?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="坐诊时间" prop="zuozhenshijian">
							<el-input class="list_inp" v-model="form.zuozhenshijian" placeholder="坐诊时间"
                                type="text"
								:readonly="!isAdd||disabledForm.zuozhenshijian?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="挂号费" prop="guahaofei">
							<el-input class="list_inp" v-model.number="form.guahaofei" placeholder="挂号费"
                                type="number"
                                @mousewheel.native.prevent
								:readonly="!isAdd||disabledForm.guahaofei?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="可挂数量" prop="keguashuliang">
							<el-input class="list_inp" v-model.number="form.keguashuliang" placeholder="可挂数量"
                                type="text"
								:readonly="!isAdd||disabledForm.keguashuliang?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="机构账号" prop="jigouzhanghao">
							<el-input class="list_inp" v-model="form.jigouzhanghao" placeholder="机构账号"
                                type="text"
								:readonly="!isAdd||disabledForm.jigouzhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="机构名称" prop="jigoumingcheng">
							<el-input class="list_inp" v-model="form.jigoumingcheng" placeholder="机构名称"
                                type="text"
								:readonly="!isAdd||disabledForm.jigoumingcheng?true:false" />
						</el-form-item>
					</el-col>

				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="cancel_btn" @click="closeClick">取消</el-button>
					<el-button class="confirm_btn" type="primary" @click="save"
						>
						提交
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
	const tableName = 'yishengzuozhen'
	const formName = '医生坐诊'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
        touxiang : false,
        yishenggonghao : false,
        yishengxingming : false,
        xingbie : false,
        zhicheng : false,
        keshi : false,
        shanzhanglingyu : false,
        lianxifangshi : false,
        zuozhenshijian : false,
        guahaofei : false,
        keguashuliang : false,
        jigouzhanghao : false,
        jigoumingcheng : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
    
	const rules = ref({
		touxiang: [
		],
		yishenggonghao: [
		],
		yishengxingming: [
		],
		xingbie: [
		],
		zhicheng: [
		],
		keshi: [
		],
		shanzhanglingyu: [
		],
		lianxifangshi: [
		],
		zuozhenshijian: [
		],
		guahaofei: [
			{ validator: context.$toolUtil.validator.number, trigger: 'blur' },
		],
		keguashuliang: [
			{ validator: context.$toolUtil.validator.intNumber, trigger: 'blur' },
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
	//头像上传回调
	const touxiangUploadSuccess=(e)=>{
		form.value.touxiang = e
	}
	//性别列表
	const xingbieLists = ref([])
	//科室列表
	const keshiLists = ref([])

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			touxiang: '',
			yishenggonghao: '',
			yishengxingming: '',
			xingbie: '',
			zhicheng: '',
			keshi: '',
			shanzhanglingyu: '',
			lianxifangshi: '',
			zuozhenshijian: '',
			guahaofei: '',
			keguashuliang: '',
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
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='touxiang'){
					form.value.touxiang = row[x];
					disabledForm.value.touxiang = true;
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
				if(x=='xingbie'){
					form.value.xingbie = row[x];
					disabledForm.value.xingbie = true;
					continue;
				}
				if(x=='zhicheng'){
					form.value.zhicheng = row[x];
					disabledForm.value.zhicheng = true;
					continue;
				}
				if(x=='keshi'){
					form.value.keshi = row[x];
					disabledForm.value.keshi = true;
					continue;
				}
				if(x=='shanzhanglingyu'){
					form.value.shanzhanglingyu = row[x];
					disabledForm.value.shanzhanglingyu = true;
					continue;
				}
				if(x=='lianxifangshi'){
					form.value.lianxifangshi = row[x];
					disabledForm.value.lianxifangshi = true;
					continue;
				}
				if(x=='zuozhenshijian'){
					form.value.zuozhenshijian = row[x];
					disabledForm.value.zuozhenshijian = true;
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
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('jigouzhanghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.jigouzhanghao = json.jigouzhanghao
				disabledForm.value.jigouzhanghao = true;
			}
			if(json.hasOwnProperty('jigoumingcheng')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.jigoumingcheng = json.jigoumingcheng
				disabledForm.value.jigoumingcheng = true;
			}
		})
		xingbieLists.value = "男,女".split(',')
		context?.$http({
			url: `option/keshi/keshi`,
			method: 'get'
		}).then(res=>{
			keshiLists.value = res.data.data
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
		if(form.value.touxiang!=null) {
			form.value.touxiang = form.value.touxiang.replace(new RegExp(context?.$config.url,"g"),"");
		}
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
				//图片上传样式
				.el-upload-list  {
					//提示语
					.el-upload__tip {
					}
					//外部盒子
					.el-upload--picture-card {
						//图标
						.el-icon{
						}
					}
					.el-upload-list__item {
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
