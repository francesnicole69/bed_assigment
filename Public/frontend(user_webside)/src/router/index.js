import { createRouter, createWebHashHistory } from 'vue-router'
import index from '../views'
import home from '../views/pages/home.vue'
import login from '../views/pages/login.vue'
import newsList from '@/views/pages/news/list'
import yonghuList from '@/views/pages/yonghu/list'
import yonghuDetail from '@/views/pages/yonghu/formModel'
import yonghuAdd from '@/views/pages/yonghu/formAdd'
import yonghuRegister from '@/views/pages/yonghu/register'
import yonghuCenter from '@/views/pages/yonghu/center'
import yiliaojigouList from '@/views/pages/yiliaojigou/list'
import yiliaojigouDetail from '@/views/pages/yiliaojigou/formModel'
import yiliaojigouAdd from '@/views/pages/yiliaojigou/formAdd'
import tijianleixingList from '@/views/pages/tijianleixing/list'
import tijianleixingDetail from '@/views/pages/tijianleixing/formModel'
import tijianleixingAdd from '@/views/pages/tijianleixing/formAdd'
import tijianxiangmuList from '@/views/pages/tijianxiangmu/list'
import tijianxiangmuDetail from '@/views/pages/tijianxiangmu/formModel'
import tijianxiangmuAdd from '@/views/pages/tijianxiangmu/formAdd'
import tijianyuyueList from '@/views/pages/tijianyuyue/list'
import tijianyuyueDetail from '@/views/pages/tijianyuyue/formModel'
import tijianyuyueAdd from '@/views/pages/tijianyuyue/formAdd'
import tijianxinxiList from '@/views/pages/tijianxinxi/list'
import tijianxinxiDetail from '@/views/pages/tijianxinxi/formModel'
import tijianxinxiAdd from '@/views/pages/tijianxinxi/formAdd'
import tijianbaogaoList from '@/views/pages/tijianbaogao/list'
import tijianbaogaoDetail from '@/views/pages/tijianbaogao/formModel'
import tijianbaogaoAdd from '@/views/pages/tijianbaogao/formAdd'
import quxiaoyuyueList from '@/views/pages/quxiaoyuyue/list'
import quxiaoyuyueDetail from '@/views/pages/quxiaoyuyue/formModel'
import quxiaoyuyueAdd from '@/views/pages/quxiaoyuyue/formAdd'
import keshiList from '@/views/pages/keshi/list'
import keshiDetail from '@/views/pages/keshi/formModel'
import keshiAdd from '@/views/pages/keshi/formAdd'
import storeupList from '@/views/pages/storeup/list'
import yuyueguahaoList from '@/views/pages/yuyueguahao/list'
import yuyueguahaoDetail from '@/views/pages/yuyueguahao/formModel'
import yuyueguahaoAdd from '@/views/pages/yuyueguahao/formAdd'
import popupRemindList from '@/views/pages/popupRemind/list'
import popupRemindDetail from '@/views/pages/popupRemind/formModel'
import popupRemindAdd from '@/views/pages/popupRemind/formAdd'
import jiankangshujuList from '@/views/pages/jiankangshuju/list'
import jiankangshujuDetail from '@/views/pages/jiankangshuju/formModel'
import jiankangshujuAdd from '@/views/pages/jiankangshuju/formAdd'
import yishengzuozhenList from '@/views/pages/yishengzuozhen/list'
import yishengzuozhenDetail from '@/views/pages/yishengzuozhen/formModel'
import yishengzuozhenAdd from '@/views/pages/yishengzuozhen/formAdd'
import chathelperList from '@/views/pages/chathelper/list'
import chathelperDetail from '@/views/pages/chathelper/formModel'
import chathelperAdd from '@/views/pages/chathelper/formAdd'
import systemNoticeList from '@/views/pages/systemNotice/list'
import systemNoticeDetail from '@/views/pages/systemNotice/formModel'
import systemNoticeAdd from '@/views/pages/systemNotice/formAdd'

