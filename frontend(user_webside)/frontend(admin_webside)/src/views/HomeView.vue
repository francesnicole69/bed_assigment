<template>
	<div class="home_view">
		<div class="projectTitle">欢迎使用 {{projectName}}</div>
		<div class="count_list">
			<el-collapse-transition v-if="btnAuth('tijianyuyue','Total number of pages on the home page')">
				<el-card v-show="countTypeList.closetijianyuyueCountType" class="card_view count-item">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								Medical examination appointment
							</div>
							<div class="card_head_right">
								<el-icon @click="countTypeClick('hiddentijianyuyueCountType')" class="showIcons"
									:class="countTypeList.hiddentijianyuyueCountType?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="countTypeClick('closetijianyuyueCountType')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="count_item" v-show="countTypeList.hiddentijianyuyueCountType">
							<div class="count_title">Total number of medical examination appointments</div>
							<div class="count_num">{{tijianyuyueCount}}</div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
			<el-collapse-transition v-if="btnAuth('yuyueguahao','Total number of pages on the home page')">
				<el-card v-show="countTypeList.closeyuyueguahaoCountType" class="card_view count-item">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								Appointment registration
							</div>
							<div class="card_head_right">
								<el-icon @click="countTypeClick('hiddenyuyueguahaoCountType')" class="showIcons"
									:class="countTypeList.hiddenyuyueguahaoCountType?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="countTypeClick('closeyuyueguahaoCountType')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="count_item" v-show="countTypeList.hiddenyuyueguahaoCountType">
							<div class="count_title">Total number of appointment registrations</div>
							<div class="count_num">{{yuyueguahaoCount}}</div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
		</div>
		<div class="card_list">
			<el-collapse-transition v-if="btnAuth('tijianyuyue','首页统计')">
				<el-card v-show="cardTypeList.closetijianyuyueChartType1" class="card_view chart-item">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								Medical examination appointment
							</div>
							<div class="card_head_right">
								<el-icon @click="cardTypeClick('hiddentijianyuyueChartType1')" class="showIcons"
										 :class="cardTypeList.hiddentijianyuyueChartType1?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="cardTypeClick('closetijianyuyueChartType1')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="card_item" v-show="cardTypeList.hiddentijianyuyueChartType1">
							<div id="tijianyuyuekeyuerenshuEchart1" class="Echart" style="width: 100%;height: 400px;"></div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
			<el-collapse-transition v-if="btnAuth('yuyueguahao','首页统计')">
				<el-card v-show="cardTypeList.closeyuyueguahaoChartType1" class="card_view chart-item">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								Appointment registration
							</div>
							<div class="card_head_right">
								<el-icon @click="cardTypeClick('hiddenyuyueguahaoChartType1')" class="showIcons"
										 :class="cardTypeList.hiddenyuyueguahaoChartType1?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="cardTypeClick('closeyuyueguahaoChartType1')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="card_item" v-show="cardTypeList.hiddenyuyueguahaoChartType1">
							<div id="yuyueguahaokeguashuliangEchart1" class="Echart" style="width: 100%;height: 400px;"></div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
		</div>
	</div>
</template>

