<template>
    <div>
        <div class="swiper-container banner3">
            <div class="swiper-wrapper">
                <div class="swiper-slide" v-for="(item ,index) in imglist" :key="index"><img :src="item" alt=""></div>
            </div>
            <div class="prev"></div>
            <div class="next"></div>
        </div>
    </div>
</template>

<script>

  import "swiper/css/swiper.css"
  import Swiper from "swiper"
export default {
    data(){
        return{
          
        }
    },
    // vue里面帮我们分装好的属性，可以在在标签里直接使用，使用方法和调用id和class后的方法类似，只是可以在标签中加了这个属性后直接使用，不用调取
    props:{
      imglist:{
        type:Array,//属性
        default:function(){
          return []
        }//默认值，如果是数组与对象则必须写成返回值
      },
      navIndex:{
        type:String,
        default:""
      }
    },
    mounted:function(){
      new Swiper ('.banner3', {
      //direction: 'vertical', // 垂直切换选项
      loop: true, // 循环模式选项
    //   autoplay:true,
      // 如果需要分页器
      pagination: {
        el: '.banner_page3',
      },
      navigation: {
        nextEl: '.next',
        prevEl: '.prev',
      }
      })
    }
}
</script>

<style lang="less" scoped>
.swiper-container{
    height: 8rem;
    width: 100%;
    position: relative;
    //--swiper-theme-color: #ff6600;/* 设置Swiper风格 */
    --swiper-navigation-color:rgba(0,0,0,10);/* 单独设置按钮颜色 */
    --swiper-navigation-size: 30px;/* 设置按钮大小 */
    .swiper-pagination{
      top:1.7rem;
    }
    .swiper-wrapper{
      height: 100%;
      width: 100%;
      .swiper-slide{
        height: 100%;
        width: 100%;
        img{
          width: 100%;
        }
      }
    }
    .banner_page{
      color: white
    }
    .next{
      position: absolute;
      top:3.6rem;
      right: 0.2rem;
      z-index: 14;
      height: 0.8rem;
      width: 0.8rem;
      background-image: url(../../assets/img/nex.png);
      background-size: cover;
      opacity:0.9;
      filter:alpha(opacity=90);
      border-radius: 50%;
    }
    .prev{
      position: absolute;
      top:3.6rem;
      left: 0.2rem;
      z-index: 14;
      height: 0.8rem;
      width: 0.8rem;
      background-image: url(../../assets/img/pre.png);
      background-size: cover;
      opacity:0.9;
      filter:alpha(opacity=90);
      border-radius: 50%;
    }

  }
  
</style>