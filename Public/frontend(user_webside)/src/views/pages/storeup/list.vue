<template>
	<div class="list-page" :style='{}'>
        <div class="breadcrumb-wrapper" style="width: 100%;">
            <div class="bread_view">
                <el-breadcrumb separator="Ξ" class="breadcrumb">
                    <el-breadcrumb-item class="second_breadcrumb" :to="{ path: `/index/${sessionTable}Center` }">personal center</el-breadcrumb-item>
                    <el-breadcrumb-item class="second_breadcrumb">{{formName}}</el-breadcrumb-item>
                </el-breadcrumb>
            </div>
            <div class="back_view" v-if="centerType">
                <el-button class="back_btn" @click="backClick" type="primary">back</el-button>
            </div>
        </div>
		<el-form :inline="true" :model="searchQuery" class="list_search" @submit.native.prevent>
			<div class="search_view">
				<div class="search_label">
					name:
				</div>
				<div class="search_box">
					<el-input class="search_inp" v-model="searchQuery.name" placeholder="name"
						size="small" clearable>
					</el-input>
				</div>
			</div>
			<div class="search_btn_view">
				<el-button class="search_btn" type="primary" @click="searchClick">search</el-button>
			</div>
		</el-form>
		<div class="page_list">
			<div class="data_box">
				<div class="data_view">
					<div class="data_item" v-for="(item,index) in list" :key="index" @click.stop="detailClick(item)">
						<div class="data_img_box" v-if="item.picture && item.picture.substr(0,4)=='http'">
							<el-image class="data_img" :src="item.picture" fit="cover"></el-image>
						</div>
						<div class="data_img_box" v-else>
							<el-image class="data_img" :src="item.picture?$config.url + item.picture.split(',')[0]:''"
								fit="cover"></el-image>
						</div>
						<div class="data_content">
							<div class="data_title1">{{item.name}}</div>
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
	</div>
</template>

<script setup>
	import {
		ref,
		getCurrentInstance,
		nextTick,
	} from 'vue';
	import {
		useRoute,
		useRouter
	} from 'vue-router';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const router = useRouter()
	const route = useRoute()
    const sessionTable = localStorage.getItem('frontSessionTable')
	//基础信息
	const tableName = 'storeup'
	const formName = ref('')
	const list = ref([])
	const listQuery = ref({
		page: 1,
		limit: 20,
        sort: 'id',
        order: 'desc'
	})
	const total = ref(0)
	const listLoading = ref(false)
	//权限验证
	const btnAuth = (e, a) => {
		return context?.$toolUtil.isAuth(e, a)
	}
	//判断是否从个人中心跳转
	const centerType = ref(false)
	//返回
	const backClick = () => {
		router.push(`/index/${sessionTable}Center`)
	}
	const init = () => {
		if (route.query.centerType) {
			centerType.value = true
		}

        if(route.query.type=='1'){
            formName.value = 'my favorite'
        }
		getList()
	}
	//搜索
	const searchQuery = ref({})

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
		if (searchQuery.value.name && searchQuery.value.name != '') {
			params.name = '%' + searchQuery.value.name + '%'
		}
		if (route.query.type) {
			params.type = route.query.type
		}
		context?.$http({
			url: `${tableName}/page`,
			method: 'get',
			params: params
		}).then(res => {
			listLoading.value = false
			list.value = res.data.data.list
			total.value = Number(res.data.data.total)
		})
	}
	const detailClick = (item) => {
        if(item.tablename == 'news'){
            router.push(`newsList?id=${item.refid}`)
            return
        }
		router.push(`${item.tablename}Detail?id=${item.refid}`)
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

	//搜索
	.list_search {
		.search_view {
			.search_label {
			}
			.search_box {
				// 输入框
				:deep(.search_inp) {

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
						// 标题1
						.data_title1 {
							margin: 0 0 10px;
							width: 100%;
							text-align: center;
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
						// 标题1
						.data_title1 {
							margin: 0 0 10px;
							width: 100%;
							text-align: center;
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
						// 标题1
						.data_title1 {
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
						// 标题1
						.data_title1 {
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

					}
				}
			}
		}
		// 跳页
		:deep(.el-pagination__jump) {
			// 输入框
			.el-input {

			}
		}
	}
</style>