<template>
	<div class="detail-page" :style='{}'>
        <div class="breadcrumb-wrapper" style="width: 100%;">
            <div class="bread_view">
                <el-breadcrumb separator="Ξ" class="breadcrumb">
                    <el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">home page</el-breadcrumb-item>
                    <el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
                </el-breadcrumb>
            </div>
            <div class="back_view">
                <el-button class="back_btn" @click="backClick" type="primary">back</el-button>
            </div>
        </div>
		<div class="detail_view">

			<div class="info_view">
				<div class="title_view">
					<div class="detail_title">
						<span>{{detail.yishenggonghao}}</span>
					</div>
				</div>
				<div class="info_item">
					<div class="info_label">reservation number</div>
					<div  class="info_text" >{{detail.yuyuebianhao}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">Doctor's Name</div>
					<div  class="info_text" >{{detail.yishengxingming}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">Registration Fee</div>
					<div  class="info_text" >{{detail.guahaofei}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">Number of Registrations</div>
					<div  class="info_text" >{{detail.keguashuliang}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">appointment time</div>
					<div  class="info_text" >{{detail.yuyueshijian}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">user account</div>
					<div  class="info_text" >{{detail.yonghuzhanghao}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">user name</div>
					<div  class="info_text" >{{detail.yonghuxingming}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">Institutional Account</div>
					<div  class="info_text" >{{detail.jigouzhanghao}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">Institution Name</div>
					<div  class="info_text" >{{detail.jigoumingcheng}}</div>
				</div>
				<div class="btn_view">
					<el-button v-if="centerType&&(detail.ispay=='not pay'||!detail.ispay)&&btnFrontAuth('yuyueguahao','支付')" class="approval_btn" @click="payClick">Pay</el-button>
					<el-button class="edit_btn" v-if="centerType&&btnAuth('yuyueguahao','修改')" type="primary" @click="editClick">Edit</el-button>
					<el-button class="del_btn" v-if="centerType&&btnAuth('yuyueguahao','删除')" type="danger" @click="delClick">Delete</el-button>
				</div>
			</div>
		</div>
		<el-tabs type="border-card" v-model="activeName" class="tabs_view">
			<el-tab-pane label="Past Medical History" name="first">
				<div v-html="detail.jiwangbingshi"></div>
			</el-tab-pane>
		</el-tabs>
		<payForm ref="pay" @payChange="getDetail()"></payForm>
	</div>
</template>
<script setup>
	import axios from 'axios'
	import moment from 'moment'
	import {
		ref,
		getCurrentInstance,
		watch,
		onUnmounted,
		onMounted,
		nextTick,
		computed,
        inject
	} from 'vue';
	import {
		ElMessageBox
	} from 'element-plus'
	import {
		useRoute,
		useRouter
	} from 'vue-router';
	import {
		useStore
	} from 'vuex';
	const store = useStore()
	const user = computed(()=>store.getters['user/session'])
	const userAvatar = computed(()=>store.getters['user/avatar'])
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const route = useRoute()
	const router = useRouter()
	//基础信息
	const tableName = 'yuyueguahao'
	const formName = '预约挂号'
	//基础信息
	const breadList = ref([{
		name: formName
	}])
	//权限验证
	const btnAuth = (e,a)=>{
		if(centerType.value){
			return context?.$toolUtil.isBackAuth(e,a)
		}else{
			return context?.$toolUtil.isAuth(e,a)
		}
	}
	//查看权限验证
	const btnFrontAuth = (e,a)=>{
		if(centerType.value){
			return context?.$toolUtil.isBackAuth(e,a)
		}else{
			return context?.$toolUtil.isFrontAuth(e,a)
		}
	}
	// 返回
	const backClick = () =>{
		history.back()
	}
	// 轮播图
	const bannerList = ref([])
	// 详情
	const title = ref('')
	const detail = ref({})
    const activeName = ref('first')
	const getDetail = () => {
		context?.$http({
			url: `${tableName}/detail/${route.query.id}`,
			method: 'get'
		}).then(res => {
            title.value = res.data.data.yishenggonghao
			detail.value = res.data.data
		})
	}
	// 下载文件
	const downClick = (file) => {
		if(!file){
			context?.$toolUtil.message('File does not exist','error')
		}
		let arr = file.replace(new RegExp('file/', "g"), "")
		axios.get((location.href.split(context?.$config.name).length>1 ? location.href.split(context?.$config.name)[0] :'') + context?.$config.name + '/file/download?fileName=' + arr, {
			headers: {
				token: context?.$toolUtil.storageGet('frontToken')
			},
			responseType: "blob"
		}).then(({
			data
		}) => {
			const binaryData = [];
			binaryData.push(data);
			const objectUrl = window.URL.createObjectURL(new Blob(binaryData, {
				type: 'application/pdf;chartset=UTF-8'
			}))
			const a = document.createElement('a')
			a.href = objectUrl
			a.download = arr
			// a.click()
			// 下面这个写法兼容火狐
			a.dispatchEvent(new MouseEvent('click', {
				bubbles: true,
				cancelable: true,
				view: window
			}))
			window.URL.revokeObjectURL(data)
		})
	}
	// 判断是否从个人中心跳转
	const centerType = ref(false)
	const init = () => {
		if(route.query.centerType){
			centerType.value = true
		}
		getDetail()
	}
	//普通支付
	import payForm from '@/components/payForm'
	const pay = ref(null)
	const payClick = ()=>{
		pay.value.payClick(tableName,detail.value)
	}
	//修改
	const editClick = () => {
		router.push(`/index/${tableName}Add?id=${detail.value.id}&&type=edit`)
	}
	//删除
	const delClick = () => {
		ElMessageBox.confirm(`Do you want to delete this ${formName}？`, 'warning', {
			confirmButtonText: 'Yes',
			cancelButtonText: 'No',
			type: 'warning',
		}).then(()=>{
			context?.$http({
				url: `${tableName}/delete`,
				method: 'post',
				data: [detail.value.id]
			}).then(res=>{
				context?.$toolUtil.message('Delete successful','success',()=>{
					history.back()
				})
			})

		}).catch(_ => {})
	}
	onMounted(()=>{
		init()
	})
</script>
<style lang="scss" scoped>
	// 返回盒子
	.back_view {
		border-radius: 4px;
		padding: 10px 0px;
		margin: 10px auto;
		background: none;
		width: 100%;
		text-align: right;
		// 返回按钮
		.back_btn {
			border: 1px solid #B2000250;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 24px;
			color: #B20002;
			background: #fff;
			width: auto;
			font-size: 14px;
			height: 34px;
		}
		// 返回按钮-悬浮
		.back_btn:hover {
		}
	}
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

	.detail_view{
		// 轮播图
		.swiper_view {
		}
		// 文字区
		.info_view {

			.title_view {

				.detail_title {
				}
				.collect_view {
					border: 0px solid #eee;
					cursor: pointer;
					border-radius: 10px;
					padding: 10px 0px;
					color: #999;
					background: #fff;
					display: flex;
					width: auto;
					line-height: 1;
					justify-content: center;
					align-items: center;
					.iconfont {
						margin: 0 5px 0 0;
						color: #888;
					}
					.iconfontActive {
						margin: 0 5px 0 0;
						color: #feb043;
					}
					span {
						color: #666;
					}
					.textActive {
						color: #feb043;
					}
				}
				.collect_view:hover {
				}
				.collect_view:active {
					transform: scale(0.8);
				}
			}

			.info_item {

				.info_label {
				}
				.info_text {
				}
			}
			.btn_view {
				// 修改-按钮
				.edit_btn {
				}
				// 悬浮
				.edit_btn:hover {
				}
				// 删除-按钮
				.del_btn {
				}
				// 悬浮
				.del_btn:hover {
				}
			}
		}
	}

	//底部盒子
	.tabs_view {
		:deep(.el-tabs__header) {
			background: transparent;
			border: none;
		}
		// 头部
		:deep(.el-tabs__nav-scroll) {
			.el-tabs__nav {
				.el-tabs__item {
				}
				.el-tabs__item:hover {
				}
				.is-active {
				}
			}
		}
		// 内容区
		:deep(.el-tabs__content) {
		}
	}
</style>