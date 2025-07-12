<template>
	<div>
		<div class="center_view edit_form">
			<el-form class="userinfo_form" ref="userinfoFormRef" :model="form">
				<el-row>
					<el-col :span="24">
						<el-form-item label="user name" prop="username">
							<el-input class="list_inp" v-model="user.username"  placeholder="user name" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="image" prop="tupian">
							<uploads
								action="file/upload" 
								tip="Please upload the picture."
								style="width: 100%;text-align: left;"
								:fileUrls="user.tupian?user.tupian:''" 
								@change="userstupianUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<span class="formModel_btn_box">
						<el-button class='confirm_btn' type="primary" @click="onSubmit">save</el-button>
					</span>
				</el-row>
			</el-form>
		</div>
	</div>
</template>

<script setup>
	import { isNumber,isIntNumer,isEmail,isMobile,isPhone,isURL,checkIdCard } from "@/utils/toolUtil";
	import {
		reactive,
		ref,
		getCurrentInstance,
        computed
	} from 'vue'
	import { useStore } from 'vuex'
	const store = useStore()
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const tableName = ref('users')
	const user = ref({})

	const init = () => {
	}
	const userstupianUploadSuccess=(fileUrls)=> {
	    user.value.tupian = fileUrls;
	}
	const onSubmit = () => {
		if((!user.value.username)){
			context?.$toolUtil.message(`用户名不能为空`,'error')
			return false
		}
		if((!user.value.password)){
			context?.$toolUtil.message(`密码不能为空`,'error')
			return false
		}
		if(user.value.tupian!=null){
			user.value.tupian = user.value.tupian.replace(new RegExp(context?.$config.url,"g"),"");
		}
		store.dispatch('user/update',user.value).then(res=>{
			if(res?.data&&res.data.code==0)context?.$toolUtil.message('修改成功','success')
		})

	}
	const getInfo = () => {
		context?.$http({
			url: `${tableName.value}/session`,
			method: 'get'
		}).then(res => {
			user.value = res.data.data
			init()
		})
	}
	getInfo()
</script>

<style lang="scss" scoped>
	// 表单
	.userinfo_form {
		// form item
		:deep(.el-form-item) {
			// 内容盒子
			.el-form-item__content{
			}
			// 输入框
			.list_inp {
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
		// 按钮盒子
		.formModel_btn_box {
			// 确定按钮
			.confirm_btn {
			}
			// 确定按钮-悬浮
			.confirm_btn:hover {
			}
		}
	}
</style>
