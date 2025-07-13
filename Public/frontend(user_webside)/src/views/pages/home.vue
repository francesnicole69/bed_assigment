<template>
	<div>
		<div class="home_box">
			<!-- 体检项目推荐 -->
			<div class="recomList_view">
				<div class="recomList_title">
					<span>Recommended physical examination items</span>
				</div>
				<div class="categoryList">
					<div class="item" @click="tijianxiangmuRecomCategoryChange(-1)" style="cursor: pointer"
						:class="{ active: tijianxiangmuRecom_index == -1 }">All</div>
					<div class="item" v-for="(item, index) in tijianxiangmuRecomCategorys"
						@click="tijianxiangmuRecomCategoryChange(index)"
						:class="{ active: tijianxiangmuRecom_index == index }" style="cursor: pointer">
						{{ item }}
					</div>
				</div>
				<div class="recommendList">
					<div class="item" v-for="(item, index) in tijianxiangmuRecomList" :key="index"
						@click="detailClick('tijianxiangmu', item.id)">
						<div class="img-box">
							<img v-if="isHttp(item.tijiantupian)" :src="item.tijiantupian.split(',')[0]" alt="">
							<img v-else :src="item.tijiantupian ? $config.url + item.tijiantupian.split(',')[0] : ''"
								alt="">
						</div>
						<div class="content-box">
							<div class="title">
								{{ item.tijianxiangmu }}
							</div>
							<div class="statistic">
								<div class="collect">
									<span class="iconfont icon-likeline4"></span>
									<div class="num">{{ item.storeupNumber }}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="recommend_more_view" @click="moreClick('tijianxiangmu')">
					<span class="recommend_more_text">more</span>
				</div>
			</div>
			<!-- 医生坐诊首页展示 -->
			<div class="homeList_view">
				<div class="homeList_title">
					<span>Doctor's consultation demonstration</span>
				</div>
				<div class="home_list_two">
					<mySwiper :data="yishengzuozhenHomeList" :type="3" :loop="false" :navigation="true"
						:pagination="false" :paginationType="1" :scrollbar="false" :slidesPerView="5" :spaceBetween="20"
						:autoHeight="false" :centeredSlides="false" :freeMode="false" :effectType="0"
						:direction="horizontal" :autoplay="true" :slidesPerColumn="1">
						<template #default="scope">
							<div class="home_item animation_box" @click="detailClick('yishengzuozhen', scope.row.id)">
								<div class="home_img_box">
									<img class="home_img" v-if="isHttp(scope.row.touxiang)"
										:src="scope.row.touxiang.split(',')[0]" alt="">
									<img class="home_img" v-else
										:src="scope.row.touxiang ? $config.url + scope.row.touxiang.split(',')[0] : ''"
										alt="">
								</div>
								<div class="home_content">
									<div class='home_title'>
										Doctor's name: {{ scope.row.yishengxingming }}
									</div>
									<div class='home_title'>
										{{ scope.row.keshi }}
									</div>
									<div class='home_title'>
										Registration fee: {{ scope.row.guahaofei }}
									</div>
									<div class='home_title'>
										Available slots: {{ scope.row.keguashuliang }}
									</div>
								</div>
							</div>
						</template>
					</mySwiper>
				</div>
				<div class="homeList_more_view" @click="moreClick('yishengzuozhen')">
					<span class="homeList_more_text">more</span>
				</div>
			</div>
			<!-- 健康科普 -->
			<div class="newsList_view">
				<div class="ntitle">
					<div class="n1">Health Education and Popular Science</div>
					<div class="n2">News</div>
				</div>

				<div class="nlist">
					<ul>
						<li v-for="(item, index) in newsList" :key="index" @click="newsDetailClick(item)">
							<div class="nam">{{ item.title }}</div>
						</li>
					</ul>
				</div>

				<div class="nmore" @click="moreClick('news')" style="cursor: pointer">more</div>
			</div>

			<div class="appendBox1"></div>
		</div>
		<formModel ref="newsFormModelRef"></formModel>
	</div>
</template>

