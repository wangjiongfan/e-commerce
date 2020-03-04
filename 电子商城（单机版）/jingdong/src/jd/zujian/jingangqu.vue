<template>
  <div id="quickbar">
    <div class="swiper-container quicknav">
      <div class="swiper-wrapper">
        <div class="swiper-slide" v-for="(item ,index) in quickList" :key="index">
          <ul class="clear">
            <li class="left" v-for="(v ,i) in item" :key="i">
              <img :src="v.img" alt />
              <div v-text="v.title"></div>
            </li>
          </ul>
        </div>
      </div>
      <!-- 如果需要分页器 -->
      <div class="swiper-pagination quicknav_page3"></div>
    </div>
  </div>
</template>
<script>
import "swiper/css/swiper.css";
import Swiper from "swiper";
export default {
  data() {
    return {
      quickList: [
        [
          {
            title: "京东超市",
            img: require("../../assets/img/jingangqu/1.png")
          },
          {
            title: "数码电器",
            img: require("../../assets/img/jingangqu/2.png")
          },
          {
            title: "京东服饰",
            img: require("../../assets/img/jingangqu/3.png")
          },
          {
            title: "京东生鲜",
            img: require("../../assets/img/jingangqu/4.png")
          },
          {
            title: "京东到家",
            img: require("../../assets/img/jingangqu/5.png")
          },
          {
            title: "京东超市",
            img: require("../../assets/img/jingangqu/6.png")
          },
          {
            title: "京东超市",
            img: require("../../assets/img/jingangqu/7.png")
          },
          {
            title: "京东超市",
            img: require("../../assets/img/jingangqu/8.png")
          }
        ],
        [
          {
            title: "京东超市",
            img: require("../../assets/img/jingangqu/8.png")
          },
          {
            title: "数码电器",
            img: require("../../assets/img/jingangqu/7.png")
          },
          {
            title: "京东服饰",
            img: require("../../assets/img/jingangqu/6.png")
          },
          {
            title: "京东生鲜",
            img: require("../../assets/img/jingangqu/5.png")
          },
          {
            title: "京东到家",
            img: require("../../assets/img/jingangqu/4.png")
          },
          {
            title: "充值缴费",
            img: require("../../assets/img/jingangqu/3.png")
          },
          {
            title: "9.9元拼",
            img: require("../../assets/img/jingangqu/2.png")
          },
          {
            title: "充值缴费",
            img: require("../../assets/img/jingangqu/1.png")
          }
        ]
      ]
    };
  },
  mounted: function() {
    new Swiper(".quicknav", {
      //direction: 'vertical', // 垂直切换选项

      // 如果需要分页器
      pagination: {
        el: ".quicknav_page3"
      }
    });
  }
};
</script>
<style lang="less" scoped>
#quickbar {
  width: 100%;
  margin-top: 0.2rem;
  ul {
    width: 100%;
    margin-bottom: 0.3rem;
    li {
      width: 25%;
      text-align: center;
      margin-top: 0.1rem;
      img {
        display: block;
        width: 0.8rem;
        height: 0.8rem;
        margin: 5px auto -3px;
      }
      div {
        font-size: 0.28rem;
      }
    }
  }
}
.swiper-container {
  --swiper-theme-color: #ff6600;
  --swiper-pagination-color: #00ff33; /* 两种都可以 */
}
.swiper-pagination {
  top: 1.7rem;
  z-index: 10;
}
</style>