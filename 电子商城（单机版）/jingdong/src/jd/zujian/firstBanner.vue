<template>
    <div>
        <div class="swiper-container banner">
            <div class="swiper-wrapper">
                <div class="swiper-slide" v-for="(item ,index) in imglist" :key="index"><img :src="item" alt=""></div>
            </div>
            <!-- 如果需要分页器 -->
            <div class="swiper-pagination banner_page"></div>
            
            <!-- 如果需要导航按钮 -->
            <!-- <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div> -->
            
            <!-- 如果需要滚动条 -->
            <!-- <div class="swiper-scrollbar"></div> -->
        </div>
    </div>
</template>

<script>

  import "swiper/css/swiper.css"
  import Swiper from "swiper"
export default {
    data(){
        return{
            // require动态导入地址，以变量形式导入必须以require方式写
            
        }
    },
    props:{
      imglist:{
        type:Array,//属性
        default:function(){
          return []
        }//默认值，数组与对象必须写成返回值
      },
      navIndex:{
        type:String,
        default:""
      }
    },
    mounted:function(){
      new Swiper ('.banner', {
      //direction: 'vertical', // 垂直切换选项
      loop: true, // 循环模式选项
      autoplay:true,
      // 如果需要分页器
      pagination: {
        el: '.banner_page',
        }
      })
    }
}
</script>

<style lang="less" scoped>
.swiper-container{
    border-radius: 8px;
    height: 170px;
    width: 93%;
    position: relative;
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
  }
</style>