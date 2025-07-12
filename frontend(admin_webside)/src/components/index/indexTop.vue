<template>
	<div class="top_view">
		<div class="top_left_view">
			<div class="fold_view" @click="toggleClick" :class="{'is_collapse':collapse}">
				<el-icon class="icons">
					<Fold v-if="!collapse" />
					<Expand v-else />
				</el-icon>
			</div>
		</div>

		<div class="projectTitle">Web-based Elderly Health Service System</div>
		<div class="top_right_view">
			<el-dropdown class="avatar-container" trigger="hover">
				<div class="avatar-wrapper">
					<div class="nickname">welcome {{$toolUtil.storageGet('adminName')}}</div>
					<img class="user-avatar" :src="store.getters['user/avatar']">
					<el-icon class="el-icon-arrow-down">
						<arrow-down />
					</el-icon>
				</div>
				<template #dropdown>
					<el-dropdown-menu class="user-dropDown" slot="dropdown">
						<el-dropdown-item class="center" @click="centerClick" >
							Personal Center
						</el-dropdown-item>
						<el-dropdown-item class="password" @click="updatepasswordClick">
							Change Password
						</el-dropdown-item>
						<el-dropdown-item class="front">
							<span style="display:block;" @click="frontClick">System Frontend</span>
						</el-dropdown-item>
						<el-dropdown-item class="loginOut">
							<span style="display:block;" @click="onLogout">Log Out</span>
						</el-dropdown-item>
					</el-dropdown-menu>
				</template>
			</el-dropdown>
		</div>
		<el-button class="notice-btn" @click="noticeDialogVisible=true">
			<span class="iconfont icon-xiaoxi2"></span>
			message notification
		</el-button>
		<div class="breadcrumb-view">
			<el-breadcrumb separator="/">
				<el-breadcrumb-item v-for="(item,index) in breadcrumbList" :key="item.path">
					<i class="iconfont icon-zhuye2" v-if="!index"></i>
					<span @click="router.push(item.path)">{{item.name}}</span>
				</el-breadcrumb-item>
			</el-breadcrumb>
		</div>
		<el-dialog v-model="noticeDialogVisible" title="message notification">
			<div>
				<div v-html="store.state.system.notice.content"></div>
			</div>
		</el-dialog>
        <el-dialog :title="remindForm.title" :append-to-body="true" v-model="remindVisibie" width="60%">
            <div v-html="remindForm.content"></div>
        </el-dialog>
	</div>
</template>

