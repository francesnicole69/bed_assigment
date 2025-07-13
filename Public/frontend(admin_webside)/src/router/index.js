	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import news from '@/views/news/list'
	import tijianxinxi from '@/views/tijianxinxi/list'
	import yishengzuozhen from '@/views/yishengzuozhen/list'
	import jiankangshuju from '@/views/jiankangshuju/list'
	import keshi from '@/views/keshi/list'
	import yiliaojigou from '@/views/yiliaojigou/list'
	import storeup from '@/views/storeup/list'
	import tijianbaogao from '@/views/tijianbaogao/list'
	import users from '@/views/users/list'
	import tijianleixing from '@/views/tijianleixing/list'
	import tijianxiangmu from '@/views/tijianxiangmu/list'
	import tijianyuyue from '@/views/tijianyuyue/list'
	import yuyueguahao from '@/views/yuyueguahao/list'
	import quxiaoyuyue from '@/views/quxiaoyuyue/list'
	import yonghu from '@/views/yonghu/list'
	import systemNotice from '@/views/systemNotice/list'
	import popupRemind from '@/views/popupRemind/list'
	import config from '@/views/config/list'
	import usersCenter from '@/views/users/center'
	import yiliaojigouRegister from '@/views/yiliaojigou/register'
	import yiliaojigouCenter from '@/views/yiliaojigou/center'

export const routes = [{
		path: '/login',
		name: 'login',
        meta: { title: '登录' },
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
        meta: { title: '首页' },
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: 'home',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true,
                title: '首页'
			}
		}, {
			path: '/updatepassword',
			name: 'updatepassword',
            meta: { title: '修改密码' },
			component: () => import('../views/updatepassword.vue')
		}

		,{
			path: '/usersCenter',
			name: 'usersCenter',
            meta: { title: '管理员个人中心' },
			component: usersCenter
		}
		,{
			path: '/yiliaojigouCenter',
			name: 'yiliaojigouCenter',
            meta: { title: '医疗机构个人中心' },
			component: yiliaojigouCenter
		}
		,{
			path: '/news',
			name: 'news',
            meta: { title: '健康科普' },
			component: news
		}
		,{
			path: '/tijianxinxi',
			name: 'tijianxinxi',
            meta: { title: '体检信息' },
			component: tijianxinxi
		}
		,{
			path: '/yishengzuozhen',
			name: 'yishengzuozhen',
            meta: { title: '医生坐诊' },
			component: yishengzuozhen
		}
		,{
			path: '/jiankangshuju',
			name: 'jiankangshuju',
            meta: { title: '健康数据' },
			component: jiankangshuju
		}
		,{
			path: '/keshi',
			name: 'keshi',
            meta: { title: '科室' },
			component: keshi
		}
		,{
			path: '/yiliaojigou',
			name: 'yiliaojigou',
            meta: { title: '医疗机构' },
			component: yiliaojigou
		}
		,{
			path: '/storeup',
			name: 'storeup',
            meta: { title: '我的收藏' },
			component: storeup
		}
		,{
			path: '/tijianbaogao',
			name: 'tijianbaogao',
            meta: { title: '体检报告' },
			component: tijianbaogao
		}
		,{
			path: '/users',
			name: 'users',
            meta: { title: '管理员' },
			component: users
		}
		,{
			path: '/tijianleixing',
			name: 'tijianleixing',
            meta: { title: '体检类型' },
			component: tijianleixing
		}
		,{
			path: '/tijianxiangmu',
			name: 'tijianxiangmu',
            meta: { title: '体检项目' },
			component: tijianxiangmu
		}
		,{
			path: '/tijianyuyue',
			name: 'tijianyuyue',
            meta: { title: '体检预约' },
			component: tijianyuyue
		}
		,{
			path: '/yuyueguahao',
			name: 'yuyueguahao',
            meta: { title: '预约挂号' },
			component: yuyueguahao
		}
		,{
			path: '/quxiaoyuyue',
			name: 'quxiaoyuyue',
            meta: { title: '取消预约' },
			component: quxiaoyuyue
		}
		,{
			path: '/yonghu',
			name: 'yonghu',
            meta: { title: '用户' },
			component: yonghu
		}
		,{
			path: '/systemNotice',
			name: 'systemNotice',
            meta: { title: '消息通知' },
			component: systemNotice
		}
		,{
			path: '/popupRemind',
			name: 'popupRemind',
            meta: { title: '吃药提醒' },
			component: popupRemind
		}
		,{
			path: '/config',
			name: 'config',
            meta: { title: '轮播图' },
			component: config
		}
		]
	},
	{
		path: '/yiliaojigouRegister',
		name: 'yiliaojigouRegister',
        meta: { title: '医疗机构注册' },
		component: yiliaojigouRegister
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