<script setup>
	import {
		inject,
		nextTick,
		ref,
		getCurrentInstance
	} from 'vue';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const projectName = context.$project.projectName
	const countTypeList = ref({
	})
	const getCountList=()=>{
		countTypeList.value.closetijianyuyueCountType = true
		countTypeList.value.hiddentijianyuyueCountType = true
		if(btnAuth('tijianyuyue','首页总数')){
			gettijianyuyueCount()
		}
		countTypeList.value.closeyuyueguahaoCountType = true
		countTypeList.value.hiddenyuyueguahaoCountType = true
		if(btnAuth('yuyueguahao','首页总数')){
			getyuyueguahaoCount()
		}
	}
	const tijianyuyueCount = ref(0)
	const gettijianyuyueCount = () => {
		context?.$http({
			url:'tijianyuyue/count',
			method: 'get'
		}).then(res=>{
			tijianyuyueCount.value = res.data.data
		})
	}
	const yuyueguahaoCount = ref(0)
	const getyuyueguahaoCount = () => {
		context?.$http({
			url:'yuyueguahao/count',
			method: 'get'
		}).then(res=>{
			yuyueguahaoCount.value = res.data.data
		})
	}
	const countTypeClick = (e) => {
		countTypeList.value[e] = !countTypeList.value[e]
	}
	//权限验证
	const btnAuth = (e,a)=>{
		return context?.$toolUtil.isAuth(e,a)
	}
	let echarts = inject("echarts")
	const cardTypeClick = (e) =>{
		cardTypeList.value[e] = !cardTypeList.value[e]
		setTimeout(()=>{
			getCardList()
		},1000)
	}
	const cardTypeList = ref({
		closetijianyuyueChartType1: true,
		hiddentijianyuyueChartType1: true,
		closeyuyueguahaoChartType1: true,
		hiddenyuyueguahaoChartType1: true,
	})
	const getCardList = () => {
		if(btnAuth('tijianyuyue','首页统计')){
			gettijianyuyueChart1()
		}
		if(btnAuth('yuyueguahao','首页统计')){
			getyuyueguahaoChart1()
		}
	}
	import '@/assets/js/echarts-theme'
	const gettijianyuyueChart1 = () => {
		nextTick(()=>{
			var keyuerenshuEchart1 = echarts.init(document.getElementById("tijianyuyuekeyuerenshuEchart1"),'theme');
			context?.$http({
				url: `tijianyuyue/value/tijianxiangmu/keyuerenshu?order=desc`,
				method: "get",
			}).then(obj=>{
				let res = obj.data.data
				let xAxis = [];
				let yAxis = [];
				let dataList = []
				for(let i=0;i<res.length;i++){
				    xAxis.push(res[i].tijianxiangmu);
				    yAxis.push(parseFloat((res[i].total)));
					dataList.push({
				        value: parseFloat((res[i].total)),
				        name: res[i].tijianxiangmu
				    })
				}
				var option = {};
				option = {
    title: {
        text: 'Number of physical examinations',
        left: 'center'
    },
    grid:{
    	containLabel:true
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
    series:{
        data: yAxis,
        type: 'bar'
    }
}

				keyuerenshuEchart1.clear()
				// 使用刚指定的配置项和数据显示图表。
				keyuerenshuEchart1.setOption(option);
				//根据窗口的大小变动图表
				keyuerenshuEchart1.resize();
			})
		})
	}
	const getyuyueguahaoChart1 = () => {
		nextTick(()=>{
			var keguashuliangEchart1 = echarts.init(document.getElementById("yuyueguahaokeguashuliangEchart1"),'theme');
			context?.$http({
				url: `yuyueguahao/value/yishenggonghao/keguashuliang?order=desc`,
				method: "get",
			}).then(obj=>{
				let res = obj.data.data
				let xAxis = [];
				let yAxis = [];
				let dataList = []
				for(let i=0;i<res.length;i++){
				    xAxis.push(res[i].yishenggonghao);
				    yAxis.push(parseFloat((res[i].total)));
					dataList.push({
				        value: parseFloat((res[i].total)),
				        name: res[i].yishenggonghao
				    })
				}
				var option = {};
				option = {
    title: {
        text: 'The number of registrations',
        left: 'center'
    },
    grid:{
    	containLabel:true
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
    series:{
        data: yAxis,
        type: 'bar'
    }
}

				keguashuliangEchart1.clear()
				// 使用刚指定的配置项和数据显示图表。
				keguashuliangEchart1.setOption(option);
				//根据窗口的大小变动图表
				keguashuliangEchart1.resize();
			})
		})
	}

	const init=()=>{
		getCountList()
		getCardList()
	}
	init()
</script>
<style lang="scss" scoped>
	// 首页盒子
	.home_view {
	}
	.home_view .projectTitle{
	}

	.showIcons {
		transition: transform 0.3s;
		margin-right: 10px;
	}

	.showIcons1 {
		transform: rotate(-180deg);
	}
	
	// 总数盒子
	.count_list{
		// 总数card
		.card_view {
			// card头部
			.el-card__header {
				// 头部盒子
				.index_card_head {
					// 标题
					.card_head_title {
					}
					// 按钮盒子
					.card_head_right {
						// 按钮
						.el-icon {
						}
					}
				}
			}
			// body
			.el-card__body {
				// body盒子
				.count_item{
					// 总数标题
					.count_title{
					}
					// 总数数字
					.count_num{
					}
				}
			}
		}
	}

	// 统计图盒子
	.card_list {
		// 统计图card
		.card_view {
			// 头部
			.el-card__header {
				// 头部盒子
				.index_card_head {
					// 标题
					.card_head_title {
					}
					// 按钮盒子
					.card_head_right {
						// 按钮
						.el-icon{
						}
					}
				}
			}
			// body
			.el-card__body {
				// body盒子
				.card_item{
				}
			}
		}
	}
</style>
<style>
/*总盒子*/
.home_view{
    padding: 30px 20px;
    margin: 0px;
    height: auto;
    min-height: 100vh;
    background: none;
    width: 100%;
}
.home_view .projectTitle{
    width: 100%;
    font-size: 28px;
    font-weight: bold;
    padding: 40px 0px 20px;
    height: auto;
    display: none;
    align-items: center;
    justify-content: center;
    margin: 0px 0px 20px;
    color: rgb(255, 255, 255);
}

/*总数*/
/*总盒子*/
.home_view .count_list {
    display:flex;
    flex-wrap:wrap;
    justify-content:center;
    padding:0px 0px 20px;
    width:100%;
    align-items:flex-start;
}
/*卡片盒子*/
.home_view .count_list .card_view {
    width:23%;
    height:auto;
    margin:0px 1% 20px;
    box-sizing:border-box;
    border:0px;
    border-radius:0px;
    box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
    flex: 1;
}

.home_view .count_list .card_view:nth-child(4n+1) {
    background: url(http://clfile.zggen.cn/20241017/7056b75c30dc4a5e87b1fc084f8e475d.png) var(--theme) no-repeat 16px center;
    padding-left:80px;
}
.home_view .count_list .card_view:nth-child(4n+2) {
    background:url(http://clfile.zggen.cn/20241018/861f7273196149c4be7d08f355ca56ea.png) rgba(217, 84, 79, 1) no-repeat 16px center;
    padding-left:80px;
}
.home_view .count_list .card_view:nth-child(4n+3) {
    background:url(http://clfile.zggen.cn/20241018/56d899353e294579b1135491fd88fd94.png) rgba(65, 139, 202, 1) no-repeat 16px center;
    padding-left:80px;
}
.home_view .count_list .card_view:nth-child(4n+4) {
    background:url(http://clfile.zggen.cn/20241018/551ce47a68834784b1c5a4daff74c66b.png) rgba(29, 41, 57, 1) no-repeat 16px center;
    padding-left:80px;
}

/*head 总盒子*/
.home_view .count_list .card_view .el-card__header{
     width: 100%;
    border: 0px solid rgb(238, 238, 238);
    display: none;
}
/*item*/
.home_view .count_list .card_view .el-card__header .index_card_head{
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    height: 10px;
}
/*标题*/
.home_view .count_list .card_view .el-card__header .index_card_head .card_head_title{
    font-size: 14px;
    color: rgb(51, 51, 51);
}
/*按钮盒子*/
.home_view .count_list .card_view .el-card__header .index_card_head .card_head_right{
    display: flex;
    align-items: center;
}
/*按钮*/
.home_view .count_list .card_view .el-card__header .index_card_head .card_head_right .showIcons{
    color: rgb(102, 102, 102);
    font-size: 20px;
    cursor: pointer;
}
/*body 总盒子*/
.home_view .count_list .card_view .el-card__body{
    padding: 0px;
    background: none;
}
/*item*/
.home_view .count_list .card_view .el-card__body .count_item{
    padding: 10px;
    text-align: left;
    display: flex;
    align-items: flex-start;
    justify-content: flex-start;
    flex-direction: column;
}
/*标题*/
.home_view .count_list .card_view .el-card__body .count_item .count_title{
    font-size: 18px;
    color: rgb(255, 255, 255);
    line-height: 2;
    display: inline-block;
    margin: 0px 10px 0px 0px;
    font-weight: 600;
}
/*数字*/
.home_view .count_list .card_view .el-card__body .count_item .count_num{
    font-size: 26px;
    color: rgb(255, 255, 255);
    line-height: 2;
    display: inline-block;
    font-weight: 600;
}

/*图表*/
/*总盒子*/
.home_view .card_list{
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    padding: 0px 0px 20px;
    align-items: flex-start;
}
/*卡片 总盒子*/
.home_view .card_list .card_view{
    width: 48%;
    height: auto;
    margin: 0px 1% 30px;
    box-sizing: border-box;
    border: 0px;
    border-radius: 0px;
    padding: 0;
}
/*head 总盒子*/
.home_view .card_list .card_view .el-card__header{
    width: 100%;
    border: 0px solid rgb(238, 238, 238);
    background: rgb(255, 255, 255);
    /* display: none; */
    border-bottom: 2px solid RGBA(228, 232, 235, 1);
}
/*item*/
.home_view .card_list .card_view .el-card__header .index_card_head{
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    height: 10px;
}
/*标题*/
.home_view .card_list .card_view .el-card__header .index_card_head .card_head_title{
}
/*按钮盒子*/
.home_view .card_list .card_view .el-card__header .index_card_head .card_head_right{
    /* display: none; */
}
/*按钮*/
.home_view .card_list .card_view .el-card__header .index_card_head .card_head_right .showIcons{
    color: var(--theme);
    font-size: 20px;
    cursor: pointer;
    background: rgba(199, 255, 247, 1);
}

/*body 总盒子*/
.home_view .card_list .card_view .el-card__body{
    padding: 0px;
    background: rgb(255, 255, 255);
}
.home_view .card_list .card_view .el-card__body .card_item{
    padding: 10px;
    text-align: center;
}


.home_view .card_list .card_view .el-card__header .index_card_head .card_head_right .closeIcons {
    color: var(--theme);
    font-size: 20px;
    background: rgba(199, 255, 247, 1);
}
.home-calendar{
  border: 0px solid rgb(238, 238, 238);
  box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 0px;
  margin: 0px auto 30px;
  border-radius: 0px;
  color: rgb(102, 102, 102);
  width: calc(100% - 310px);
  font-size: inherit;
  height: auto;
  background: #fff;
}
.home-calendar .header{
  padding: 17px 40px;
  border-color: rgba(126, 96, 16, 0.1);
  flex-wrap: wrap;
  background: var(--theme);
  border-width: 0px 0px 1px;
  display: flex;
  width: 100%;
  border-style: solid;
  justify-content: space-between;
  height: auto;
}
.home-calendar .header .btn{
  cursor: pointer;
  border: 0px solid rgb(153, 153, 153);
  padding: 0px 0px 0px 12px;
  align-items: center;
  color: rgb(102, 102, 102);
  border-radius: 4px;
  display: flex;
  width: auto;
  font-size: inherit;
  justify-content: center;
}
.home-calendar .header .title{
  padding: 0px 10px;
  font-size: 24px;
  align-items: center;
  justify-content: center;
  display: flex;
  color: rgb(51, 51, 51);
}
.home-calendar table{
  width: 100%;
  padding: 0px 0px 20px;
  height: auto;
}
.home-calendar tbody,thead{
  width: 100%;
}
.home-calendar tr{
  width: 100%;
  align-items: center;
  justify-content: center;
  display: flex;
}
.home-calendar th{
  align-items: center;
  flex: 1;
  display: flex;
  line-height: 50px;
  justify-content: center;
}
.home-calendar td{
  cursor: pointer;
  padding: 6px 12px 12px;
  flex: 1;
  display: flex;
  justify-content: center;
  text-align: center;
}
</style>
