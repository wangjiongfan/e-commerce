import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import View from '../views/View.vue'
import Cart from '../views/Cart.vue'
import Mine from '../views/Mine.vue'
import Shangpin from '../views/Shangpin.vue'
import Login from '../views/login.vue'
import vuex from '../store/index.js'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/view',
    name: 'view',
    component: View
  },
  {
    path: '/cart',
    name: 'cart',
    component: Cart
  },
  {
    path: '/mine',
    name: 'mine',
    component: Mine
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
  },
  {
    path: '/about',//组件的链接路径
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
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
  if(!isLogin && to.path == '/mine'){//to.path
    next('/login')
  }else{
    next();
  }
})

export default router
