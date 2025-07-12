const config = {
    get() {
        return {
            url : process.env.VUE_APP_BASE_API_URL + process.env.VUE_APP_BASE_API + '/',
            name: process.env.VUE_APP_BASE_API,
			menuList:[
				{
					name: '新闻资讯管理',
					icon: '',
					child:[

						{
							name:'Health Education',
                            url:'/index/newsList'

						},
					]
				},
				{
					name: '健康体检管理',
					icon: '',
					child:[

						{
							name:'physical examination item',
                            url:'/index/tijianxiangmuList'

						},
					]
				},
				{
					name: '医生坐诊管理',
					icon: '',
					child:[

						{
							name:'Doctor on duty',
                            url:'/index/yishengzuozhenList'

						},
					]
				},
			]
        }
    },
    getProjectName(){
        return {
            projectName: `Web-based Elderly Health Service System`
        } 
    }
}
export default config
