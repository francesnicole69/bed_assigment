<template>
	<div>
		<el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="60%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
				<el-row >
					<el-col :span="24">
						<el-form-item label="体检项目" prop="tijianxiangmu">
							<el-input class="list_inp" v-model="form.tijianxiangmu" placeholder="体检项目"
                                type="text"
								:readonly="!isAdd||disabledForm.tijianxiangmu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="体检类型" prop="tijianleixing">
							<el-input class="list_inp" v-model="form.tijianleixing" placeholder="体检类型"
                                type="text"
								:readonly="!isAdd||disabledForm.tijianleixing?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="体检地点" prop="tijiandidian">
							<el-input class="list_inp" v-model="form.tijiandidian" placeholder="体检地点"
                                type="text"
								:readonly="!isAdd||disabledForm.tijiandidian?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="体检费用" prop="tijianfeiyong">
							<el-input class="list_inp" v-model.number="form.tijianfeiyong" placeholder="体检费用"
                                type="text"
								:readonly="!isAdd||disabledForm.tijianfeiyong?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="预约数" prop="keyuerenshu">
							<el-input class="list_inp" v-model.number="form.keyuerenshu" placeholder="预约数"
                                type="text"
								:readonly="!isAdd||disabledForm.keyuerenshu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="预约时间" prop="yuyueshijian">
							<el-date-picker
								class="list_date"
								v-model="form.yuyueshijian"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.yuyueshijian?true:false"
								placeholder="请选择预约时间" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="用户账号" prop="yonghuzhanghao">
							<el-input class="list_inp" v-model="form.yonghuzhanghao" placeholder="用户账号"
                                type="text"
								:readonly="!isAdd||disabledForm.yonghuzhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="用户姓名" prop="yonghuxingming">
							<el-input class="list_inp" v-model="form.yonghuxingming" placeholder="用户姓名"
                                type="text"
								:readonly="!isAdd||disabledForm.yonghuxingming?true:false" />
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

					<el-col :span="24">
						<el-form-item label="体检状态" prop="tijianzhuangtai">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.tijianzhuangtai?true:false"
								v-model="form.tijianzhuangtai" 
								placeholder="请选择体检状态"
								>
								<el-option v-for="(item,index) in tijianzhuangtaiLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="预约详情" prop="yuyuexiangqing">
							<editor :value="form.yuyuexiangqing" placeholder="Please enter预约详情" :readonly="!isAdd||disabledForm.yuyuexiangqing?true:false"
								class="list_editor" @change="(e)=>editorChange(e,'yuyuexiangqing')"></editor>
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
	const tableName = 'tijianyuyue'
	const formName = '体检预约'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
        tijianxiangmu : false,
        tijianleixing : false,
        tijiandidian : false,
        tijianfeiyong : false,
        keyuerenshu : false,
        yuyueshijian : false,
        yonghuzhanghao : false,
        yonghuxingming : false,
        jigouzhanghao : false,
        jigoumingcheng : false,
        ispay : false,
        tijianzhuangtai : false,
        yuyuexiangqing : false,
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
		keyuerenshu: [
			{required: true,message: 'Please enter',trigger: 'blur'}, 
			{ validator: context.$toolUtil.validator.intNumber, trigger: 'blur' },
		],
		yuyueshijian: [
		],
		yonghuzhanghao: [
		],
		yonghuxingming: [
		],
		jigouzhanghao: [
		],
		jigoumingcheng: [
		],
		ispay: [
		],
		tijianzhuangtai: [
		],
		yuyuexiangqing: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//体检状态列表
	const tijianzhuangtaiLists = ref([])

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			tijianxiangmu: '',
			tijianleixing: '',
			tijiandidian: '',
			tijianfeiyong: '',
			keyuerenshu: '1',
			yuyueshijian: '',
			yonghuzhanghao: '',
			yonghuxingming: '',
			jigouzhanghao: '',
			jigoumingcheng: '',
			ispay: '未支付',
			tijianzhuangtai: '未体检',
			yuyuexiangqing: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			res.data.data.yuyuexiangqing = res.data.data.yuyuexiangqing?(res.data.data.yuyuexiangqing.replace(reg,'../../../cl581915127/file')):'';
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
				if(x=='keyuerenshu'){
					form.value.keyuerenshu = row[x];
					disabledForm.value.keyuerenshu = true;
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
				if(x=='tijianzhuangtai'){
					form.value.tijianzhuangtai = row[x];
					disabledForm.value.tijianzhuangtai = true;
					continue;
				}
				if(x=='yuyuexiangqing'){
					form.value.yuyuexiangqing = row[x];
					disabledForm.value.yuyuexiangqing = true;
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
			form.value.keyuerenshu='1'
			form.value.ispay='未支付'
			form.value.tijianzhuangtai='未体检'
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(context?.$toolUtil.storageGet("role")!="管理员" && !context?.$toolUtil.storageGet("isAdmin")) {
				disabledForm.value.keyuerenshu = true;
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
		tijianzhuangtaiLists.value = "已体检,未体检".split(',')
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
            if(form.value.keyuerenshu==0){
                return context.$message.error('预约数不能为空')
            }
			objcross.keyuerenshu = objcross.keyuerenshu - form.value.keyuerenshu
			if(objcross.keyuerenshu<0){
				context?.$toolUtil.message('预约数不足','error')
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