<script setup>
	import axios from 'axios'
    import moment from "moment"
	import {
		ElMessageBox
	} from 'element-plus'
	import {
		toRefs,
		defineEmits,
		getCurrentInstance,
		ref,
		onBeforeUnmount,
		computed,
	} from 'vue';

	import {
		useRouter,
		useRoute
	} from 'vue-router';
	const router = useRouter()
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const emit = defineEmits(['collapseChange'])
	const role = context?.$toolUtil.storageGet('sessionTable')
	const roleName = context?.$toolUtil.storageGet('role')
	const route = useRoute()
	let breadcrumbList = computed(()=>{
		let arr = route.matched.map(item=>({
			name:item.meta.title||item.name,
			path:item.path
		}))
		return arr[arr.length-1].path=='/'?[arr[0]]:arr
	})

	const props = defineProps({
		collapse: Boolean
	})
	const {collapse} = toRefs(props)

	//获取用户信息
	import { useStore } from 'vuex'
	const store = useStore()
	const user = computed(()=>store.getters['user/session'])
	const avatar = ref(store.state.user.avatar)
	if(!store.state.user.session.id){
		store.dispatch('user/getSession').then(()=>{
            avatar.value = store.state.user.avatar
        })
	}
	//获取通知公告
	const noticeDialogVisible = ref(false)
	store.dispatch('system/getSystemNotice')
	const toggleClick = () => {
		emit('collapseChange')
	}
	// 退出登录
	const onLogout = () => {
		let toolUtil = context?.$toolUtil
		store.dispatch('delAllCachedViews')
		store.dispatch('delAllVisitedViews')
        store.dispatch('user/loginOut')
		toolUtil.storageClear()
		router.replace({
			name: "login"
		});
	}
	// 跳转前台
	const frontClick = () => {
        // TODO  要改地址
        // window.open(`${context.$config.url}client/index.html#/index/home`,'_blank')
	}
	// 个人中心
	const centerClick = () => {
		router.push(`/${role}Center`)
	}
	// 修改密码
	const updatepasswordClick = () => {
		router.push(`/updatepassword`)
	}
    const remindVisibie = ref(false)
    const remindForm = ref({})
    const timesAll = ref(null)
    const timesOnce = ref(null)
    const getRecommendAll = async ()=>{
        let res = await context.$http.get('popupremind/list',{
            params: {
                type: '全局'
            }
        })
        let list = res.data.data.list
        for (let x in list) {
            if (new Date()>new Date(list[x].remindTime)) {
                let obj = await context.$http.get('storeup/page',{
                    params: {
                        refid: list[x].id,
                        tablename: 'popupremind',
                        type: '61',
                    }
                })
                if (!obj.data.data.list.length) {
                    context.$notify({
                        title: list[x].title,
                        dangerouslyUseHTMLString: true,
                        message: list[x].brief,
                        duration: 0,
                        position: 'bottom-right',
                        onClick() {
                            remindForm.value = list[x]
                            remindVisibie.value = true
                        }
                    })
                    context.$http.post('storeup/add',{
                        userid: store.getters['user/session'].id,
                        refid: list[x].id,
                        tablename: 'popupremind',
                        name: list[x].title,
                        type: '61',
                        picture:''
                    })
                }
            }
        }
        timesAll.value = setTimeout(() => {
            getRecommendAll()
        }, 10000)
    }
    const getRecommendOnce = async ()=>{
        let res = await context.$http.get('popupremind/page',{
            params: {
                type: '私人'
            }
        })
        let list = res.data.data.list
        for (let x in list) {
            if (new Date()>new Date(list[x].remindTime)) {
                let obj = await context.$http.get('storeup/page',{
                    params: {
                        refid: list[x].id,
                        tablename: 'popupremind',
                        type: '61',
                    }
                })
                if (!obj.data.data.list.length) {
                    context.$notify({
                        title: list[x].title,
                        dangerouslyUseHTMLString: true,
                        message: list[x].brief,
                        duration: 0,
                        position: 'top-right',
                        onClick() {
                            remindForm.value = list[x]
                            remindVisibie.value = true
                        }
                    })
                    context.$http.post('storeup/add',{
                        userid: store.getters['user/session'].id,
                        refid: list[x].id,
                        tablename: 'popupremind',
                        name: list[x].title,
                        type: '61',
                        picture:''
                    })
                }
            }
        }
        timesOnce.value = setTimeout(() => {
            getRecommendOnce()
        }, 10000)
    }

    if(context.$toolUtil.storageGet('sessionTable') != 'users'){
        getRecommendAll()
        getRecommendOnce()
    }

    onBeforeUnmount(()=>{
        clearTimeout(timesAll.value)
        clearTimeout(timesOnce.value)
    })
</script>

<style lang="scss" scoped>
	// 总盒子
	.top_view {
		// 左边盒子
		.top_left_view {
			// 折叠按钮盒子
			.fold_view {
				padding: 0 15px;
				// 图标
				.icons {
				}
			}
		}
		// 标题
		.projectTitle{
		}
		// 右部盒子
		.top_right_view{
			// 头像盒子
			.avatar-container {
				.avatar-wrapper {
					// 昵称
					.nickname {
					}
					// 头像
					.user-avatar {
					}
					// 图标
					.el-icon-arrow-down {
					}
				}
			}
		}
	}
	// 下拉盒子
	.el-dropdown-menu{
		// 下拉盒子itme
		:deep(.el-dropdown-menu__item){
		}
		// item悬浮
		:deep(.el-dropdown-menu__item:hover){
		}
	}
