<template>
	<div>
		<div class="center_view edit_form">
			<el-form class="password_form" ref="passwordFormRef" :model="form" label-width="140px" :rules="rules">
				<el-form-item label="password" prop="mima1">
					<el-input class="list_inp" v-model="form.mima1" type="password" show-password />
				</el-form-item>
				<el-form-item label="new password" prop="mima">
					<el-input class="list_inp" v-model="form.mima" type="password" show-password />
				</el-form-item>
				<el-form-item label="confirm password" prop="mima2">
					<el-input class="list_inp" v-model="form.mima2" type="password" show-password />
				</el-form-item>
				<span class="formModel_btn_box">
					<el-button class="confirm_btn" type="primary" @click="onSubmit">save</el-button>
				</span>
					
			</el-form>
		</div>
	</div>
</template>

<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const form = ref({})
	const user = ref({})
	const sessionTable = ref('')
	const passwordFormRef = ref(null)
	const rules = ref({
		mima1: [{
			required: true,
			message: 'Please enter',
			trigger: 'blur'
		}, ],
		mima: [{
			required: true,
			message: 'Please enter',
			trigger: 'blur'
		}, ],
		mima2: [{
			required: true,
			message: 'Please enter',
			trigger: 'blur'
		}, ],
	})
	const onSubmit = async () => {
		passwordFormRef.value.validate(async (valid) => {
			if (valid) {
				if(sessionTable.value == 'users'){
					if (form.value.mima1 != user.value.password) {
						context?.$toolUtil.message('原密码不正确','error')
						return false
					}
					user.value.password = form.value.mima
				}else{
					if(sessionTable.value == 'yiliaojigou'){
						if(form.value.mima1 != user.value.mima){
							context?.$toolUtil.message('原密码不正确', 'error')
							return false
						}
					}
				}
				if (form.value.mima2 != form.value.mima) {
					context?.$toolUtil.message('两次密码输入不一致','error')
					return false
				}
                if (form.value.mima1 == form.value.mima) {
                    context?.$toolUtil.message('新密码不能与原密码相同','error')
                    return false
                }
				if(sessionTable.value == 'yiliaojigou'){
					user.value.mima = form.value.mima
				}
				context?.$http({
					url: `${sessionTable.value}/update`,
					method: 'post',
					data: user.value
				}).then(res => {
					context?.$toolUtil.message('修改成功，下次登录将使用新密码登录','success')
				})
			}
		})

	}
	const getInfo = () => {
		sessionTable.value = context?.$toolUtil.storageGet('sessionTable')
		context?.$http({
			url: `${sessionTable.value}/session`,
			method: 'get'
		}).then(res => {
			user.value = res.data.data
		})
	}
	getInfo()
</script>

<style lang="scss" scoped>
	// 表单
	.password_form{
		// form item
		:deep(.el-form-item) {
			// 内容盒子
			.el-form-item__content{
				// 输入框
				.list_inp {
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
