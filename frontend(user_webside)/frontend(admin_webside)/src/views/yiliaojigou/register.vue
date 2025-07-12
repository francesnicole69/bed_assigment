<template>
	<div>
		<div class="register_view">
			<el-form :model="registerForm" class="register_form">
				<div class="title_view">
                    {{projectName}}register
                </div>
				<div class="list_item">
					<div class="list_label">Institutional Account Number:</div>
					<el-input class="list_inp"
						 v-model="registerForm.jigouzhanghao" 
						 placeholder="Please enter your account."
						 type="text"
						/>
				</div>
				<div class="list_item">
					<div class="list_label">Password:</div>
					<el-input class="list_inp"
						 v-model="registerForm.mima" 
						 placeholder="Please enter your password."
						 type="password"
						 />
				</div>
				<div class="list_item">
					<div class="list_label">Confirm Password:</div>
					<el-input class="list_inp" v-model="registerForm.mima2" type="password" placeholder="Please enter your confirm password." />
				</div>
				<div class="list_item">
					<div class="list_label">Institution Name:</div>
					<el-input class="list_inp"
						 v-model="registerForm.jigoumingcheng" 
						 placeholder="Please enter the institution name."
						 type="text"
						/>
				</div>
				<div class="list_item">
					<div class="list_label">Business License:</div>
					<div :style='{}' class="list_file_list">
						<uploads
							action="file/upload" 
							tip="Please upload the business license"
							:fileUrls="registerForm.touxiang?registerForm.touxiang:''" 
							@change="touxiangUploadSuccess">
						</uploads>
					</div>
				</div>
				<div class="list_item">
					<div class="list_label">Contact Phone:</div>
					<el-input class="list_inp"
						 v-model="registerForm.lianxidianhua" 
						 placeholder="Please enter the contact phone"
						 type="text"
						/>
				</div>
				<div class="list_btn">
					<el-button class="register" type="success" @click="handleRegister">Register</el-button>
					<div class="r-login" @click="close">Already have an account? Log in directly</div>
				</div>
			</el-form>
		</div>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		nextTick,
		onMounted,
	} from 'vue';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const projectName = context?.$project.projectName
	//获取注册类型
	import { useRoute } from 'vue-router';
	const route = useRoute()
	const tableName = ref('yiliaojigou')
	
	//公共方法
	const getUUID=()=> {
		return new Date().getTime();
	}
	const registerForm = ref({
         sfsh: '待审核',
	})
	const init=()=>{
	}
    const touxiangUploadSuccess=(fileUrls)=> {
        registerForm.value.touxiang = fileUrls;
    }

	//注册按钮
	const handleRegister = () => {
		let url = tableName.value +"/register";
		if((!registerForm.value.jigouzhanghao)){
			context?.$toolUtil.message(`Institutional account number cannot be empty`,'error')
			return false
		}
		if((!registerForm.value.mima)){
			context?.$toolUtil.message(`Password cannot be empty`,'error')
			return false
		}
		if(registerForm.value.mima!=registerForm.value.mima2){
			context?.$toolUtil.message('Passwords do not match','error')
			return false
		}
		if((!registerForm.value.jigoumingcheng)){
			context?.$toolUtil.message(`Institution name cannot be empty`,'error')
			return false
		}
		if(registerForm.value.touxiang!=null){
			registerForm.value.touxiang = registerForm.value.touxiang.replace(new RegExp(context?.$config.url,"g"),"");
		}
		if(registerForm.value.lianxidianhua&&(!context?.$toolUtil.isMobile(registerForm.value.lianxidianhua))){
			context?.$toolUtil.message(`Contact phone must be in mobile format`,'error')
			return false
		}
		context?.$http({
			url:url,
			method:'post',
			data:registerForm.value
		}).then(res=>{
			context?.$toolUtil.message('Registration successful','success', obj=>{
				context?.$router.push({
					path: "/login"
				});
			})
		})
	}
	//返回登录
	const close = () => {
		context?.$router.push({
			path: "/login"
		});
	}
	init()
	onMounted(()=>{

	})
