import { Router } from 'express'
import FileController from './File'
import CommonController from './Common'
import ConfigController from './Config'
import UsersController from './Users'
import NewsController from './News'
import YonghuController from './Yonghu'
import YiliaojigouController from './Yiliaojigou'
import TijianleixingController from './Tijianleixing'
import TijianxiangmuController from './Tijianxiangmu'
import TijianyuyueController from './Tijianyuyue'
import TijianxinxiController from './Tijianxinxi'
import TijianbaogaoController from './Tijianbaogao'
import QuxiaoyuyueController from './Quxiaoyuyue'
import MenuController from './Menu'
import KeshiController from './Keshi'
import StoreupController from './Storeup'
import YuyueguahaoController from './Yuyueguahao'
import PopupRemindController from './PopupRemind'
import JiankangshujuController from './Jiankangshuju'
import YishengzuozhenController from './Yishengzuozhen'
import ChatController from './Chat'
import ChathelperController from './Chathelper'
import SystemNoticeController from './SystemNotice'

export default ({ config, db }) => {
	let api = Router()
	api.use('/file', FileController({ config, db }))
	api.use('/', CommonController({ config, db }))
	api.use('/config', ConfigController({ config, db }))
	api.use('/users', UsersController({ config, db }))
	api.use('/news', NewsController({ config, db }))
	api.use('/yonghu', YonghuController({ config, db }))
	api.use('/yiliaojigou', YiliaojigouController({ config, db }))
	api.use('/tijianleixing', TijianleixingController({ config, db }))
	api.use('/tijianxiangmu', TijianxiangmuController({ config, db }))
	api.use('/tijianyuyue', TijianyuyueController({ config, db }))
	api.use('/tijianxinxi', TijianxinxiController({ config, db }))
	api.use('/tijianbaogao', TijianbaogaoController({ config, db }))
	api.use('/quxiaoyuyue', QuxiaoyuyueController({ config, db }))
	api.use('/menu', MenuController({ config, db }))
	api.use('/keshi', KeshiController({ config, db }))
	api.use('/storeup', StoreupController({ config, db }))
	api.use('/yuyueguahao', YuyueguahaoController({ config, db }))
	api.use('/popupremind', PopupRemindController({ config, db }))
	api.use('/jiankangshuju', JiankangshujuController({ config, db }))
	api.use('/yishengzuozhen', YishengzuozhenController({ config, db }))
	api.use('/chat', ChatController({ config, db }))
	api.use('/chathelper', ChathelperController({ config, db }))
	api.use('/systemnotice', SystemNoticeController({ config, db }))

	return api
}
