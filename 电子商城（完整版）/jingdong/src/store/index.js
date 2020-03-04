import Vue from 'vue'
import Vuex from 'vuex'
// vuex表示状态管理器
// 全家桶包括脚手架，路由器，状态管理器，打包工具

Vue.use(Vuex)

export default new Vuex.Store({
  // state表示用来存放状态的值或变量的
  state: {
    isLogin:localStorage.getItem('isLogin'),
    userId:localStorage.getItem('userId')
  },
  //更改 Vuex 的 store 中的状态的唯一方法是提交 mutation。
  mutations: {
    changeLogin:function(state, val1,val2){//val就是
      localStorage.setItem("isLogin",val1);
      if(!val1 || val1 === "false"){
        localStorage.removeItem('username');
        localStorage.removeItem('userId')
      }
      
      // localStorage.removeItem('username');
      // console.log(state.isLogin);
      console.log(val1);
      state.isLogin = val1;
    }
  },

  //与$store.commit原理一样
  actions: {
  },
  modules: {
  }
})
