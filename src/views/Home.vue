<template>
  <div class="home">
    <searchbar :class="{fixed:isScoll}"/>
    <home-swiper :imglist="imglist"></home-swiper>
    <navbar></navbar>
    <jingangqu></jingangqu>
    <timer></timer>
    <products></products>
    <div class="totop" :class="{hide:isScoll}" @click="goToTop">↑</div>
  </div>
</template>
<script>
  import searchbar from "@/jd/zujian/topbar"
  import HomeSwiper from "@/jd/zujian/firstBanner"
  import navbar from "@/jd/zujian/navbar"
  import jingangqu from "@/jd/zujian/jingangqu"
  import products from "@/jd/zujian/products"
  import timer from "@/jd/zujian/timer"

  export default {
    data:function(){
      return{
        isScoll:false,
        imglist:[require("../assets/img/001.png"),require("../assets/img/002.jpg"),require("../assets/img/003.jpg"),require("../assets/img/004.jpg"),require("../assets/img/005.jpg")]
      }
    },
    name:'home',
    components:{
      searchbar,
      HomeSwiper,
      navbar,
      jingangqu,
      products,
      timer
    },
    methods:{
      goToTop:function(){
          var goT = setInterval(function(){
          if(document.documentElement.scrollTop > 0){
            document.documentElement.scrollTop -= 20;
            // console.log(document.documentElement.scrollTop);
          }else{
            clearInterval(goT);
          }
        },1);
      }
    },
    created:function(){
      var that = this;
      document.onscroll = function(e){
        //console.log(e);
        var st = document.documentElement.scrollTop
        //console.log(st);
        if(st > 30){
          that.isScoll = true;
        }else{
          that.isScoll = false;
        }
      }
    }
    
  }
</script>
<style lang="less" scoped>
.home{
  background-image: url(../assets/img/banner-bg.png);
  background-size:100% 3.6rem ;
  background-repeat: no-repeat;
  padding-bottom: 1rem;
  padding-top:0.88rem; 
}
.fixed{
  background-color: red;
}
.totop{
  width: 1rem;
  height: 1rem;
  font-size: 0.56rem;
  text-align: center;
  line-height: 1rem;
  background-color: white;
  position: fixed;
  border-radius: 50%;
  border: 2px solid #777;
  right: 0.4rem;
  bottom:1.3rem;
  display: none
}
.hide{
  display: block;
}
  
</style>