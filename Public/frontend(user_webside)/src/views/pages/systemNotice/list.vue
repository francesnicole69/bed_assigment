<template>
	<div class="list-page" :style='{}'>
        <div class="breadcrumb-wrapper" style="width: 100%;">
            <div class="bread_view">
                <el-breadcrumb separator="Ξ" class="breadcrumb">
                    <el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">home page</el-breadcrumb-item>
                    <el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
                </el-breadcrumb>
            </div>
            <div class="back_view" v-if="centerType">
                <el-button class="back_btn" @click="backClick" type="primary">返回</el-button>
            </div>
        </div>
		<el-form :inline="true" :model="searchQuery" class="list_search" @submit.native.prevent>
			<div class="search_view">
				<div class="search_label">
					公告内容：
				</div>
				<div class="search_box">
					<el-input class="search_inp" v-model="searchQuery.content" placeholder="公告内容"
						clearable>
					</el-input>
				</div>
			</div>
			<div class="search_btn_view">
				<el-button class="search_btn" type="primary" @click="searchClick">搜索</el-button>
				<el-button class="add_btn" type="success" v-if="btnAuth('system_notice','新增')" @click="addClick">新增</el-button>
			</div>
		</el-form>
		<div class="page_list">
			<div class="data_box">
				<div class="data_view">
					<div class="data_item" v-for="(item,index) in list" :key="index" @click.stop="detailClick(item.id)" >
						<div class="data_content">
						</div>
					</div>
				</div>
				<el-pagination
					background 
					:layout="layouts.join(',')"
					:total="total" 
					:page-size="listQuery.limit"
                    v-model:current-page="listQuery.page"
					prev-text="prev"
					next-text="next"
					:hide-on-single-page="false"
					:style='{}'
					@size-change="sizeChange"
					@current-change="currentChange"/>
			</div>
		</div>
		<el-dialog v-model="preViewVisible" :title="'View the large image'" width="40%" destroy-on-close>
            <div style="text-align:center">
                <img :src="preViewUrl" style="max-width: 100%;" alt="">
            </div>
		</el-dialog>
	</div>
</template>