<script setup>
import {
	ref,
	getCurrentInstance
} from 'vue';
import moment from 'moment'
import {
	useRouter
} from 'vue-router';
const context = getCurrentInstance()?.appContext.config.globalProperties;
const router = useRouter()
//体检项目推荐
const tijianxiangmuRecomCategorys = ref([])
const tijianxiangmuRecom_index = ref(-1)
const gettijianxiangmuRecomCategorys = () => {
	context?.$http({
		url: 'option/tijianleixing/tijianleixing',
		method: 'get'
	}).then(res => {
		tijianxiangmuRecomCategorys.value = res.data.data
	})
}
gettijianxiangmuRecomCategorys()
const tijianxiangmuRecomCategoryChange = (index) => {
	tijianxiangmuRecom_index.value = index
	gettijianxiangmuRecomList()
}
const tijianxiangmuRecomList = ref([])
const gettijianxiangmuRecomList = () => {
	let autoSortUrl = 'tijianxiangmu/autoSort'
	if (context?.$toolUtil.storageGet('frontToken')) {
		autoSortUrl = "tijianxiangmu/autoSort2"
	}
	let params = {
		sfsh: '是',
		page: 1,
		limit: 4
	}
	if (tijianxiangmuRecom_index.value >= 0) {
		params.tijianleixing = tijianxiangmuRecomCategorys.value[tijianxiangmuRecom_index.value]
	}
	context?.$http({
		url: autoSortUrl,
		method: 'get',
		params: params
	}).then(res => {
		tijianxiangmuRecomList.value = res.data.data.list
		tijianxiangmuRecomList.value.forEach(item => {
			if (!isHttp(item.tijiantupian)) {
				item.imgUrls = item.tijiantupian.split(',').map(item => context.$config.url + item)
			}
		})
	})
}
//医生坐诊首页展示
const yishengzuozhenHomeList = ref([])
const getyishengzuozhenHomeList = () => {
	let params = {
		page: 1,
		limit: 8,
		sort: 'id',
		order: 'desc',
	}
	context?.$http({
		url: 'yishengzuozhen/list',
		method: 'get',
		params: params
	}).then(res => {
		yishengzuozhenHomeList.value = res.data.data.list
		yishengzuozhenHomeList.value.forEach(item => {
			if (!isHttp(item.touxiang)) {
				item.imgUrls = item.touxiang.split(',').map(item => context.$config.url + item)
			}
		})
	})
}
//健康科普弹窗
import formModel from './news/formModel'
const newsFormModelRef = ref(null)
//健康科普
const newsList = ref([])
const getNewsList = () => {
	context?.$http({
		url: 'news/list',
		method: 'get',
		params: {
			page: 1,
			limit: 6,
			sort: 'id',
			order: 'desc',
		}
	}).then(res => {
		newsList.value = res.data.data.list
		newsList.value.forEach(item => {
			if (!isHttp(item.picture)) {
				item.imgUrl = context.$config.url + item.picture.split(',')[0]
			}
		})
	})
}
const newsDetailClick = (item) => {
	if (item && item.id) {
		newsFormModelRef.value.init(item.id)
	}
}
//判断图片链接是否带http
const isHttp = (str) => {
	return str && str.substr(0, 4) == 'http';
}
//跳转详情
const detailClick = (table, id) => {
	router.push(`/index/${table}Detail?id=${id}`)
}
const moreClick = (table) => {
	router.push(`/index/${table}List`)
}
const init = () => {
	//体检项目推荐
	gettijianxiangmuRecomList()
	//医生坐诊首页展示
	getyishengzuozhenHomeList()
	//健康科普
	getNewsList()
}
init()
</script>

<style lang="scss">
.home_box {}

// 推荐
.recomList_view {
	.recomList_title {}

	// list
	// list
	// animation
	.animation_box {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		z-index: initial;
	}

	.animation_box:hover {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		-webkit-perspective: 1000px;
		perspective: 1000px;
		transition: 0.3s;
	}

	.animation_box img {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		z-index: initial;
	}

	.animation_box img:hover {
		transform: rotate(0deg) scale(1.05) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		-webkit-perspective: 1000px;
		perspective: 1000px;
		transition: 0.3s;
	}

	// animation
	// 更多
	.recommend_more_view {
		cursor: pointer;
		top: 20px;
		position: absolute;
		right: 20px;

		.recommend_more_text {}
	}
}

