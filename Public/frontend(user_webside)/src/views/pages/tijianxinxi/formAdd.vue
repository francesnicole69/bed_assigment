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
					<el-form-item label="体检项目" prop="tijianxiangmu">
						<el-input class="list_inp"
                                  v-model="form.tijianxiangmu"
                                  placeholder="体检项目"
                                  type="text"
							      :readonly="!isAdd||disabledForm.tijianxiangmu?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="体检类型" prop="tijianleixing">
						<el-input class="list_inp"
                                  v-model="form.tijianleixing"
                                  placeholder="体检类型"
                                  type="text"
							      :readonly="!isAdd||disabledForm.tijianleixing?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="体检地点" prop="tijiandidian">
						<el-input class="list_inp"
                                  v-model="form.tijiandidian"
                                  placeholder="体检地点"
                                  type="text"
							      :readonly="!isAdd||disabledForm.tijiandidian?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="体检费用" prop="tijianfeiyong">
						<el-input class="list_inp"
                                  v-model.number="form.tijianfeiyong"
                                  placeholder="体检费用"
                                  type="text"
							      :readonly="!isAdd||disabledForm.tijianfeiyong?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="用户账号" prop="yonghuzhanghao">
						<el-input class="list_inp"
                                  v-model="form.yonghuzhanghao"
                                  placeholder="用户账号"
                                  type="text"
							      :readonly="!isAdd||disabledForm.yonghuzhanghao?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="用户姓名" prop="yonghuxingming">
						<el-input class="list_inp"
                                  v-model="form.yonghuxingming"
                                  placeholder="用户姓名"
                                  type="text"
							      :readonly="!isAdd||disabledForm.yonghuxingming?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="机构账号" prop="jigouzhanghao">
						<el-input class="list_inp"
                                  v-model="form.jigouzhanghao"
                                  placeholder="机构账号"
                                  type="text"
							      :readonly="!isAdd||disabledForm.jigouzhanghao?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="机构名称" prop="jigoumingcheng">
						<el-input class="list_inp"
                                  v-model="form.jigoumingcheng"
                                  placeholder="机构名称"
                                  type="text"
							      :readonly="!isAdd||disabledForm.jigoumingcheng?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="体检时间" prop="tijianshijian">
						<el-date-picker
							class="list_date"
							v-model="form.tijianshijian"
							format="YYYY-MM-DD HH:mm:ss"
							value-format="YYYY-MM-DD HH:mm:ss"
							type="datetime"
							style="width:100%;"
							:readonly="!isAdd||disabledForm.tijianshijian?true:false"
							placeholder="请选择体检时间" />
					</el-form-item>
				</el-col>
			</el-row>
			<div class="formModel_btn_box">
				<el-button class="formModel_cancel" @click="backClick">取消</el-button>
				<el-button class="formModel_confirm"
                           @click="save"
                           type="success"
				>
					保存
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
	const tableName = 'tijianxinxi'
	const formName = '体检信息'
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
		tijianxiangmu: '',
		tijianleixing: '',
		tijiandidian: '',
		tijianfeiyong: 0,
		yonghuzhanghao: '',
		yonghuxingming: '',
		jigouzhanghao: '',
		jigoumingcheng: '',
		tijianshijian: '',
	})
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	const disabledForm = ref({
		tijianxiangmu : false,
		tijianleixing : false,
		tijiandidian : false,
		tijianfeiyong : false,
		yonghuzhanghao : false,
		yonghuxingming : false,
		jigouzhanghao : false,
		jigoumingcheng : false,
		tijianshijian : false,
	})
	const isAdd = ref(false)
	//表单验证
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
		tijianshijian: [
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
			form.value.tijianshijian = context?.$toolUtil.getCurDateTime()
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
				if(x=='tijianxiangmu'){
					form.value.tijianxiangmu = row[x];
					disabledForm.value.tijianxiangmu = true;
					continue;
				}
				if(x=='tijianleixing'){
					form.value.tijianleixing = row[x];
					disabledForm.value.tijianleixing = true;
					continue;
				}
				if(x=='tijiandidian'){
					form.value.tijiandidian = row[x];
					disabledForm.value.tijiandidian = true;
					continue;
				}
				if(x=='tijianfeiyong'){
					form.value.tijianfeiyong = row[x];
					disabledForm.value.tijianfeiyong = true;
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
				if(x=='tijianshijian'){
					form.value.tijianshijian = row[x];
					disabledForm.value.tijianshijian = true;
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
                                context?.$toolUtil.message(`操作成功`,'success')
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
                        context?.$toolUtil.message(`操作成功`,'success')
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