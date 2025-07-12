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
							<el-input class="search_inp" v-model="searchQuery.tijianxiangmu"
								placeholder="physical examination item" clearable>
							</el-input>
						</div>
					</div>
					<div class="search_view">
						<div class="search_label">
							state of payment:
						</div>
						<div class="search_box">
							<el-select class="search_sel" clearable v-model="searchQuery.ispay" placeholder="state of payment">
								<el-option label="have paid" value="have paid"></el-option>
								<el-option label="not paid" value="not paid"></el-option>
							</el-select>
						</div>
					</div>
					<div class="search_btn_view">
						<el-button class="search_btn" type="primary" @click="searchClick()" size="small">search</el-button>
					</div>
				</el-form>
				<div class="btn_view">
					<el-button class="add_btn" type="success" @click="addClick" v-if="btnAuth('tijianyuyue', '新增')">
						add
					</el-button>
					<el-button class="del_btn" type="danger" :disabled="selRows.length ? false : true"
						@click="delClick(null)" v-if="btnAuth('tijianyuyue', '删除')">
						delete
					</el-button>
					<el-button class="statis_btn" type="warning" @click="echartClick1"
						v-if="btnAuth('tijianyuyue', '体检人数')">
						physical examination statistics
					</el-button>
				</div>
			</div>
			<el-table v-loading="listLoading" border :stripe='false' @selection-change="handleSelectionChange"
				ref="table" v-if="btnAuth('tijianyuyue', '查看')" :data="list" @row-click="listChange">
				<el-table-column :resizable='true' align="left" header-align="left" type="selection" width="55" />
				<el-table-column label="No" width="70" :resizable='true' align="left" header-align="left">
					<template #default="scope">{{ (listQuery.page - 1) * listQuery.limit + scope.$index + 1 }}</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="tijianxiangmu" label="Physical examination item">
					<template #default="scope">
						{{ scope.row.tijianxiangmu }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="tijianleixing" label="Physical examination type">
					<template #default="scope">
						{{ scope.row.tijianleixing }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="tijiandidian" label="Physical examination location">
					<template #default="scope">
						{{ scope.row.tijiandidian }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="tijianfeiyong" label="Physical examination fee">
					<template #default="scope">
						{{ scope.row.tijianfeiyong }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="keyuerenshu" label="Number of reservations">
					<template #default="scope">
						{{ scope.row.keyuerenshu }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="yuyueshijian" label="Reservation time">
					<template #default="scope">
						{{ scope.row.yuyueshijian }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="yonghuzhanghao" label="User account">
					<template #default="scope">
						{{ scope.row.yonghuzhanghao }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="yonghuxingming" label="User name">
					<template #default="scope">
						{{ scope.row.yonghuxingming }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="jigouzhanghao" label="Institutional account number">
					<template #default="scope">
						{{ scope.row.jigouzhanghao }}
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="jigoumingcheng" label="Institution name">
					<template #default="scope">
						{{ scope.row.jigoumingcheng }}
					</template>
				</el-table-column>
				<el-table-column prop="ispay" label="Payment status" min-width="140" :resizable='true' :sortable='true'
					align="left" header-align="left">
					<template #default="scope">
						<span style="margin-right:10px">{{ scope.row.ispay == 'have paid' ? 'have paid' : 'not paid' }}</span>
						<el-button v-if="scope.row.ispay != 'have paid' && btnAuth('tijianyuyue', '支付')" size="small"
							@click.stop="payClick(scope.row)">Pay</el-button>
					</template>
				</el-table-column>
				<el-table-column min-width="140" :resizable='true' :sortable='true' align="left" header-align="left"
					prop="tijianzhuangtai" label="Physical examination status">
					<template #default="scope">
						{{ scope.row.tijianzhuangtai }}
					</template>
				</el-table-column>
				<el-table-column label="operation" width="300" :resizable='true' :sortable='true' align="left"
					header-align="left">
					<template #default="scope">
						<el-button class="view_btn" type="info" v-if="btnAuth('tijianyuyue', '查看')"
							@click="infoClick(scope.row.id)">
							details
						</el-button>
						<el-button class="edit_btn" type="primary" @click="editClick(scope.row.id)"
							v-if="btnAuth('tijianyuyue', '修改')">
							Edit </el-button>
						<el-button class="del_btn" type="danger" @click="delClick(scope.row.id)"
							v-if="btnAuth('tijianyuyue', '删除')">
							delete </el-button>
						<el-button class="cross_btn" v-if="btnAuth('tijianyuyue', '体检')" type="success"
							@click="tijianxinxiCrossAddOrUpdateHandler(scope.row, 'cross', '是', '否', 'tijianzhuangtai', '已体检', '已体检,未体检'.split(',')[0])">
							Physical examination
						</el-button>
						<el-button class="cross_btn" v-if="btnAuth('tijianyuyue', '取消')" type="success"
							@click="quxiaoyuyueCrossAddOrUpdateHandler(scope.row, 'cross', '否', '否', '', '')">
							Cancel
						</el-button>
					</template>
				</el-table-column>
			</el-table>
			<el-pagination background :layout="layouts.join(',')" :total="total" :page-size="listQuery.limit"
				v-model:current-page="listQuery.page" prev-text="<" next-text=">" :hide-on-single-page="false"
				:style='{ "width": "100%", "padding": "0", "margin": "20px 0 0", "whiteSpace": "nowrap", "color": "#333", "fontWeight": "500" }'
				:page-sizes="[10, 20, 30, 40, 50, 100]" @size-change="sizeChange" @current-change="currentChange" />
		</div>
		<formModel ref="formRef" @formModelChange="formModelChange"></formModel>
		<payForm ref="pay" @payChange="searchClick()"></payForm>
		<!-- 统计图弹窗 -->
		<el-dialog v-model="echartVisible" title="统计图" width="70%">
			<div id="keyuerenshuEchart1" style="width:100%;height:600px;"></div>
			<template #footer>
				<span class="formModel_btn_box">
					<el-button class="cancel_btn" @click="echartVisible = false">取消</el-button>
				</span>
			</template>
		</el-dialog>
		<tijianxinxiFormModel ref="tijianxinxiFormModelRef" @formModelChange="formModelChange"></tijianxinxiFormModel>
		<quxiaoyuyueFormModel ref="quxiaoyuyueFormModelRef" @formModelChange="formModelChange"></quxiaoyuyueFormModel>
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
	inject
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

const tableName = 'tijianyuyue'
const formName = 'Medical examination appointment'
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
	params['sort'] = 'yuyueshijian';
	params['order'] = 'desc';
	if (searchQuery.value.ispay && searchQuery.value.ispay != '') {
		params['ispay'] = searchQuery.value.ispay
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
import '@/assets/js/echarts-theme'
// 统计图1
const echarts = inject("echarts")
const echartVisible = ref(false)
const echartClick1 = () => {
	echartVisible.value = true
	nextTick(() => {
		var keyuerenshuEchart1 = echarts.init(document.getElementById("keyuerenshuEchart1"), 'theme');
		context.$http({
			url: `${tableName}/value/tijianxiangmu/keyuerenshu?order=desc`,
			method: 'get'
		}).then(res => {
			let obj = res.data.data
			let xAxis = [];
			let yAxis = [];
			let dataList = []
			for (let i = 0; i < obj.length; i++) {
				xAxis.push(obj[i].tijianxiangmu);
				yAxis.push(parseFloat((obj[i].total)));
				dataList.push({
					value: parseFloat((obj[i].total)),
					name: obj[i].tijianxiangmu
				})
			}
			var option = {};
			option = {
				title: {
					text: 'Number of physical examinations',
					left: 'center'
				},
				grid: {
					containLabel: true
				},
				tooltip: {
					trigger: 'item',
					formatter: '{b} : {c}'
				},
				xAxis: {
					data: xAxis,
					type: 'category',
					axisLabel: {
						interval: 0,
						rotate: 30
					}
				},
				yAxis: {
					type: 'value',
					minInterval: 1
				},
				series: {
					data: yAxis,
					type: 'bar'
				}
			}
			// 使用刚指定的配置项和数据显示图表。
			keyuerenshuEchart1.setOption(option);
			//根据窗口的大小变动图表
			window.onresize = function () {
				keyuerenshuEchart1.resize();
			};
		})
	})
}
import payForm from '@/components/common/payForm'
const pay = ref(null)
const payClick = (row) => {
	pay.value.payClick(tableName, row)
}
import tijianxinxiFormModel from '@/views/tijianxinxi/formModel'
const tijianxinxiFormModelRef = ref(null)
const tijianxinxiCrossAddOrUpdateHandler = (row, type, crossOptAudit, crossOptPay, statusColumnName, tips, statusColumnValue) => {
	if (crossOptPay == '是' && row.ispay != '已支付') {
		context.$toolUtil.message("请支付完成再操作", 'error');
		return
	}
	if (statusColumnName != '' && !statusColumnName.startsWith("[")) {
		var obj = row
		for (var o in obj) {
			if (o == statusColumnName && obj[o] == statusColumnValue) {
				context?.$toolUtil.message(tips, 'error')
				return;
			}
		}
	}
	nextTick(() => {
		tijianxinxiFormModelRef.value.init(row.id, 'cross', '体检', row, 'tijianyuyue', statusColumnName, tips, statusColumnValue)
	})
}
import quxiaoyuyueFormModel from '@/views/quxiaoyuyue/formModel'
const quxiaoyuyueFormModelRef = ref(null)
const quxiaoyuyueCrossAddOrUpdateHandler = (row, type, crossOptAudit, crossOptPay, statusColumnName, tips, statusColumnValue) => {
	if (crossOptPay == '是' && row.ispay != 'have paid') {
		context.$toolUtil.message("Please complete the payment before proceeding.", 'error');
		return
	}
	if (statusColumnName != '' && !statusColumnName.startsWith("[")) {
		var obj = row
		for (var o in obj) {
			if (o == statusColumnName && obj[o] == statusColumnValue) {
				context?.$toolUtil.message(tips, 'error')
				return;
			}
		}
	}
	nextTick(() => {
		quxiaoyuyueFormModelRef.value.init(row.id, 'cross', '取消', row, 'tijianyuyue', statusColumnName, tips, statusColumnValue)
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

				// 下拉框
				:deep(.search_sel) {

					//去掉默认样式
					.select-trigger {
						height: 100%;

						.el-input {
							height: 100%;
						}
					}
				}
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
