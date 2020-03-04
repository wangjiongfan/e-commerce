import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import Vant from 'vant'

import "./assets/style/weui.css"
import "./assets/css/font-awesome.css"
import 'vant/lib/index.css'

Vue.config.productionTip = false
// 创建原型链
Vue.prototype.$axios = axios
Vue.use(Vant);


// 以下为实例化对象，在vue中用$表示
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
