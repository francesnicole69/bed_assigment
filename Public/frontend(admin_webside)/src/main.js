import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
// import '@/icons' // icon
import 'element-plus/dist/index.css'
import '@/assets/css/style.scss'
import store from './store'
const app = createApp(App)
app.config.warnHandler = () => null;
//地图
import VueAMap, { initAMapApiLoader } from "@vuemap/vue-amap";
import "@vuemap/vue-amap/dist/style.css"
initAMapApiLoader({
    key: "c4ae6ed30bc3f01acf60971dd5d65e7b",
    securityJsCode:'4d49f68235e05c86c862eeb230ddfc05',
    plugins: [
        "AMap.Autocomplete",
        "AMap.PlaceSearch",
        "AMap.Scale",
        "AMap.OverView",
        "AMap.ToolBar",
        "AMap.MapType",
        "AMap.PolyEditor",
        "AMap.CircleEditor",
        "AMap.Geocoder",
        "AMap.Geolocation",
        "AMap.Marker",
        "AMap.Driving"
    ],
});
app.use(VueAMap)

import http from './utils/http.js'
// 基础配置
import config from './utils/config'
//公共方法
import toolUtil from './utils/toolUtil.js'
// import SvgIcon from '@/components/SvgIcon'// svg component
// app.component('svg-icon', SvgIcon)

//element-plus
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}
import zhCn from 'element-plus/dist/locale/zh-cn.mjs'
import ElementPlus from 'element-plus'
app.use(ElementPlus)

//echarts
import * as echarts from 'echarts'

//打印
import printJS from 'print-js'

//富文本
import Editor from "@/components/common/Editor";
app.component('editor', Editor)
//上传组件
import upload from "@/components/common/upload";
app.component('uploads', upload)

//md5
import md5 from 'js-md5'

import JsonExcel from "vue-json-excel3";
app.component("downloadExcel", JsonExcel);
app.config.globalProperties.$config = config.get()
app.config.globalProperties.$project = config.getProjectName()
app.config.globalProperties.$echarts = echarts
app.config.globalProperties.$toolUtil = toolUtil
app.config.globalProperties.$md5 = md5
app.config.globalProperties.$http = http // ajax请求方法



app.use(store)
app.use(router)
app.mount('#app')