const routes = [{
		path: '/',
		redirect: '/index/home'
	},
	{
		path: '/index',
		component: index,
		children: [{
			path: 'home',
			component: home
		}
		, {
			path: 'newsList',
			component: newsList
		}
		, {
			path: 'yonghuList',
			component: yonghuList
		}, {
			path: 'yonghuDetail',
			component: yonghuDetail
		}, {
			path: 'yonghuAdd',
			component: yonghuAdd
		}
		, {
			path: 'yonghuCenter',
			component: yonghuCenter
		}
		, {
			path: 'yiliaojigouList',
			component: yiliaojigouList
		}, {
			path: 'yiliaojigouDetail',
			component: yiliaojigouDetail
		}, {
			path: 'yiliaojigouAdd',
			component: yiliaojigouAdd
		}
		, {
			path: 'tijianleixingList',
			component: tijianleixingList
		}, {
			path: 'tijianleixingDetail',
			component: tijianleixingDetail
		}, {
			path: 'tijianleixingAdd',
			component: tijianleixingAdd
		}
		, {
			path: 'tijianxiangmuList',
			component: tijianxiangmuList
		}, {
			path: 'tijianxiangmuDetail',
			component: tijianxiangmuDetail
		}, {
			path: 'tijianxiangmuAdd',
			component: tijianxiangmuAdd
		}
		, {
			path: 'tijianyuyueList',
			component: tijianyuyueList
		}, {
			path: 'tijianyuyueDetail',
			component: tijianyuyueDetail
		}, {
			path: 'tijianyuyueAdd',
			component: tijianyuyueAdd
		}
		, {
			path: 'tijianxinxiList',
			component: tijianxinxiList
		}, {
			path: 'tijianxinxiDetail',
			component: tijianxinxiDetail
		}, {
			path: 'tijianxinxiAdd',
			component: tijianxinxiAdd
		}
		, {
			path: 'tijianbaogaoList',
			component: tijianbaogaoList
		}, {
			path: 'tijianbaogaoDetail',
			component: tijianbaogaoDetail
		}, {
			path: 'tijianbaogaoAdd',
			component: tijianbaogaoAdd
		}
		, {
			path: 'quxiaoyuyueList',
			component: quxiaoyuyueList
		}, {
			path: 'quxiaoyuyueDetail',
			component: quxiaoyuyueDetail
		}, {
			path: 'quxiaoyuyueAdd',
			component: quxiaoyuyueAdd
		}
		, {
			path: 'keshiList',
			component: keshiList
		}, {
			path: 'keshiDetail',
			component: keshiDetail
		}, {
			path: 'keshiAdd',
			component: keshiAdd
		}
        , {
            path: 'storeupList',
            component: storeupList
        }
		, {
			path: 'yuyueguahaoList',
			component: yuyueguahaoList
		}, {
			path: 'yuyueguahaoDetail',
			component: yuyueguahaoDetail
		}, {
			path: 'yuyueguahaoAdd',
			component: yuyueguahaoAdd
		}
		, {
			path: 'popupRemindList',
			component: popupRemindList
		}, {
			path: 'popupRemindDetail',
			component: popupRemindDetail
		}, {
			path: 'popupRemindAdd',
			component: popupRemindAdd
		}
		, {
			path: 'jiankangshujuList',
			component: jiankangshujuList
		}, {
			path: 'jiankangshujuDetail',
			component: jiankangshujuDetail
		}, {
			path: 'jiankangshujuAdd',
			component: jiankangshujuAdd
		}
		, {
			path: 'yishengzuozhenList',
			component: yishengzuozhenList
		}, {
			path: 'yishengzuozhenDetail',
			component: yishengzuozhenDetail
		}, {
			path: 'yishengzuozhenAdd',
			component: yishengzuozhenAdd
		}
		, {
			path: 'chathelperList',
			component: chathelperList
		}, {
			path: 'chathelperDetail',
			component: chathelperDetail
		}, {
			path: 'chathelperAdd',
			component: chathelperAdd
		}
		, {
			path: 'systemNoticeList',
			component: systemNoticeList
		}, {
			path: 'systemNoticeDetail',
			component: systemNoticeDetail
		}, {
			path: 'systemNoticeAdd',
			component: systemNoticeAdd
		}
		]
	},
	{
		path: '/login',
		component: login
	}
	,{
		path: '/yonghuRegister',
		component: yonghuRegister
	}
]

const router = createRouter({
  history: createWebHashHistory(process.env.BASE_URL),
  routes
})

export default router
