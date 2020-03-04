<template>
    <div class="mine">
      <viewtopbar>我的</viewtopbar>
      <div class="info ">
        <div class="clear">
          <div class="left"></div>
          <span class="left">{{username}}</span>
        </div>
      </div>
      <div class="cell">
        个人信息
      </div> 
      <div class="cell">
        订单信息
      </div> 
      <div class="cell">
        设置
      </div>
      <div class="cell" @click="logout">
        退出登录
      </div>
      <navbar></navbar>
    </div>
</template>
<script>
import navbar from "@/jd/zujian/navbar"
import viewtopbar from "@/jd/zujian/viewtopbar"
import checkbox from "@/jd/zujian/checkBox"

export default {
    data:function(){
      return{
        xieyi:true,
        isCheck:false,
        xueli:[],
        username:this.getCookie('username'),
        password:localStorage.getItem('password')
      }
    },
    name:'mine',
    components:{
      navbar,
      viewtopbar,
      checkbox
    },
    methods:{
      logout(){
        this.$store.commit('changeLogin',false);
        this.$router.push('/');
      },
      getCookie(name){
        var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
        if(arr=document.cookie.match(reg))
        return unescape(arr[2]);
        else
        return null;
      }
    }
}
</script>
<style lang="less" scoped>
  .mine{
    padding-top: 0.88rem;
    font-size: 0.36rem;
    width: 100%;
    .info{
      background-color: rgb(58, 58, 58);
      height: 4rem;
      width: 100%;
      padding-top: 1rem;
      box-sizing: border-box;
      .clear{
        div{
          width: 2rem;
          height: 2rem;
          border-radius: 50%;
          background-color: skyblue;
          border: 3px solid white;
          line-height: 2rem;
          text-align: center;
          margin-right: 0.2rem;
          margin-left: 0.2rem;
          box-sizing: border-box;
        }
        span{
          height: 2rem;
          line-height: 2rem;
          margin-left: 0.2rem;
          color: white;
        }
      }
    }
    .cell{
      width: 100%;
      height: 0.88rem;
      background: #d9d9d9;
      margin: 0.1rem 0;
      line-height: 0.88rem;
      font-size: 0.32rem;
      padding-left: 1rem;
      box-sizing: border-box;
    }
  }
</style>