// 推荐
// 新闻资讯
.newsList_view {

	.newsList_title {}

	// list
	.news_list_one {
		display: flex;
		flex-wrap: wrap;

		.news_item {
			box-shadow: 0 4px 6px rgba(0, 0, 0, .3);
			margin: 0 10px 10px;
			background: #fff;
			display: flex;
			width: calc(33% - 20px);
			align-items: center;

			.news_img_box {
				width: 40%;
				font-size: 0;

				.news_img {
					object-fit: cover;
					width: 100%;
					height: 200px;
				}
			}

			.news_content {
				margin: 0 0 0 20px;
				width: calc(60% - 20px);

				.news_title {
					font-weight: bold;
					font-size: 20px;
				}

				.news_text {
					font-size: 14px;
					line-height: 1.5;
				}

				.news_time {
					color: #999;
					width: 100%;
					text-align: right;
				}
			}
		}
	}

	// list
	// animation
	.animation_box {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		z-index: initial;
	}

	.animation_box:hover {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		-webkit-perspective: 1000px;
		perspective: 1000px;
		transition: 0.3s;
	}

	.animation_box img {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		z-index: initial;
	}

	.animation_box img:hover {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		-webkit-perspective: 1000px;
		perspective: 1000px;
		transition: 0.3s;
	}

	// animation
	// 更多
	.news_more_view {
		.news_more_text {}

		.el-icon {}
	}
}

// 新闻资讯
// 首页展示
.homeList_view {

	.homeList_title {}

	// list
	.home_list_two {
		display: flex;
		width: 100%;
		flex-wrap: wrap;

		.home_item {
			margin: 0 10px;
			background: none;
			width: 100%;

			.home_img_box {
				width: 100%;
				height: 200px;

				.home_img {
					object-fit: cover;
					width: 100%;
					height: 100%;
				}
			}

			.home_content {
				background: none;

				.home_title {
					overflow: hidden;
					color: #000;
					white-space: nowrap;
					background: none;
					font-weight: 500;
					width: 100%;
					font-size: 15px;
					line-height: 24px;
					text-overflow: ellipsis;
					text-align: center;
				}
			}
		}
	}

	// list
	// animation
	.animation_box {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		z-index: initial;
	}

	.animation_box:hover {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		-webkit-perspective: 1000px;
		perspective: 1000px;
		transition: 0.3s;
	}

	.animation_box img {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		z-index: initial;
	}

	.animation_box img:hover {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		-webkit-perspective: 1000px;
		perspective: 1000px;
		transition: 0.3s;
	}

	// animation
	// 更多
	.homeList_more_view {
		cursor: pointer;
		top: 20px;
		position: absolute;
		right: 20px;

		.homeList_more_text {}
	}
}

