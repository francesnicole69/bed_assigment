// var webpack = require('webpack');
//vue2
const path = require('path')

function resolve(dir) {
	return path.join(__dirname, dir)
}

function publicPath() {
	if (process.env.NODE_ENV == 'production') {
		return "././";
	} else {
		return "/";
	}
}
// vue.config.js
module.exports = {
	// publicPath:"././",
	publicPath: publicPath(),
	// 国际化配置 使用其它语言，默认情况下中文语言包依旧是被引入的

	configureWebpack: {
		resolve: {
			fallback: { path: require.resolve("path-browserify") },
		},
	},
	lintOnSave: false,
	devServer: {
		open: true,
		host: "localhost", //指定使用一个 host。默认是 localhost，这里默认值即可
		port: 8082, //指定端口
		hot: true, // 开启热更新
		https: false, // 是否开启https模式
		proxy: { // 请求代理服务器
			[process.env.VUE_APP_BASE_API]: { //带上api前缀的
				target: process.env.VUE_APP_BASE_API_URL, //代理目标地址
				changeOrigin: true,
				secure: false,
				pathRewrite: { // 在发出请求后将/api替换为''空值，这样不影响接口请求
					['^' + process.env.VUE_APP_BASE_API]: process.env.VUE_APP_BASR_API_PREFIX
				}
			}
		},
		client: {
			overlay: false,
		},

	},
	chainWebpack(config) {
		config.module
			.rule('svg')
			.exclude.add(resolve('src/icons'))
			.end()
		config.module
			.rule('icons')
			.test(/\.svg$/)
			.include.add(resolve('src/icons'))
			.end()
			.use('svg-sprite-loader')
			.loader('svg-sprite-loader')
			.options({
				symbolId: 'icon-[name]'
			})
			.end()
	}
}
