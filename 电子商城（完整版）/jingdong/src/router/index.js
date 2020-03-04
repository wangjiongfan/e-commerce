import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Classify from '../views/Classify.vue'
import Cart from '../views/Cart.vue'
import Mine from '../views/Mine.vue'
import Shangpin from '../views/Shangpin.vue'
import Login from '../views/login.vue'
import vuex from '../store/index.js'
import Mycomment from '../views/Mycomment.vue'
import MyShopping from '../views/MyShopping.vue'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home,
    meta: {
      keepAlive: true // 需要被缓存
    }
  },
  {
    path: '/classify',
    name: 'classify',
    component: Classify
  },
  {
    path: '/cart',
    name: 'cart',
    component: Cart
  },
  {
    path: '/mine',
    name: 'mine',
    component: Mine,
    meta: {
      keepAlive: true // 需要被缓存
    }
  },
  {
    path: '/Mycomment',
    name: 'mycomment',
    component: Mycomment
  },
  {
    path:'/MyShopping',
    name:'myshopping',
    component:MyShopping
  },
  {
    path: '/shangpin/:year/:month/:id' + '.html',
    name: 'shangpin',
    component: Shangpin
  },
  {
    path: '/login',
    name: 'login',
    component: Login
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

// 全局前置守卫https://router.vuejs.org/zh/guide/advanced/navigation-guards.html#全局前置守卫
router.beforeEach(function(to,from,next){
  // console.log(to);//到哪里去
  // console.log(from);//从哪里来


  var isLogin = vuex.state.isLogin;//isLogin在store文件夹下的index里面
  // console.log(isLogin);
  // var isLogin = false;
  if((!isLogin || isLogin == 'false') && to.path == '/mine'){//to.path
    next('/login')
  }else{
    next();
  }
})

export default router
