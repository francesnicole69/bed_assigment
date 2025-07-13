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
					<el-form-item label="user account" prop="yonghuzhanghao">
						<el-input class="list_inp"
                                  v-model="form.yonghuzhanghao"
                                  placeholder="user account"
                                  type="text"
							      :readonly="!isAdd||disabledForm.yonghuzhanghao?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="user name" prop="yonghuxingming">
						<el-input class="list_inp"
                                  v-model="form.yonghuxingming"
                                  placeholder="user name"
                                  type="text"
							      :readonly="!isAdd||disabledForm.yonghuxingming?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="gender" prop="xingbie">
						<el-input class="list_inp"
                                  v-model="form.xingbie"
                                  placeholder="gender"
                                  type="text"
							      :readonly="!isAdd||disabledForm.xingbie?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="age" prop="nianling">
						<el-input class="list_inp"
                                  v-model="form.nianling"
                                  placeholder="age"
                                  type="text"
							      :readonly="!isAdd||disabledForm.nianling?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="weight (kg)" prop="tizhong">
						<el-input class="list_inp"
                                  v-model="form.tizhong"
                                  placeholder="weight (kg)"
                                  type="text"
							      :readonly="!isAdd||disabledForm.tizhong?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="blood pressure (mmHg)" prop="xueya">
						<el-input class="list_inp"
                                  v-model="form.xueya"
                                  placeholder="blood pressure (mmHg)"
                                  type="text"
							      :readonly="!isAdd||disabledForm.xueya?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="blood sugar (mg/dL)" prop="xuetang">
						<el-input class="list_inp"
                                  v-model="form.xuetang"
                                  placeholder="blood sugar (mg/dL)"
                                  type="text"
							      :readonly="!isAdd||disabledForm.xuetang?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="heart rate (bpm)" prop="xinlv">
						<el-input class="list_inp"
                                  v-model="form.xinlv"
                                  placeholder="heart rate (bpm)"
                                  type="text"
							      :readonly="!isAdd||disabledForm.xinlv?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="blood lipid (mmol/L)" prop="xuezhi">
						<el-input class="list_inp"
                                  v-model="form.xuezhi"
                                  placeholder="blood lipid (mmol/L)"
                                  type="text"
							      :readonly="!isAdd||disabledForm.xuezhi?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="sleep duration (days/hours)" prop="shuimianshijian">
						<el-input class="list_inp"
                                  v-model="form.shuimianshijian"
                                  placeholder="sleep duration (days/hours)"
                                  type="text"
							      :readonly="!isAdd||disabledForm.shuimianshijian?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="total cholesterol (mg/dL)" prop="zongdanguchun">
						<el-input class="list_inp"
                                  v-model="form.zongdanguchun"
                                  placeholder="total cholesterol (mg/dL)"
                                  type="text"
							      :readonly="!isAdd||disabledForm.zongdanguchun?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="blood oxygen (bpm)" prop="xueyang">
						<el-input class="list_inp"
                                  v-model="form.xueyang"
                                  placeholder="blood oxygen (bpm)"
                                  type="text"
							      :readonly="!isAdd||disabledForm.xueyang?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="registration time" prop="dengjishijian">
						<el-date-picker
							class="list_date"
							v-model="form.dengjishijian"
							format="YYYY-MM-DD HH:mm:ss"
							value-format="YYYY-MM-DD HH:mm:ss"
							type="datetime"
							style="width:100%;"
							:readonly="!isAdd||disabledForm.dengjishijian?true:false"
							placeholder="Please select the registration time." />
					</el-form-item>
				</el-col>
			</el-row>
			<div class="formModel_btn_box">
				<el-button class="formModel_cancel" @click="backClick">Cancel</el-button>
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
	const tableName = 'jiankangshuju'
	const formName = 'health data'
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
	})
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	const disabledForm = ref({
		yonghuzhanghao : false,
		yonghuxingming : false,
		xingbie : false,
		nianling : false,
		tizhong : false,
		xueya : false,
		xuetang : false,
		xinlv : false,
		xuezhi : false,
		shuimianshijian : false,
		zongdanguchun : false,
		xueyang : false,
		dengjishijian : false,
	})
	const isAdd = ref(false)
	//表单验证
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
			{required: true,message: 'please enter',trigger: 'blur'}, 
		],
		xueya: [
			{required: true,message: 'please enter',trigger: 'blur'}, 
		],
		xuetang: [
			{required: true,message: 'please enter',trigger: 'blur'}, 
		],
		xinlv: [
			{required: true,message: 'please enter',trigger: 'blur'}, 
		],
		xuezhi: [
			{required: true,message: 'please enter',trigger: 'blur'}, 
		],
		shuimianshijian: [
			{required: true,message: 'please enter',trigger: 'blur'}, 
		],
		zongdanguchun: [
			{required: true,message: 'please enter',trigger: 'blur'}, 
		],
		xueyang: [
			{required: true,message: 'please enter',trigger: 'blur'}, 
		],
		dengjishijian: [
		],
	})
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
			form.value.dengjishijian = context?.$toolUtil.getCurDateTime()
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
				if(x=='xingbie'){
					form.value.xingbie = row[x];
					disabledForm.value.xingbie = true;
					continue;
				}
				if(x=='nianling'){
					form.value.nianling = row[x];
					disabledForm.value.nianling = true;
					continue;
				}
				if(x=='tizhong'){
					form.value.tizhong = row[x];
					disabledForm.value.tizhong = true;
					continue;
				}
				if(x=='xueya'){
					form.value.xueya = row[x];
					disabledForm.value.xueya = true;
					continue;
				}
				if(x=='xuetang'){
					form.value.xuetang = row[x];
					disabledForm.value.xuetang = true;
					continue;
				}
				if(x=='xinlv'){
					form.value.xinlv = row[x];
					disabledForm.value.xinlv = true;
					continue;
				}
				if(x=='xuezhi'){
					form.value.xuezhi = row[x];
					disabledForm.value.xuezhi = true;
					continue;
				}
				if(x=='shuimianshijian'){
					form.value.shuimianshijian = row[x];
					disabledForm.value.shuimianshijian = true;
					continue;
				}
				if(x=='zongdanguchun'){
					form.value.zongdanguchun = row[x];
					disabledForm.value.zongdanguchun = true;
					continue;
				}
				if(x=='xueyang'){
					form.value.xueyang = row[x];
					disabledForm.value.xueyang = true;
					continue;
				}
				if(x=='dengjishijian'){
					form.value.dengjishijian = row[x];
					disabledForm.value.dengjishijian = true;
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
			if(json.hasOwnProperty('yonghuzhanghao') && context?.$toolUtil.storageGet("frontRole")!="管理员"){
				form.value.yonghuzhanghao = json.yonghuzhanghao
				disabledForm.value.yonghuzhanghao = true;
			}
			if(json.hasOwnProperty('yonghuxingming') && context?.$toolUtil.storageGet("frontRole")!="管理员"){
				form.value.yonghuxingming = json.yonghuxingming
				disabledForm.value.yonghuxingming = true;
			}
			if(json.hasOwnProperty('xingbie') && context?.$toolUtil.storageGet("frontRole")!="管理员"){
				form.value.xingbie = json.xingbie
				disabledForm.value.xingbie = true;
			}
			if(json.hasOwnProperty('nianling') && context?.$toolUtil.storageGet("frontRole")!="管理员"){
				form.value.nianling = json.nianling
				disabledForm.value.nianling = true;
			}
            if (localStorage.getItem('autoSave')) {
                localStorage.removeItem('autoSave')
                save()
            }
		})
	}
	//初始化
	//取消
	const backClick = () => {
		history.back()
	}
	//提交
	const save=()=>{
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
                                context?.$toolUtil.message(`Operation successful`,'success')
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
                        context?.$toolUtil.message(`Operation successful`,'success')
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
				//日期选择器
				.list_date {
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


.edit_view .add_form .el-form-item .el-form-item__content .list_date{
    line-height: 36px;
    border: 1px solid rgb(221, 221, 221);
    box-sizing: border-box;
    width: 100%;
    border-radius: 0px;
    background: rgb(255, 255, 255);
    font-size: 16px;
}








</style>