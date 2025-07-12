<template>
	<div class="edit_view" :style='{}'>
        <div class="breadcrumb-wrapper" style="width: 100%;">
            <div class="bread_view">
                <el-breadcrumb separator="Ξ" class="breadcrumb">
                    <el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">home page</el-breadcrumb-item>
                    <el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
                </el-breadcrumb>
            </div>
        </div>
		<el-form ref="formRef" :model="form" class="add_form" label-width="120px" :rules="rules">
			<el-row>
				<el-col :span="24">
					<el-form-item label="portrait" prop="touxiang">
						<uploads
							:disabled="!isAdd||disabledForm.touxiang?true:false"
							action="file/upload" 
							tip="please upload a portrait"
							style="width: 100%;text-align: left;"
							:fileUrls="form.touxiang?form.touxiang:''" 
							@change="touxiangUploadSuccess">
						</uploads>
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item label="Doctor's ID" prop="yishenggonghao">
						<el-input class="list_inp"
                                  v-model="form.yishenggonghao"
                                  placeholder="Doctor's ID"
                                  type="text"
							      :readonly="!isAdd||disabledForm.yishenggonghao?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="Doctor's Name" prop="yishengxingming">
						<el-input class="list_inp"
                                  v-model="form.yishengxingming"
                                  placeholder="Doctor's Name"
                                  type="text"
							      :readonly="!isAdd||disabledForm.yishengxingming?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="Gender" prop="xingbie">
						<el-select
							class="list_sel"
							:disabled="!isAdd||disabledForm.xingbie?true:false"
							v-model="form.xingbie" 
							placeholder="Please select gender"
							style="width:100%;"
							>
							<el-option v-for="(item,index) in xingbieLists" :label="item"
								:value="item"
								>
							</el-option>
						</el-select>
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item label="Title" prop="zhicheng">
						<el-input class="list_inp"
                                  v-model="form.zhicheng"
                                  placeholder="Title"
                                  type="text"
							      :readonly="!isAdd||disabledForm.zhicheng?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="Department" prop="keshi">
						<el-select
							class="list_sel"
							:disabled="!isAdd||disabledForm.keshi?true:false"
							v-model="form.keshi" 
							placeholder="Please select department"
							style="width:100%;"
							>
							<el-option v-for="(item,index) in keshiLists" :label="item"
								:value="item"
								>
							</el-option>
						</el-select>
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item label="Specialty" prop="shanzhanglingyu">
						<el-input class="list_inp"
                                  v-model="form.shanzhanglingyu"
                                  placeholder="Specialty"
                                  type="text"
							      :readonly="!isAdd||disabledForm.shanzhanglingyu?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="Contact Method" prop="lianxifangshi">
						<el-input class="list_inp"
                                  v-model="form.lianxifangshi"
                                  placeholder="Contact Method"
                                  type="text"
							      :readonly="!isAdd||disabledForm.lianxifangshi?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="Appointment Time" prop="zuozhenshijian">
						<el-input class="list_inp"
                                  v-model="form.zuozhenshijian"
                                  placeholder="Appointment Time"
                                  type="text"
							      :readonly="!isAdd||disabledForm.zuozhenshijian?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="Registration Fee" prop="guahaofei">
						<el-input class="list_inp"
                                  v-model.number="form.guahaofei"
                                  placeholder="Registration Fee"
                                  type="number"
							      :readonly="!isAdd||disabledForm.guahaofei?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="quantity of items" prop="keguashuliang">
						<el-input class="list_inp"
                                  v-model.number="form.keguashuliang"
                                  placeholder="quantity of items"
                                  type="text"
							      :readonly="!isAdd||disabledForm.keguashuliang?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="Institutional Account" prop="jigouzhanghao">
						<el-input class="list_inp"
                                  v-model="form.jigouzhanghao"
                                  placeholder="Institutional Account"
                                  type="text"
							      :readonly="!isAdd||disabledForm.jigouzhanghao?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="Institution Name" prop="jigoumingcheng">
						<el-input class="list_inp"
                                  v-model="form.jigoumingcheng"
                                  placeholder="Institution Name"
                                  type="text"
							      :readonly="!isAdd||disabledForm.jigoumingcheng?true:false" />
					</el-form-item>
				</el-col>

			</el-row>
			<div class="formModel_btn_box">
				<el-button class="formModel_cancel" @click="backClick">cancel</el-button>
				<el-button class="formModel_confirm"
                           @click="save"
                           type="success"
				>
					Save
				</el-button>
			</div>
		</el-form>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		watch,
		onUnmounted,
		onMounted,
		nextTick,
		computed
	} from 'vue';
	import {
		useRoute,
		useRouter
	} from 'vue-router';
    import moment from "moment";
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const route = useRoute()
	const router = useRouter()
	//基础信息
	const tableName = 'yishengzuozhen'
	const formName = 'Doctor on duty'
	//基础信息
	const breadList = ref([{
		name: formName
	}])
	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//form表单
	const form = ref({
		touxiang: '',
		yishenggonghao: '',
		yishengxingming: '',
		xingbie: '',
		zhicheng: '',
		keshi: '',
		shanzhanglingyu: '',
		lianxifangshi: '',
		zuozhenshijian: '',
		guahaofei: 0,
		keguashuliang: 0,
		jigouzhanghao: '',
		jigoumingcheng: '',
	})
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
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
	const isAdd = ref(false)
	//表单验证
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
	//头像上传回调
	const touxiangUploadSuccess=(e)=>{
		form.value.touxiang = e
	}
	//性别列表
	const xingbieLists = ref([])
	//科室列表
	const keshiLists = ref([])
	//methods

	//methods
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			form.value = res.data.data
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init = (formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null) => {
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
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
		}
		context?.$http({
			url: `${context?.$toolUtil.storageGet('frontSessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('jigouzhanghao') && context?.$toolUtil.storageGet("frontRole")!="管理员"){
				form.value.jigouzhanghao = json.jigouzhanghao
				disabledForm.value.jigouzhanghao = true;
			}
			if(json.hasOwnProperty('jigoumingcheng') && context?.$toolUtil.storageGet("frontRole")!="管理员"){
				form.value.jigoumingcheng = json.jigoumingcheng
				disabledForm.value.jigoumingcheng = true;
			}
            if (localStorage.getItem('autoSave')) {
                localStorage.removeItem('autoSave')
                save()
            }
		})
		xingbieLists.value = "man,women".split(',')
		context?.$http({
			url: `option/keshi/keshi`,
			method: 'get'
		}).then(res=>{
			keshiLists.value = res.data.data
		})
	}
	//初始化
	//取消
	const backClick = () => {
		history.back()
	}
	//提交
	const save=()=>{
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
					crossUserId = context?.$toolUtil.storageGet('userid')
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
							}).then(res=>{
                                context?.$toolUtil.message(`operate successfully`,'success')
                                history.back()
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
                        context?.$toolUtil.message(`operate successfully`,'success')
                        history.back()
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
        if(type.value == 'cross'){
            context?.$http({
                url: `${crossTable.value}/update`,
                method: 'post',
                data: row
            }).then(res=>{})
        }
	}
	onMounted(()=>{
		type.value = route.query.type?route.query.type:'add'
		let row = null
		let table = null
		let statusColumnName = null
		let tips = null
		let statusColumnValue = null
		if(type.value == 'cross'){
			row = context?.$toolUtil.storageGet('crossObj')?JSON.parse(context?.$toolUtil.storageGet('crossObj')):{}
			table = context?.$toolUtil.storageGet('crossTable')
			statusColumnName = context?.$toolUtil.storageGet('crossStatusColumnName')
			tips = context?.$toolUtil.storageGet('crossTips')
			statusColumnValue = context?.$toolUtil.storageGet('crossStatusColumnValue')
		}
		init(route.query.id?route.query.id:null, type.value,'', row, table, statusColumnName, tips, statusColumnValue)
	})
    onUnmounted(()=>{
        Object.keys(localStorage).map(item=>{
            if(item.startsWith('cross')){
                localStorage.removeItem(item)
            }
        })
    })
</script>
<style lang="scss" scoped>
	// 面包屑盒子
	.bread_view {
		:deep(.breadcrumb) {
			.el-breadcrumb__separator {
			}
			.first_breadcrumb {
				.el-breadcrumb__inner {
				}
			}
			.second_breadcrumb {
				.el-breadcrumb__inner {
				}
			}
		}
	}
	// 表单
	.add_form{
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
		.formModel_cancel {
		}
		.formModel_cancel:hover {
		}
		
		.formModel_confirm {
		}
		.formModel_confirm:hover {
		}
	}
</style>
<style lang="scss">
.edit_view {
    width: 1200px;
    margin: 20px auto;
    padding: 40px 20px 20px ;
    background: #fff url(http://clfile.zggen.cn/20240925/66b965a6bd344f1fba3a252cfc6ca35e.jpg) repeat-x;
    overflow: hidden;
    border-radius: 6px;
    -moz-box-shadow: 0 0 8px #8B8B8B;
    -webkit-box-shadow: 0 0 8px #8B8B8B;
    box-shadow: 0 0 8px #8B8B8B;
    border: 1px solid #888;
    font-size: 16px;
    color:#666;
}
.edit_view .add_form{
    width: 100%;
    padding: 30px;
    border:0px solid #eee
}
.edit_view .add_form .el-form-item{
    margin: 0px 0px 20px;
    display: flex;
}
.edit_view .add_form .el-form-item .el-form-item__label{
    width: 150px;
    background: none;
    text-align: right;
    display: block;
    font-size: 16px;
    color: rgb(51, 51, 51);
    font-weight: 500;
}
.edit_view .add_form .el-form-item .el-form-item__content{
    display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-wrap: wrap;
    width: calc(100% - 120px);
}
.edit_view .add_form .el-form-item .el-form-item__content .list_inp{
    height: 36px;
    line-height: 36px;
    border: 1px solid rgb(221, 221, 221);
    padding: 0px 10px;
    width: 100%;
    box-sizing: border-box;
    background: rgb(255, 255, 255);
    font-size: 16px;
}

.edit_view .add_form .el-form-item .el-form-item__content .list_sel{
    line-height: 36px;
    border: 1px solid rgb(221, 221, 221);
    box-sizing: border-box;
    width: calc(100% - 0px);
    padding: 0px 10px;
    border-radius: 0px;
    background: rgb(255, 255, 255);
    font-size: 16px;
}







.edit_view .add_form .el-form-item .el-form-item__content .el-upload--picture-card{
    background-color: rgb(255, 255, 255);
    width: 100px;
    height: 90px;
    line-height: 100px;
    text-align: center;
    border: 1px solid rgb(221, 221, 221);
    border-radius: 0px;
    cursor: pointer;
}

.edit_view .add_form .el-form-item .el-form-item__content .el-upload--picture-card .el-icon{
    font-size: 32px;
    color: #999;
}

.edit_view .add_form .el-form-item .el-form-item__content .img-uploader .el-upload__tip{
    font-size: 15px;
    color: #666;
    margin: 0;
}



</style>