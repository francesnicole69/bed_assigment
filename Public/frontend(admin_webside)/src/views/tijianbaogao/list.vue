<template>
	<div>
		<div class="center_view">
			<div class="list_search_view">
				<el-form :model="searchQuery" class="search_form">
					<div class="search_view">
						<div class="search_label">
							physical examination item:
						</div>
						<div class="search_box">
							<el-input class="search_inp" v-model="searchQuery.tijianxiangmu" placeholder="physical examination item"
								clearable>
							</el-input>
						</div>
					</div>
					<div class="search_btn_view">
						<el-button class="search_btn" type="primary" @click="searchClick()" size="small">Search</el-button>
					</div>
				</el-form>
				<div class="btn_view">
					<el-button class="add_btn" type="success" @click="addClick" v-if="btnAuth('tijianbaogao', '新增')">
						Add
					</el-button>
					<el-button class="del_btn" type="danger" :disabled="selRows.length ? false : true"
						@click="delClick(null)" v-if="btnAuth('tijianbaogao', '删除')">
						Delete
					</el-button>
				</div>
			</div>
			<el-table v-loading="listLoading" border :stripe='false' @selection-change="handleSelectionChange"
				ref="table" v-if="btnAuth('tijianbaogao', '查看')" :data="list" @row-click="listChange">
				<el-table-column :resizable='true' align="left" header-align="left" type="selection" width="55" />
				<el-table-column label="No" width="70" :resizable='true' align="left" header-align="left">
					<template #default="scope">{{ (listQuery.page - 1) * listQuery.limit + scope.$index + 1 }}</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="tijianxiangmu" label="physical examination item">
					<template #default="scope">
						{{ scope.row.tijianxiangmu }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="tijianleixing" label="physical examination type">
					<template #default="scope">
						{{ scope.row.tijianleixing }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="tijiandidian" label="physical examination location">
					<template #default="scope">
						{{ scope.row.tijiandidian }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="tijianfeiyong" label="physical examination fee">
					<template #default="scope">
						{{ scope.row.tijianfeiyong }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="yonghuzhanghao" label="user account">
					<template #default="scope">
						{{ scope.row.yonghuzhanghao }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="yonghuxingming" label="user name">
					<template #default="scope">
						{{ scope.row.yonghuxingming }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="jigouzhanghao" label="institutional account number">
					<template #default="scope">
						{{ scope.row.jigouzhanghao }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="jigoumingcheng" label="institution name">
					<template #default="scope">
						{{ scope.row.jigoumingcheng }}
					</template>
				</el-table-column>
				<el-table-column label="report details" min-width="140" :resizable='true' :sortable='true' align="left"
					header-align="left">
					<template #default="scope">
						<el-button v-if="scope.row.baogaoxiangqing" size="small"
							@click="download(scope.row.baogaoxiangqing)">Download</el-button>
						<el-button v-else disabled link size="small">No</el-button>
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="baogaoshijian" label="report time">
					<template #default="scope">
						{{ scope.row.baogaoshijian }}
					</template>
				</el-table-column>
				<el-table-column label="operation" width="300" :resizable='true' :sortable='true' align="left"
					header-align="left">
					<template #default="scope">
						<el-button class="view_btn" type="info" v-if="btnAuth('tijianbaogao', '查看')"
							@click="infoClick(scope.row.id)">
							details
						</el-button>
						<el-button class="edit_btn" type="primary" @click="editClick(scope.row.id)"
							v-if="btnAuth('tijianbaogao', '修改')">
							edit </el-button>
						<el-button class="del_btn" type="danger" @click="delClick(scope.row.id)"
							v-if="btnAuth('tijianbaogao', '删除')">
							delete </el-button>
					</template>
				</el-table-column>
			</el-table>
			<el-pagination background :layout="layouts.join(',')" :total="total" :page-size="listQuery.limit"
				v-model:current-page="listQuery.page" prev-text="<" next-text=">" :hide-on-single-page="false"
				:style='{ "width": "100%", "padding": "0", "margin": "20px 0 0", "whiteSpace": "nowrap", "color": "#333", "fontWeight": "500" }'
				:page-sizes="[10, 20, 30, 40, 50, 100]" @size-change="sizeChange" @current-change="currentChange" />
		</div>
		<formModel ref="formRef" @formModelChange="formModelChange"></formModel>
	</div>
</template>
<script setup>
import axios from 'axios'
import moment from "moment"
import {
	reactive,
	ref,
	getCurrentInstance,
	nextTick,
	onMounted,
	watch,
	computed,
} from 'vue'
import {
	useRoute,
	useRouter
} from 'vue-router'
import {
	ElMessageBox
} from 'element-plus'
import {
	useStore
} from 'vuex';
const store = useStore()
const user = computed(() => store.getters['user/session'])
const avatar = ref(store.state.user.avatar)
const context = getCurrentInstance()?.appContext.config.globalProperties;
import formModel from './formModel.vue'
//基础信息

const tableName = 'tijianbaogao'
const formName = 'medical examination report'
const route = useRoute()
const router = useRouter()
//基础信息
onMounted(() => {
})
//列表数据
const list = ref(null)
const table = ref(null)
const listQuery = ref({
	page: 1,
	limit: 20,
	sort: 'id',
	order: 'desc'
})
const searchQuery = ref({})
const selRows = ref([])
const listLoading = ref(false)
const listChange = (row) => {
	nextTick(() => {
		//table.value.clearSelection()
		table.value.toggleRowSelection(row)
	})
}
//列表
const getList = () => {
	listLoading.value = true
	let params = JSON.parse(JSON.stringify(listQuery.value))
	params['sort'] = 'id'
	params['order'] = 'desc'
	if (searchQuery.value.tijianxiangmu && searchQuery.value.tijianxiangmu != '') {
		params['tijianxiangmu'] = '%' + searchQuery.value.tijianxiangmu + '%'
	}
	context.$http({
		url: `${tableName}/page`,
		method: 'get',
		params: params
	}).then(res => {
		listLoading.value = false
		list.value = res.data.data.list
		total.value = Number(res.data.data.total)
	})
}
//删
const delClick = (id) => {
	let ids = []
	if (id) {
		ids = [id]
	} else {
		if (selRows.value.length) {
			for (let x in selRows.value) {
				ids.push(selRows.value[x].id)
			}
		} else {
			return false
		}
	}
	ElMessageBox.confirm(`Do you want to delete the selected items ${formName}`, 'warning', {
		confirmButtonText: 'Yes',
		cancelButtonText: 'No',
		type: 'warning',
	}).then(() => {
		context.$http({
			url: `${tableName}/delete`,
			method: 'post',
			data: ids
		}).then(res => {
			context?.$toolUtil.message('Delete successful', 'success', () => {
				getList()
			})
		})
	}).catch(_ => { })
}
//多选
const handleSelectionChange = (e) => {
	selRows.value = e
}
//列表数据
//分页
const total = ref(0)
const layouts = ref(["total", "prev", "pager", "next", "sizes", "jumper"])
const sizeChange = (size) => {
	listQuery.value.limit = size
	getList()
}
const currentChange = (page) => {
	listQuery.value.page = page
	getList()
}
//分页
//权限验证
const btnAuth = (e, a) => {
	return context?.$toolUtil.isAuth(e, a)
}
//搜索
const searchClick = () => {
	listQuery.value.page = 1
	getList()
}
//表单
const formRef = ref(null)
const formModelChange = () => {
	searchClick()
}
const addClick = () => {
	formRef.value.init()
}
const editClick = (id = null) => {
	if (id) {
		formRef.value.init(id, 'edit')
		return
	}
	if (selRows.value.length) {
		formRef.value.init(selRows.value[0].id, 'edit')
	}
}

const infoClick = (id = null) => {
	if (id) {
		formRef.value.init(id, 'info')
	}
	else if (selRows.value.length) {
		formRef.value.init(selRows.value[0].id, 'info')
	}
}
// 表单
// 预览文件
const preClick = (file) => {
	if (!file) {
		context?.$toolUtil.message('file does not exist', 'error')
	}
	window.open(context?.$config.url + file)
}
// 下载文件
const download = (file) => {
	if (!file) {
		context?.$toolUtil.message('file does not exist', 'error')
	}
	let arr = file.replace(new RegExp('file/', "g"), "")
	axios.get((location.href.split(context?.$config.name).length > 1 ? location.href.split(context?.$config.name)[0] : '') + context?.$config.name + '/file/download?fileName=' + arr, {
		headers: {
			token: context?.$toolUtil.storageGet('Token')
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
//初始化
const init = () => {
	getList()
}
init()
</script>
<style lang="scss" scoped>
// 操作盒子
.list_search_view {

	// 搜索盒子
	.search_form {

		// 子盒子
		.search_view {

			// 搜索label
			.search_label {}

			// 搜索item
			.search_box {

				// 输入框
				:deep(.search_inp) {}
			}
		}

		// 搜索按钮盒子
		.search_btn_view {

			// 搜索按钮
			.search_btn {}

			// 搜索按钮-悬浮
			.search_btn:hover {}
		}
	}

	//头部按钮盒子
	.btn_view {

		// 其他
		:deep(.el-button--default) {}

		// 其他-悬浮
		:deep(.el-button--default:hover) {}

		// 新增
		:deep(.el-button--success) {}

		// 新增-悬浮
		:deep(.el-button--success:hover) {}

		// 删除
		:deep(.el-button--danger) {}

		// 删除-悬浮
		:deep(.el-button--danger:hover) {}

		// 统计
		:deep(.el-button--warning) {}

		// 统计-悬浮
		:deep(.el-button--warning:hover) {}
	}
}

// 表格样式
.el-table {
	:deep(.el-table__header-wrapper) {
		thead {
			tr {
				th {
					.cell {}
				}
			}
		}
	}

	:deep(.el-table__body-wrapper) {
		tbody {
			tr {
				td {
					.cell {

						// 编辑
						.el-button--primary {}

						// 编辑-悬浮
						.el-button--primary:hover {}

						// 详情
						.el-button--info {}

						// 详情-悬浮
						.el-button--info:hover {}

						// 删除
						.el-button--danger {}

						// 删除-悬浮
						.el-button--danger:hover {}

						// 跨表
						.el-button--success {}

						// 跨表-悬浮
						.el-button--success:hover {}

						// 操作
						.el-button--warning {}

						// 操作-悬浮
						.el-button--warning:hover {}
					}
				}
			}

			tr:hover {
				td {}
			}
		}
	}
}

// 分页器
.el-pagination {

	// 总页码
	:deep(.el-pagination__total) {
		margin: 0 10px 0 0;
		color: #666;
		font-weight: 400;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}

	// 上一页
	:deep(.btn-prev) {
		border: none;
		border-radius: 2px;
		padding: 0;
		margin: 0 5px;
		color: #666;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		min-width: 35px;
		height: 28px;
	}

	// 下一页
	:deep(.btn-next) {
		border: none;
		border-radius: 2px;
		padding: 0;
		margin: 0 5px;
		color: #666;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		min-width: 35px;
		height: 28px;
	}

	// 上一页禁用
	:deep(.btn-prev:disabled) {
		border: none;
		cursor: not-allowed;
		border-radius: 2px;
		padding: 0;
		margin: 0 5px;
		color: #C0C4CC;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}

	// 下一页禁用
	:deep(.btn-next:disabled) {
		border: none;
		cursor: not-allowed;
		border-radius: 2px;
		padding: 0;
		margin: 0 5px;
		color: #C0C4CC;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}

	// 页码
	:deep(.el-pager) {
		padding: 0;
		margin: 0;
		display: inline-block;
		vertical-align: top;

		// 数字
		.number {
			cursor: pointer;
			padding: 0 4px;
			margin: 0 5px;
			color: #666;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 28px;
			border-radius: 2px;
			background: #f4f4f5;
			text-align: center;
			min-width: 30px;
			height: 28px;
		}

		// 数字悬浮
		.number:hover {
			cursor: pointer;
			padding: 0 4px;
			margin: 0 5px;
			color: #409EFF;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 28px;
			border-radius: 2px;
			background: #f4f4f5;
			text-align: center;
			min-width: 30px;
			height: 28px;
		}

		// 选中
		.number.is-active {
			cursor: default;
			padding: 0 4px;
			margin: 0 5px;
			color: #FFF;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 28px;
			border-radius: 2px;
			background: #409EFF;
			text-align: center;
			min-width: 30px;
			height: 28px;
		}
	}

	// sizes
	:deep(.el-pagination__sizes) {
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;

		.el-select {
			border: 1px solid #DCDFE6;
			cursor: pointer;
			padding: 0;
			color: #606266;
			display: inline-block;
			font-size: 13px;
			line-height: 28px;
			border-radius: 3px;
			outline: 0;
			background: #FFF;
			width: 100%;
			text-align: center;
			height: 28px;
		}
	}

	// 跳页
	:deep(.el-pagination__jump) {
		margin: 0 0 0 24px;
		color: #606266;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;

		// 输入框
		.el-input {
			border: 1px solid #DCDFE6;
			cursor: pointer;
			padding: 0 3px;
			color: #606266;
			display: inline-block;
			font-size: 14px;
			line-height: 28px;
			border-radius: 3px;
			outline: 0;
			background: #FFF;
			width: 100%;
			text-align: center;
			height: 28px;
		}
	}
}
</style>
