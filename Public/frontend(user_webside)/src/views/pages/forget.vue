<template>
	<div>
		<div class="forget_view">
			<div class="outTitle_view">
				<div class="outTilte">{{projectName}}注册</div>
			</div>
			<el-form :model="forgetForm" class="forget_box">
				<div class="tab_line">
					<div class="line"></div>
					<div class="num_line">
						<div class="line_number" :class="pageType==1?'line_number1':'',pageType>1?'line_number2':''"><div class="number" v-if="pageType<2">1</div><el-icon v-else><Check /></el-icon></div>
						<div class="line_number" :class="pageType==2?'line_number1':'',pageType>2?'line_number2':''"><div class="number" v-if="pageType<3">2</div><el-icon v-else><Check /></el-icon></div>
						<div class="line_number" :class="pageType==3?'line_number1':''"><div class="number">3</div></div>
					</div>
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
    import { useRoute } from 'vue-router'
    const route = useRoute()
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	onMounted(()=>{
	})
	const pageType = ref(1)
	const forgetForm = ref({})
	const userForm = ref({})
	//返回登录
	const close = () => {
		context?.$router.push({
			path: "/login"
		});
	}
</script>

<style lang="scss" scoped>
	.forget_view {
        background-image: url("http://clfile.zggen.cn/20240927/aca7910403aa473594233dd794f46131.webp")!important;
		// 标题盒子
		.outTitle_view {
			.outTilte {
			}
		}
		// 表单盒子
		.forget_box {
			// tab
			// 盒子
			.tab_line{
				padding: 30px 0;
				flex-direction: column;
				display: flex;
				width: 100%;
				align-items: center;
				// 中间线
				.line{
				background: #ccc;
				width: 80%;
				height: 2px;
				}
				// item盒子
				.num_line{
					margin: -20px 0 0;
					display: flex;
					width: 80%;
					justify-content: space-between;
					align-items: center;
					height: 40px;
					// 默认样式
					.line_number{
						border: 4px solid #ddd;
						border-radius: 50%;
						color: #aaa;
						background: #eee;
						display: flex;
						width: 40px;
						font-size: 18px;
						justify-content: center;
						align-items: center;
						height: 40px;
					}
					// 选中样式
					.line_number1{
						color: #B20002;
						background: #f3e2e2;
						font-size: 22px;
						border-color: #B20002;
					}
					// 完成样式
					.line_number2{
						color: rgba(0, 170, 0, 1.0);
						border-color: rgba(0, 170, 0, 1.0);
					}
				}
			}
			// item
			.list_item {
				// label
				.item_label {
				}
				// 输入框
				:deep(.list_inp) {
				}
				//下拉框样式
				:deep(.list_sel) {
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
			.list_btn {
				// 获取密保
				:deep(.el-button--success) {
				}
				// 获取密保悬浮
				:deep(.el-button--success:hover) {
				}
				// 确认密保
				:deep(.el-button--primary) {
				}
				// 确认密保悬浮
				:deep(.el-button--primary:hover) {
				}
				// 重置密码
				:deep(.el-button--warning) {
				}
				// 重置密码悬浮
				:deep(.el-button--warning:hover) {
				}
				.r-login {
				}
			}
		}
	}
</style>
<style lang="scss">

.forget_view{
    min-height: 100vh;
    position: relative;
    background: url(http://clfile.zggen.cn/20240926/ba7a15a16f8449059ea8f8f32ef27e84.jpg) no-repeat center center / 100% 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.forget_view .forget_box{
    width: 600px;
    box-shadow: rgb(187, 187, 187) 0px 4px 9px;
    padding: 50px 60px 50px 20px;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    border-radius: 10px;
    background: rgb(255, 255, 255);
    margin-bottom:20px;
    box-shadow: -10px 0px 13px -7px #000000, 10px 0px 13px -7px #000000, 5px 5px 15px 5px rgba(0,0,0,0);
}

.forget_view .outTitle_view{
    display: flex;
    align-items: center;
    padding: 0px 0px 60px;
}
.forget_view .outTitle_view .outTilte{
    color: rgb(51, 51, 51);
    font-size: 30px;
    font-weight: 600;
    -webkit-box-reflect: below 2px linear-gradient(transparent, rgba(0, 0, 0, .1));
    background: linear-gradient(90deg, rgba(0,0,0,1) 0%, rgba(253,29,29,1) 50%, rgba(0,0,0,1) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}


.forget_view .forget_box .tab_view{
    width: 100%;
    display: flex;
    align-items: center;
    padding: 0px 0px 20px;
}

.forget_view .forget_box .tab_view .tab{
    width: calc(33.3333%);
    padding: 16px 0px;
    box-sizing: border-box;
    text-align: center;
    font-size: 16px;
}
.forget_view .forget_box .tab_view .tab.tab_active{
    width: calc(33.3333%);
    padding: 16px 0px;
    box-sizing: border-box;
    text-align: center;
    font-size: 16px;
    clip-path: polygon(0% 0%, 92% 0%, 100% 50%, 92% 100%, 0px 100%, 8% 50%);
    background: rgb(254, 176, 67);
    color: rgb(255, 255, 255);
}


.forget_view .forget_box .list_item{
display: flex;
    align-items: center;
    width: 100%;
    justify-content: flex-start;
    margin: 0px 0px 20px;
}
.forget_view .forget_box .list_item .item_label{
    width: 120px;
    text-align: right;
    box-sizing: border-box;
    font-size: 16px;
}
.forget_view .forget_box .list_item .list_inp{
    height: 36px;
    line-height: 36px;
    border:none;
    border-bottom: 1px solid rgb(221, 221, 221);
    padding: 0px 10px;
    width: calc(100% - 120px);
    box-sizing: border-box;
    font-size: 15px;
}
.forget_view .forget_box .list_item .list_sel{
    line-height: 36px;
    border:none;
    border-bottom: 1px solid rgb(221, 221, 221);
    box-sizing: border-box;
    width: calc(100% - 120px);
    padding: 0px 10px;
    border-radius: 0px;
}
.forget_view .forget_box .list_item .list_sel .el-input__inner{
    font-size: 15px;
    color:#666;
}


.forget_view .forget_box .list_btn{
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    width: 100%;
    margin: 0px;
    padding: 0px 0px 0px 120px;
}

.forget_view .forget_box .list_btn .get_btn{
    margin: 0px 10px 0px 0px;
    padding: 0px 24px;
    width: auto;
    height: 36px;
    font-size: 16px;
    color: rgb(255, 255, 255);
    border-radius: 0px;
    border: 0px;
    background: #B20002;
    cursor: pointer;
}

.forget_view .forget_box .list_btn .valid_btn{
    margin: 0px 10px 0px 0px;
    padding: 0px 24px;
    width: auto;
    height: 36px;
    font-size: 16px;
    color: rgb(255, 255, 255);
    border-radius: 0px;
    border: 0px;
    background: #B20002;
    cursor: pointer;
}

.forget_view .forget_box .list_btn .update_btn{
    margin: 0px 10px 0px 0px;
    padding: 0px 24px;
    width: auto;
    height: 36px;
    font-size: 16px;
    color: rgb(255, 255, 255);
    border-radius: 0px;
    border: 0px;
    background: #B20002;
    cursor: pointer;
}

.forget_view .forget_box .list_btn .r-login{
    width: 100%;
    text-align: right;
    cursor: pointer;
    padding: 10px 0px 0px;
    font-size: 15px;
    color: #666;
}
.forget_view .forget_box .list_btn .r-login:hover{
    text-decoration:underline;
}

</style>
