<template>
	<div>
		<div class="login_view">
			<el-form :model="loginForm" class="login_form">
				<div class="title_view">
                    Web-based Elderly Health Service System Login
                </div>
				<div class="list_item" v-if="loginType==1">
					<div class="list_label">
						account:
					</div>
					<input class="list_inp" v-model="loginForm.username" placeholder="Please enter your account." name="username" />
				</div>
				<div class="list_item" v-if="loginType==1">
					<div class="list_label">
						password：
					</div>
					<input class="list_inp" v-model="loginForm.password" type="password" placeholder="Please enter your password." @keydown.enter.native="handleLogin"  />
				</div>
				<div class="list_type" v-if="userList.length>1">
					<div class="list_label">
						user type:
					</div>
				  <el-select v-model="loginForm.role" placeholder="Please select the user type.">
				    <el-option v-for="(item,index) in userList" :label="item.roleName" :value="item.roleName"></el-option>
				  </el-select>
				</div>
				<div class="btn_view">
					<el-button class="login" v-if="loginType==1" type="success" @click="handleLogin">log in</el-button>
					<el-button class="register" type="primary" @click="handleRegister('yiliaojigou')">register medical institution</el-button>
				</div>
			</el-form>
		</div>
		<Vcode :show="isShow" @success="success" @close="close" @fail='fail'></Vcode>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		nextTick,
		onMounted,
	} from "vue";
	import { useStore } from 'vuex'
	const store = useStore()
	const userList = ref([])
	const menus = ref([])
	const loginForm = ref({
		role: '',
		username: '',
		password: ''
	})
	const tableName = ref('')
	const loginType = ref(1)
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	//注册
    const handleRegister = (tableName) => {
    	context?.$router.push(`/${tableName}Register`)
    }
	const handleLogin = () => {
		if (!loginForm.value.username) {
			context?.$toolUtil.message('Please enter your username.', 'error')
			
			return;
		}
		if (!loginForm.value.password) {
			context?.$toolUtil.message('Please enter your password.', 'error')
			return;
		}
		if (userList.value.length > 1) {
			if (!loginForm.value.role) {
				context?.$toolUtil.message('Please select a role.', 'error')
				verifySlider.value.reset()
				return;
			}
			for (let i = 0; i < menus.value.length; i++) {
				if (menus.value[i].roleName == loginForm.value.role) {
					tableName.value = menus.value[i].pathName||menus.value[i].tableName;
				}
			}
		} else {
			tableName.value = userList.value[0].pathName||userList.value[0].tableName;
			loginForm.value.role = userList.value[0].roleName;
		}
		login()
	}
	const login = () => {
		context?.$http({
			url: `${tableName.value}/login?username=${loginForm.value.username}&password=${loginForm.value.password}`,
			method: 'post'
		}).then(res => {
			context?.$toolUtil.storageSet("Token", res.data.token);
			context?.$toolUtil.storageSet("role", loginForm.value.role);
			context?.$toolUtil.storageSet("sessionTable", tableName.value);
			context?.$toolUtil.storageSet("adminName", loginForm.value.username);
            //vuex中获取用户信息并保存
			store.dispatch('user/getSession').then(res=>{
                context?.$router.push('/')
            })
		}, err => {
		})
	}
	//获取菜单
	const getMenu=()=> {
      let params = {
        page: 1,
        limit: 1,
        sort: 'id',
      }

      context?.$http({
        url: "menu/list",
        method: "get",
        params: params
      }).then(res => {
          menus.value = JSON.parse(res.data.data.list[0].menujson)
          for (let i = 0; i < menus.value.length; i++) {
            if (menus.value[i].hasBackLogin=='是') {
              userList.value.push(menus.value[i])
            }
          }
			loginForm.value.role = userList.value[0].roleName
          context?.$toolUtil.storageSet("menus", JSON.stringify(menus.value));
      })
    }
	//初始化
	const init = () => {
		getMenu();
	}
	onMounted(()=>{
		init()
		

	})
</script>

<style lang="scss" scoped>
	.login_view {
        background-image: url("http://clfile.zggen.cn/20241015/55a9921ba4874e90bbec829c90809278.webp")!important;
		// 表单盒子
		.login_form {
		}
		.title_view {
		}
		// item盒子
		.list_item {
			// label
			.list_label {
			}
			// 输入框
			.list_inp {
			}
		}
		.list_type {
			.list_label {
			}
			// 下拉框样式
			:deep(.el-select) {
				//去掉默认样式
				.select-trigger{
					height: 100%;
					.el-input{
						height: 100%;
					}
				}
			}
		}
		// 按钮盒子
		.btn_view {
			// 登录
			.login {
			}
			// 注册
			.register {
			}
		}
	}