// 首页展示</style>
<style lang="scss">
.home_box {
	width: 1220px;
	margin: 0px auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.home_box .appendBox1 {
	width: 100%;
	height: 0px;
	background: #f00;
	order: 5;
}

/* 总盒子 */
.recomList_view {
	width: 750px;
	margin: 20px 10px 0;
	padding: 20px 20px;
	background: #fff;
	overflow: hidden;
	border-radius: 6px;
	-moz-box-shadow: 0 0 8px #8B8B8B;
	-webkit-box-shadow: 0 0 8px #8B8B8B;
	box-shadow: 0 0 8px #8B8B8B;
	border: 1px solid #888;
	margin-left: calc((100% - 1200px)/2);
	position: relative;
	order: 8;
	flex: 2;
	display: block;
}

/* 标题 */
.recomList_view .recomList_title {
	width: 100%;
	text-align: left;
	font-size: 20px;
	color: rgb(51, 51, 51);
	margin: 0px 0px 20px;
	background: url() center top no-repeat;
	padding: 0px 0px 0px;
	font-weight: 600;
}

/* 分类 */
.recomList_view .categoryList {
	display: none;
	flex-wrap: wrap;
}

.recomList_view .categoryList .item {}

/* 样式七 总盒子 */
.recomList_view .recommendList {
	display: flex;
	flex-wrap: wrap;
	margin: 0px auto;
}

.recomList_view .recommendList .item {
	width: calc(25% - 20px);
	margin: 0px 10px 20px;
	background: rgb(255, 255, 255);
	cursor: pointer;
}

.recomList_view .recommendList .item .img-box {
	width: 100%;
	height: 200px;
	overflow: hidden;
	margin: 0px 0px 5px;
}

.recomList_view .recommendList .item .img-box img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.recomList_view .recommendList .item .content-box {
	width: 100%;
}

.recomList_view .recommendList .item .content-box .title {
	width: 100%;
	line-height: 24px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.recomList_view .recommendList .item .content-box .price {
	width: 100%;
	text-align: right;
	color: #f00;
	font-size: 16px;
}

.recomList_view .recommendList .item .content-box .statistic {
	width: 100%;
	display: flex;
	align-items: center;
	margin: 10px 0 0;
}

.recomList_view .recommendList .item .content-box .statistic .iconfont {
	color: inherit;
	margin: 0px 4px 0px 0px;
}

.recomList_view .recommendList .item .content-box .statistic .num {
	color: inherit;
}

.recomList_view .recommendList .item .content-box .statistic .like {
	display: flex;
	align-items: center;
	color: rgb(153, 153, 153);
	font-size: 16px;
	margin: 0px 10px 0px 0px;
}

.recomList_view .recommendList .item .content-box .statistic .collect {
	display: flex;
	align-items: center;
	color: rgb(153, 153, 153);
	font-size: 16px;
	margin: 0px 10px 0px 0px;
}

.recomList_view .recommendList .item .content-box .statistic .clickNum {
	display: flex;
	align-items: center;
	color: rgb(153, 153, 153);
	font-size: 16px;
	margin: 0px 10px 0px 0px;
}

/* 总盒子*/
.homeList_view {
	width: 100%;
	margin: 20px 10px 0;
	padding: 20px 20px 40px;
	background: url(http://clfile.zggen.cn/20240925/86a5dbdea6c34aef81f9fcc371fdd3f0.jpg) no-repeat right bottom, #fff;
	overflow: hidden;
	border-radius: 6px;
	-moz-box-shadow: 0 0 8px #8B8B8B;
	-webkit-box-shadow: 0 0 8px #8B8B8B;
	box-shadow: 0 0 8px #8B8B8B;
	border: 1px solid #888;
	position: relative;
	order: 4;
	display: block;
}

/* 标题 */
.homeList_view .homeList_title {
	width: 100%;
	font-size: 20px;
	color: #333;
	font-weight: 600;
	margin: 0px 0px 20px;
}

/* 样式五 盒子 */
.homeList_view .home_list_five {
	width: 1200px;
	display: flex;
	flex-wrap: wrap;
	align-items: flex-start;
	margin: 40px auto 20px;
}

/* item */
.homeList_view .home_list_five div {
	width: calc(25% - 10px);
	margin: 0px 5px 10px;
	overflow: hidden;
}

/* img盒子 */
.homeList_view .home_list_five div .img_box {
	width: 100%;
	height: 280px;
}

.homeList_view .home_list_five div .img_box .home_img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

/* 内容盒子 */
.homeList_view .home_list_five div .homeList_content {
	background: rgb(238, 238, 238);
	padding: 10px;
	display: flex;
	flex-wrap: wrap;
	position: absolute;
	top: 0px;
	left: -100%;
	transition: all 0.3s ease 0s;
}

.homeList_view .home_list_five div .homeList_content div {
	width: 100%;
	text-align: center;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

/* 悬浮 */
.homeList_view .home_list_five div:hover {
	transition: all 0.3s;
	position: relative;
}

.homeList_view .home_list_five div:hover .homeList_content {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.3);
	padding: 0px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	cursor: pointer;
}

.homeList_view .home_list_five div:hover .homeList_content div {
	line-height: 24px;
	color: #fff;
}

.swiper-button-prev {
	left: 0px;
}

/* 总盒子 */
.newsList_view {
	width: 550px;
	margin: 0 10px;
	padding: 20px 20px;
	background: #fff url(http://clfile.zggen.cn/20240925/66b965a6bd344f1fba3a252cfc6ca35e.jpg) repeat-x;
	overflow: hidden;
	border-radius: 6px;
	-moz-box-shadow: 0 0 8px #8B8B8B;
	-webkit-box-shadow: 0 0 8px #8B8B8B;
	box-shadow: 0 0 8px #8B8B8B;
	border: 1px solid #888;
	position: relative;
	order: 1;
	flex: 1;
	display: block;
}

/* 自定义 start*/
.newsList_view .ntitle {
	width: 100%;
}

.newsList_view .ntitle .n1 {
	display: inline-block;
	font-size: 18px;
	color: #333;
	font-weight: 600;
}

.newsList_view .ntitle .n2 {
	display: inline-block;
	font-size: 14px;
	color: #888;
	margin-left: 5px;
}

.newsList_view .nlist {
	width: 100%;
	margin-top: 10px;
}

.newsList_view .nlist ul {
	margin: 0;
	padding: 0;
}

.newsList_view .nlist ul li {
	text-align: left;
	background: url(http://clfile.zggen.cn/20240925/c8998314b4a24a45a5664f924382a8ba.png) left center no-repeat;
	line-height: 32px;
	border-bottom: 1px dashed #aaa;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	padding-left: 15px;
	cursor: pointer;
}

.newsList_view .nlist ul li:last-child {
	border-bottom: none;
}

.newsList_view .nlist ul li .nam {
	text-align: left;
}

.newsList_view .nlist ul li:hover .nam {
	color: #c00;
}

.newsList_view .nmore {
	position: absolute;
	top: 20px;
	;
	right: 20px;
	;
}

/* 自定义 end*/

/* 标题 */
.newsList_view .newsList_title {
	width: 100%;
	text-align: center;
	font-size: 32px;
	color: rgb(51, 51, 51);
	margin: 0px 0px 50px;
	background: url() no-repeat center top;
	padding: 0px 0px 0px;
}

/* 样式三盒子 */
.newsList_view .news_list_three {
	display: flex;
	align-items: center;
	width: 1200px;
	margin: 0px auto;
	justify-content: space-between;
}

/* 左边盒子 */
.newsList_view .news_list_three .news_left {
	width: 48%;
	background: rgb(255, 255, 255);
	cursor: pointer;
}

/* 图片盒子 */
.newsList_view .news_list_three .news_left .news_img_box {
	width: 100%;
}

/* 图片 */
.newsList_view .news_list_three .news_left .news_img_box .news_img {
	width: 100%;
	height: 380px;
	object-fit: cover;
}

.newsList_view .news_list_three .news_left .news_content {
	display: none;
}

.newsList_view .news_list_three .news_left .news_content .news_title {
	font-size: 18px;
	text-align: center;
	font-weight: bold;
	color: rgb(0, 0, 0);
	width: 100%;
	line-height: 40px;
}

.newsList_view .news_list_three .news_left .news_content .news_text {
	font-size: 14px;
	line-height: 1.5;
}

.newsList_view .news_list_three .news_left .news_content .news_time {
	color: rgb(153, 153, 153);
	width: 100%;
	text-align: right;
}

/* 右边盒子 */
.newsList_view .news_list_three .news_right {
	width: 48%;
	height: 380px;
}

/* item */
.newsList_view .news_list_three .news_right .news_right_item {
	width: 100%;
	cursor: pointer;
}

.newsList_view .news_list_three .news_right .news_right_item .news_img_box {
	width: 30%;
	display: none;
}

.newsList_view .news_list_three .news_right .news_right_item .news_img_box .news_img {
	width: 100%;
	object-fit: cover;
	height: 150px;
}

.newsList_view .news_list_three .news_right .news_right_item .news_content {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	line-height: 40px;
}

.newsList_view .news_list_three .news_right .news_right_item .news_content .news_title {
	width: calc(100% - 110px);
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-align: left;
	font-size: 15px;
}

.newsList_view .news_list_three .news_right .news_right_item .news_content .news_text {
	font-size: 14px;
	line-height: 1.5;
	display: none;
}

.newsList_view .news_list_three .news_right .news_right_item .news_content .news_time {
	width: 110px;
	text-align: right;
	display: inline-block;
	font-size: 14px;
	color: rgb(153, 153, 153);
}

.newsList_view .news_list_three .news_right .news_right_item:hover .news_content .news_title {
	color: #feb043;
}

/* 选取第一个元素 */
.newsList_view .news_list_three .news_right .news_right_item:first-child {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	border-bottom: 1px solid #e8e8e8;
	padding-bottom: 20px;
	margin-bottom: 20px;
}

.newsList_view .news_list_three .news_right .news_right_item:first-child .news_img_box {
	width: 25%;
	display: block;
}

.newsList_view .news_list_three .news_right .news_right_item:first-child .news_img_box .news_img {
	width: 100%;
	object-fit: cover;
	height: 85px;
}

.newsList_view .news_list_three .news_right .news_right_item:first-child .news_content {
	width: 73%;
	display: flex;
	flex-wrap: wrap;
}

.newsList_view .news_list_three .news_right .news_right_item:first-child .news_content .news_title {
	width: 100%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-align: left;
	font-size: 18px;
}

.newsList_view .news_list_three .news_right .news_right_item:first-child .news_content .news_text {
	font-size: 15px;
	line-height: 24px;
	display: block;
	text-align: left;
	width: 100%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.newsList_view .news_list_three .news_right .news_right_item:first-child .news_content .news_time {
	width: 100%;
	text-align: right;
}

/* 查看更多 */
.newsList_view .news_more_view {
	width: auto;
	text-align: center;
	background: rgb(246, 246, 246);
	margin: 40px auto 20px;
	cursor: pointer;
	display: inline-block;
	font-size: 16px;
	color: rgb(51, 51, 51);
	padding: 5px 20px;
}

.newsList_view .news_more_view .news_more_text {}

.newsList_view .news_more_view .el-icon-d-arrow-right {}
</style>