</style>
<style>
/*总盒子*/
.top_view{
    height: 80px;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    position: fixed;
    left: 0px;
    top: 0px;
    z-index: 9;
    padding: 0px;
    border-width: 0px;
    border-style: solid;
    border-color: rgb(221, 245, 206);
    background: #fff;
}
/*标题*/
.top_view .projectTitle{
    font-size: 24px;
    margin: 0px;
    padding: 0px 0px 0px 20px;
    line-height: 1;
    font-weight: 600;
    color: #000;
    order: 1;
    margin-right: auto;
}

/*左边盒子*/
.top_view .top_left_view{
    width: auto;
    display: none;
    height: 100%;
    align-items: center;
}
/*折叠按钮*/
.top_view .top_left_view .fold_view{
    display: flex;
    padding: 0px;
    margin: 0px 0px 0px 222px;
    background: rgb(139, 92, 126);
    border-radius: 50%;
    width: 32px;
    height: 32px;
    align-items: center;
    justify-content: center;
 }
.top_view .top_left_view .fold_view:hover {
    background:#fa9fa4;
 }
/*图标*/
.top_view .top_left_view .fold_view .icons{
    font-size: 24px;
    color: rgb(255, 255, 255);
}

/*系统公告*/
.top_view .notice-btn{
    background: rgba(255, 255, 255,.2);
    border-color: rgba(255, 255, 255,.5);
    padding: 0 16px;
    margin-right:20px;
    height: 50px;
    line-height: 50px;
    font-size: 14px;
    color: #333;
    order: 3;
    border-left: 1px solid #E9E9E9;
    height: 100%;
}
.top_view .notice-btn:hover{
    color:#fff; 
}
.top_view .notice-btn .iconfont{
    font-size: 16px;
}

/*右边盒子 横排*/
.top_view .top_right_view{
    width: auto;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: flex-end;
    order: 4;
    margin-right: 30px;
    padding-left: 20px;
    border-left: 1px solid #E9E9E9;
 }
.top_view .top_right_view .actionBar{ }
.top_view .top_right_view .actionBar .item { float:left; margin-right:20px; margin-bottom:5px; font-size:16px; color:#8b5c7e; font-weight:500;  }
.top_view .top_right_view .actionBar .item:hover { color:#fff; cursor:pointer;  }
.top_view .top_right_view .actionBar .item i { font-size:18px; }

.top_view .user-info{
    position:absolute;
    left:20px;
    display: flex;
    align-items: center;
}
.top_view .user-info .img-wrapper{
    margin-right:10px;
}
.top_view .user-info .img-wrapper .user-avatar{
    width:50px;
}
.top_view .user-info .nickname{
    font-size:16px;
    color:#fff; 
}


.top_view .weather {
    order: 2;
    display: flex;
    white-space: nowrap;
    line-height: 80px;
    column-gap: 4px;
    border-left: 1px solid #E9E9E9;
    padding-left: 20px;
}

.top_view img.user-avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
}

.top_view .avatar-wrapper {
    display: flex;
    align-items: center;
}

.top_view .nickname {
    white-space: nowrap;
    margin-right: 6px;
}

.top_view .nowDate {
    order: 2;
    white-space: nowrap;
    margin: 0 20px;
    padding-left: 20px;
    border-left: 1px solid #e9e9e9;
    line-height: 80px;
}

.top_view .breadcrumb-view {
    position: fixed;
    top: 80px;
    background: rgba(247, 247, 247, 1);
    width: calc(100% - 190px);
    left: 190px;
    height: 30px;
    display: flex;
    align-items: center;
    padding: 0 20px;
}
</style>