</style>
<style>
.login_view {
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

/*表单盒子*/
.login_view .login_form{width: 490px;margin:0 auto;padding:30px 50px 40px 50px;font-size:16px;z-index:5;background: #E8ECEF;box-shadow: 0px 8px 24px 0px rgba(17,17,26,0.1);border-radius: 0px 0px 0px 0px;display: flex;flex-wrap: wrap;position: relative;right: -110px;}

/*标题*/
.login_view .login_form .title_view{width:100%;float:left;line-height:46px;font-size:22px;font-weight:600;letter-spacing:2px;color: #727272;position:relative;margin-bottom:20px;text-align: center;}

/*list_item*/
.login_view .login_form .list_item{display: flex;align-items: center;width: 100%;justify-content: flex-start;margin: 10px auto;order: 2;background: #fff;border: 1px solid #727272;padding:  0 10px;}
.login_view .login_form .list_item .list_label {margin-right:10px;font-size:16px;white-space:nowrap;border-right: 1px solid #D8D8D8;}
.login_view .login_form .list_item .list_label i {  font-size:24px; color:#999;  }
.login_view .login_form .list_item .list_inp{width:100%;border:none;border-bottom: 0px solid #ddd;height:40px;line-height:40px;font-size:inherit;}
.login_view .login_form .list_item .el-select{  }

/* 按钮 */
.login_view .login_form .btn_view{text-align:center;order: 4;width: 100%;}
.login_view .login_form .btn_view .login{width: 100%;height: 50px;line-height: 46px;background: #1CB09A;border: 0px solid #ccc;font-weight: 600;font-size: 20px;color: #fff;margin-bottom:20px;padding:0;} 
.login_view .login_form .btn_view .register{background: none;border: 0px solid #ccc;font-size:16px;color: #666;position: absolute;padding: 0 10px;} 
.login_view .login_form .btn_view .register:hover {border: none;} 
.login_view .login_form .btn_view .forget{font-size:16px;color: #666;border: 0;background: none;} 
.login_view .login_form .btn_view .forget:hover {border: none;}

.login_view .login_form .face{width:100%;height: 50px;line-height:46px;background: #fff;border: 3px solid #ccc;font-weight: 600;font-size: 20px;color: #999;margin-bottom:20px;text-align:center;margin-top:20px;padding:0;order: 3;cursor: pointer;} 



.login_view .list_type {
    order: 1;
    border-bottom: 1px solid #727272;
    width: 100%;
    display: flex;
}

.login_view .list_type .list_label {
    display: none;
}

.login_view .list_type .el-select input {
    text-align: center;
}

.login_view .list_type .el-select {
    flex: 1;
    line-height: 40px;
}

.login_view .login_form .btn_view .register:before {
    content: '';
    width: 20px;
    height: 20px;
    border: 1px solid #969696;
    border-radius: 50%;
    display: block;
    position: absolute;
    top: calc(50% - 11px);
    left: -16px;
}
.login_view .login_form .btn_view .register:hover:before{
    border: 1px solid var(--theme);
}

.login_view .login_form .btn_view .register:after {
    content: '';
    width: 10px;
    height: 10px;
    background: #969696;
    border-radius: 50%;
    display: block;
    position: absolute;
    top: calc(50% - 5px);
    left: -10px;
}
.login_view .login_form .btn_view .register:hover:after{
    background: var(--theme);
}
.login_view .login_form .btn_view .register:hover{
    color:var(--theme)
}

.login_view .login_form .btn_view .register:nth-child(2) {
    left: -230px;
    top: 90px;
}
.login_view .login_form .btn_view .register:nth-child(3) {
    left: -230px;
    top: 140px;
}
.login_view .login_form .btn_view .register:nth-child(4) {
    left: -230px;
    top: 190px;
}
.login_view .login_form .btn_view .register:nth-child(5) {
    left: -230px;
    top: 240px;
}
.login_view .login_form .btn_view .register:nth-child(6) {
    left: -230px;
    top: 290px;
}

.login_view .tips {
    width: 720px;
    border-top: 1px solid #727272;
    margin-top: 100px;
    color: #9E9E9E;
    line-height: 60px;
    text-align: center;
    position: relative;
}
</style>