</script>
<style lang="scss" scoped>
	
	.register_view {
        background-image: url("http://clfile.zggen.cn/20241015/55a9921ba4874e90bbec829c90809278.webp")!important;
		// 表单盒子
		.register_form {
		}
		// 标题样式
		.title_view {
		}
		// item盒子
		.list_item {
			// label
			.list_label {
			}
			// 输入框
			:deep(.list_inp) {
			}
		}
		//按钮盒子
		.list_btn {
			//注册按钮
			.register {
			}
			//注册按钮悬浮样式
			.register:hover {
			}
			//已有账号
			.r-login {
			}
		}
		//图片上传样式
		.list_file_list  {
			//提示语
			:deep(.el-upload__tip){
			}
			//外部盒子
			:deep(.el-upload--picture-card){
				//图标
				.el-icon{
				}
			}
			:deep(.el-upload-list__item) {
			}
		}
	}
</style>
<style>
.register_view {
    min-height: 100vh;
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-image: url(http://clfile.zggen.cn/20240724/b0645dd6c97b41a799e314b57fba5f08.png);
    background-position: center center;
    background-size: 100% 100% !important;
    background-repeat: no-repeat;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: initial;
}


.register_view .register_form{width: 600px;margin:30px auto;padding: 30px 50px 40px 50px;background: #E8ECEF;border-radius: 10px;transform: scale(1);-webkit-transform: scale(1);-ms-transform: scale(1);z-index: 5;box-shadow: 0px 8px 24px 0px rgba(17,17,26,0.1);}

.register_view .register_form .title_view{width: 100%;float: left;line-height: 46px;font-size:24px;font-weight: 600;letter-spacing: 2px;color: #727272;position: relative;margin-bottom:20px;text-align: center;}


.register_view .register_form .list_item {display: flex;align-items: center;width: 100%;justify-content: flex-start;margin: 10px auto;background: #fff;border: 1px solid #727272;padding: 6px 10px;}
.register_view .register_form .list_item .list_label{display:block;margin-right:10px;white-space:nowrap;font-size:16px;min-width: 80px;text-align: right;}
.register_view .register_form .list_item .list_label i {  font-size:24px; color:#999;  }
.register_view .register_form .list_item .el-input .el-input__inner{width:100%;border:none;border-bottom: 0px solid #ddd;height:40px;line-height:40px;border-radius:0;font-size:16px;color:#999;}
.register_view .register_form .list_item .el-select {width:100%;border: none;}
.register_view .register_form .list_type{ margin-bottom:20px;  }
.register_view .register_form .list_code{  }
.register_view .register_form .list_code .el-input .el-input__inner{width:100%;border:none;border-bottom: 0px solid #ddd;height:40px;line-height:40px;border-radius:0;font-size:16px;color:#999;}


.register_view .register_form .list_item .list_file_list{ width: 100%;  margin:10px 20px 10px 0px; flex:1; }

.register_view .register_form .list_item .list_file_list .el-upload{ background-color: rgb(255, 255, 255);  width: 100px;  height: 60px; line-height: 68px;  text-align: center;  border: 1px solid rgb(221, 221, 221);  border-radius: 0px; cursor: pointer; }

.register_view .register_form .list_item .list_file_list .el-upload .el-icon{ font-size: 26px; color: rgb(187, 187, 187); }

.register_view .register_form .list_item .list_file_list .img-uploader .el-upload__tip{ font-size: 16px;  color: rgb(102, 102, 102);margin: 7px 0px 0px; display: flex; align-items: center;  justify-content: flex-start; }


.register_view .register_form .list_item .el-upload-dragger{ background-color: rgb(255, 255, 255); border: 1px solid rgb(221, 221, 221);  border-radius: 0px;  box-sizing: border-box;  width: 100%; height: auto; text-align: center; cursor: pointer; overflow: hidden; padding: 4px 20px 8px; }

.register_view .register_form .list_item .el-upload-dragger .el-icon--upload{font-size: 48px;color: var(--theme);line-height: 40px;margin: 0px;}

.register_view .register_form .list_item .upload-demo .el-upload__tip{ font-size: 16px; color: rgb(102, 102, 102); margin: 7px 0px 0px; }

.register_view .register_form .list_item .el-upload-dragger .el-upload__text{  font-size: 16px;  }
.register_view .register_form .list_item .el-upload-dragger .el-upload__text em{ color: rgb(139, 92, 126); }


.register_view .register_form .list_item .list_radio{ display: flex; width: 80%; align-items: center; flex-wrap: wrap; background: none; height: 36px; flex: 1; }

.register_view .register_form .list_item .list_radio .el-radio{ width: auto; margin: 0px 20px 0px 0px; display: flex; justify-content: center; align-items: center; }

.register_view .register_form .list_item .list_radio .el-radio .el-radio__label { font-size: 16px; color: rgb(153, 153, 153);   }

.register_view .register_form .list_item .list_radio .el-radio.is-checked .el-radio__label {color: var(--theme);}

.register_view .register_form .list_item .list_radio .el-radio .el-radio__input .el-radio__inner{ border-color: rgb(153, 153, 153); background: rgb(255, 255, 255); }

.register_view .register_form .list_item .list_radio .el-radio .el-radio__input.is-checked .el-radio__inner{border-color: var(--theme);background: var(--theme);}


.register_view .register_form .list_item .list_checkbox { display: flex; width: 80%;  flex-wrap: wrap; align-items: center; background: none; height: 36px; flex:1; }

.register_view .register_form .list_item .list_checkbox .el-checkbox{ width: auto; margin: 0px 20px 0px 0px; display: flex;  justify-content: center;  align-items: center; }

.register_view .register_form .list_item .list_checkbox .el-checkbox .el-checkbox__label { color: rgb(153, 153, 153);  font-size: 16px; }

.register_view .register_form .list_item .list_checkbox .el-checkbox.is-checked .el-checkbox__label {color: var(--theme);}

.register_view .register_form .list_item .list_checkbox .el-checkbox .el-checkbox__input .el-checkbox__inner{ border-color: rgb(153, 153, 153);  background: rgb(255, 255, 255); }

.register_view .register_form .list_item .list_checkbox .el-checkbox.is-checked .el-checkbox__input .el-checkbox__inner{border-color: var(--theme);background: var(--theme);}


.register_view .register_form .list_code{display: flex;align-items: center;width: 100%;margin: 10px auto;background: #fff;padding: 6px 10px;border: 1px solid #727272;}
.register_view .register_form .list_code .list_code_label{ font-size:16px; }

.register_view .register_form .list_code .list_code_item{ width: calc(100% - 130px); display: flex; align-items: center; flex: 1;  }

.register_view .register_form .list_code .list_code_item .list_code_inp{font-size:16px;color:#999;border: none;}

.register_view .register_form .list_code .list_code_item .list_code_btn{width: 150px;height: 36px;line-height: 36px;padding: 0px;border: 0px solid rgb(73, 189, 227);background: var(--theme);border-radius: 0px;color: rgb(255, 255, 255);font-size: 16px;}


.register_view .register_form .list_btn{  text-align:center;  }
.register_view .register_form .list_btn .register{width: 100%;height: 50px;line-height: 46px;background: var(--theme);border: 0px solid #ccc;font-weight: 600;font-size: 20px;color: #fff;margin-bottom:20px;padding:0;margin-top:20px;} 
.register_view .register_form .list_btn .register:hover {} 
.register_view .register_form .list_btn .r-login{  font-size: 16px; color: #999;  } 
.register_view .register_form .list_btn .r-login:hover{cursor:pointer;color: var(--theme);} 


.el-input.list_inp {
    border: none;
}

</style>