<script setup>
	import {
		ref,
		getCurrentInstance,
		nextTick,
        computed,
        inject,
	} from 'vue';
	import {
		useRoute,
		useRouter
	} from 'vue-router';
    import {
        useStore
    } from 'vuex';
    const store = useStore()
    const user = computed(()=>store.getters['user/session'])
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const router = useRouter()
	const route = useRoute()
	//基础信息
	const tableName = 'systemnotice'
	const formName = '消息通知'
	//基础信息
	const breadList = ref([{
		name: formName
	}])
	const list = ref([])
	const listQuery = ref({
		page: 1,
		limit: Number(12)
	})
	const total = ref(0)
	const listLoading = ref(false)
	//权限验证
	const btnAuth = (e,a)=>{
		if(centerType.value){
			return context?.$toolUtil.isBackAuth(e,a)
		}else{
			return context?.$toolUtil.isAuth(e,a)
		}
	}
	const addClick = () => {
		router.push('/index/systemNoticeAdd')
	}
	//判断是否从个人中心跳转
	const centerType = ref(false)
	//返回
	const backClick = () => {
		router.push(`/index/${context?.$toolUtil.storageGet('frontSessionTable')}Center`)
	}
	//搜索
	const searchQuery = ref({})
	//下拉列表
	const searchClick = () => {
		listQuery.value.page = 1
		getList()
	}
	//分页
	const layouts = ref(["total","prev","pager","next","sizes","jumper"])
	const sizeChange = (size) => {
		listQuery.value.limit = size
		getList()
	}
	const currentChange = (page) => {
		listQuery.value.page = page
		getList()
	}
	//分页
	//列表
	const getList = () => {
		listLoading.value = true
		let params = JSON.parse(JSON.stringify(listQuery.value))
		if(searchQuery.value.content&&searchQuery.value.content!=''){
			params.content = '%' + searchQuery.value.content + '%'
		}
		context?.$http({
			url: `${tableName}/${centerType.value?'page':'list'}`,
			method: 'get',
			params: params
		}).then(res => {
			listLoading.value = false
			list.value = res.data.data.list
			total.value = Number(res.data.data.total)
		})
	}
	const detailClick = (id) => {
		router.push(`${tableName}Detail?id=` + id + (centerType.value?'&&centerType=1':''))
	}
	//下载文件
	const download = (file) =>{
		if(!file){
			context?.$toolUtil.message('File does not exist','error')
		}
		const a = document.createElement('a');
		a.style.display = 'none';
		a.setAttribute('target', '_blank');
		file && a.setAttribute('download', file);
		a.href = context?.$config.url + file;
		document.body.appendChild(a);
		a.click();
		document.body.removeChild(a);
	}
	// View the large image
	const preViewUrl = ref('')
	const preViewVisible = ref(false)
	const preViewClick = (url) =>{
		preViewUrl.value = url
		preViewVisible.value = true
	}
	const init = async() => {
		if(route.query.centerType){
			centerType.value = true
		}
        if(context.$toolUtil.storageGet('frontToken') && !user.value.id){
            await store.dispatch("user/getSession")
        }
		getList()
	}
	init()
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
	// 分类盒子
	.category_view {
		// 分类item
		.category {
		}
		// item-悬浮
		.category:hover {
		}
		// item-选中
		.categoryActive {
		}
	}

	//搜索
	.list_search {
		.search_view {
			.search_label {
			}
			.search_box {
				// 输入框
				:deep(.search_inp) {
					.is-focus {
						box-shadow: none !important;
					}
				}
			}
		}
		.search_btn_view {
			// 搜索按钮
			.search_btn {
			}
			// 搜索按钮-悬浮
			.search_btn:hover {
			}
			// 新增按钮
			.add_btn {
			}
			// 新增按钮-悬浮
			.add_btn:hover {
			}
		}
	}

	// 数据盒子
	.page_list {
		//列表
		.data_box {
			.data_view {
				.data_item:nth-of-type(2n - 1) {
					// 图片盒子
					.data_img_box {
						width: 100%;
						// 图片
						.data_img {
							object-fit: cover;
							width: 100%;
							height: 100%;
						}
					}
					// 内容盒子
					.data_content {
						// 价格
						.data_price {
							color: #f00;
						}
						// 标题1
						.data_title1 {
							margin: 0 0 10px;
							width: 100%;
							text-align: center;
						}
						// 标题2
						.data_title2 {
							margin: 0 0 10px;
							width: 100%;
							text-align: center;
						}
						// 标题3
						.data_title3 {
							margin: 0 0 10px;
							width: 100%;
							text-align: center;
						}
						// 标题4
						.data_title4 {
							margin: 0 0 10px;
							width: 100%;
							text-align: center;
						}
						// 标题5
						.data_title5 {
							margin: 0 0 10px;
							width: 100%;
							text-align: center;
						}
						// 底部栏
						.data_operate_box {
							display: flex;
							justify-content: center;
							align-items: center;
							// 点赞数
							.data_like {
								margin: 0 10px 0 0;
								color: #0266b5;
								display: flex;
								font-size: 16px;
								align-items: center;
								.like_icon {
									margin: 0 4px 0 0;
									color: inherit;
								}
								.like_num {
									color: inherit;
								}
							}
							// 收藏数
							.data_collect {
								margin: 0 10px 0 0;
								color: #ee7810;
								display: flex;
								font-size: 16px;
								align-items: center;
								.el-icon {
									margin: 0 4px 0 0;
									color: inherit;
								}
								.collect_num {
									color: inherit;
								}
							}
							// 点击数
							.data_clickNum {
								margin: 0 10px 0 0;
								color: #4aac26;
								display: flex;
								font-size: 16px;
								align-items: center;
								.el-icon {
									margin: 0 4px 0 0;
									color: inherit;
								}
								.clickNum_num {
									color: inherit;
								}
							}
						}
					}
				}
				.data_item:nth-of-type(2n) {
					// 图片盒子
					.data_img_box {
						width: 100%;
						// 图片
						.data_img {
							object-fit: cover;
							width: 100%;
							height: 100%;
						}
					}
					// 内容盒子
					.data_content {
						// 价格
						.data_price {
							color: #f00;
						}
						// 标题1
						.data_title1 {
							margin: 0 0 10px;
							width: 100%;
							text-align: center;
						}
						// 标题2
						.data_title2 {
							margin: 0 0 10px;
							width: 100%;
							text-align: center;
						}
						// 标题3
						.data_title3 {
							margin: 0 0 10px;
							width: 100%;
							text-align: center;
						}
						// 标题4
						.data_title4 {
							margin: 0 0 10px;
							width: 100%;
							text-align: center;
						}
						// 标题5
						.data_title5 {
							margin: 0 0 10px;
							width: 100%;
							text-align: center;
						}
						// 底部栏
						.data_operate_box {
							display: flex;
							justify-content: center;
							align-items: center;
							// 点赞数
							.data_like {
								margin: 0 10px 0 0;
								color: #0266b5;
								display: flex;
								font-size: 16px;
								align-items: center;
								.like_icon {
									margin: 0 4px 0 0;
									color: inherit;
								}
								.like_num {
									color: inherit;
								}
							}
							// 收藏数
							.data_collect {
								margin: 0 10px 0 0;
								color: #ee7810;
								display: flex;
								font-size: 16px;
								align-items: center;
								.el-icon {
									margin: 0 4px 0 0;
									color: inherit;
								}
								.collect_num {
									color: inherit;
								}
							}
							// 点击数
							.data_clickNum {
								margin: 0 10px 0 0;
								color: #4aac26;
								display: flex;
								font-size: 16px;
								align-items: center;
								.el-icon {
									margin: 0 4px 0 0;
									color: inherit;
								}
								.clickNum_num {
									color: inherit;
								}
							}
						}
					}
				}
				.data_item:nth-of-type(2n - 1):hover {
					// 图片盒子
					.data_img_box {
						// 图片
						.data_img {
						}
					}
					// 内容盒子
					.data_content {
						// 价格
						.data_price {
						}
						// 标题1
						.data_title1 {
						}
						// 标题2
						.data_title2 {
						}
						// 标题3
						.data_title3 {
						}
						// 标题4
						.data_title4 {
						}
						// 标题5
						.data_title5 {
						}
						// 底部栏
						.data_operate_box {
							// 点赞数
							.data_like {
								.like_icon {
								}
								.like_num {
								}
							}
							// 收藏数
							.data_collect {
								.el-icon {
								}
								.collect_num {
								}
							}
							// 点击数
							.data_clickNum {
								.el-icon {
								}
								.clickNum_num {
								}
							}
						}
					}
				}
				.data_item:nth-of-type(2n):hover {
					// 图片盒子
					.data_img_box {
						// 图片
						.data_img {
						}
					}
					// 内容盒子
					.data_content {
						// 价格
						.data_price {
						}
						// 标题1
						.data_title1 {
						}
						// 标题2
						.data_title2 {
						}
						// 标题3
						.data_title3 {
						}
						// 标题4
						.data_title4 {
						}
						// 标题5
						.data_title5 {
						}
						// 底部栏
						.data_operate_box {
							// 点赞数
							.data_like {
								.like_icon {
								}
								.like_num {
								}
							}
							// 收藏数
							.data_collect {
								.el-icon {
								}
								.collect_num {
								}
							}
							// 点击数
							.data_clickNum {
								.el-icon {
								}
								.clickNum_num {
								}
							}
						}
					}
				}
			}
		}
	}

	// 分页器
	.el-pagination {
		// 总页码
		:deep(.el-pagination__total) {
		}
		// prev
		:deep(.btn-prev) {
		}
		// next
		:deep(.btn-next) {
		}
		// prev禁用
		:deep(.btn-prev:disabled) {
		}
		// next禁用
		:deep(.btn-next:disabled) {
		}
		// 页码
		:deep(.el-pager) {
			// 数字
			.number {
			}
			// 数字悬浮
			.number:hover {
			}
			// 选中
			.number.is-active {
			}
		}
		// sizes
		:deep(.el-pagination__sizes) {
			.el-select {
				//去掉默认样式
				.select-trigger{
					height: 100%;
					.el-input{
						height: 100%;
						.is-focus {
							box-shadow: none !important;
						}
					}
				}
			}
		}
		// 跳页
		:deep(.el-pagination__jump) {
			// 输入框
			.el-input {
				.is-focus {
					box-shadow: none !important;
				}
			}
		}
	}
	
	// 热门信息盒子
	.hot_view {
		// 标题
		.hot_title {
		}

		.hot_list {
			// item
			.hot {
				//图片盒子
				.hot_img_view {
					// 图片
					.hot_img {
					}
				}
				// 内容盒子
				.hot_content {
					// 名称
					.hot_text {
					}
				}
			}
		}
	}
</style>