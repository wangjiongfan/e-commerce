<template>
  <div id="timer">
    <div class="clear">
      <div class="txt left">限时抢购</div>
      <div class="time right">{{hoursRound}}:{{minutesRound}}:{{seconds}}</div>
    </div>
    <div class="swiper-container quicknav1">
      <div class="swiper-wrapper">
        <div class="swiper-slide" v-for="(item ,index) in goods" :key="index">
          <ul>
            <li class="clear" v-for="(v ,i) in item" :key="i">
              <div class="pic">
                <img width="100%" :src="v.img" alt />
              </div>
              <div class="title" v-text="v.title"></div>
              <div class="price">
                <div class="lastprice">￥{{v.lastprice}}</div>
                <div class="nowprice">￥{{v.nowprice}}</div>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <div class="prev"></div>
      <div class="next"></div>
    </div>
  </div>
</template>
<script>
import "swiper/css/swiper.css";
import Swiper from "swiper";
export default {
  data() {
    return {
      minutesRound:30,
      seconds:0,
      hoursRound:1,
      myTime:5400000,
      goods: [
        [
          {
            id: 20001,
            img: require("../../assets/img/timer/1.jpg"),
            title: "九阳台式洗碗机",
            lastprice: 1600.0,
            nowprice: 970.0
          },
          {
            id: 20002,
            img: require("../../assets/img/timer/1.jpg"),
            title: "九阳台式洗碗机",
            lastprice: 1600.0,
            nowprice: 970.0
          },
          {
            id: 20003,
            img: require("../../assets/img/timer/1.jpg"),
            title: "九阳台式洗碗机",
            lastprice: 1600.0,
            nowprice: 970.0
          }
        ],
        [
          {
            id: 20004,
            img: require("../../assets/img/timer/1.jpg"),
            title: "九阳台式洗碗机",
            lastprice: 1600.0,
            nowprice: 970.0
          },
          {
            id: 20005,
            img: require("../../assets/img/timer/1.jpg"),
            title: "九阳台式洗碗机",
            lastprice: 1600.0,
            nowprice: 970.0
          },
          {
            id: 20006,
            img: require("../../assets/img/timer/1.jpg"),
            title: "九阳台式洗碗机",
            lastprice: 1600.0,
            nowprice: 970.0
          }
        ],
        [
          {
            id: 20007,
            img: require("../../assets/img/timer/1.jpg"),
            title: "九阳台式洗碗机",
            lastprice: 1600.0,
            nowprice: 970.0
          },
          {
            id: 20008,
            img: require("../../assets/img/timer/1.jpg"),
            title: "九阳台式洗碗机",
            lastprice: 1600.0,
            nowprice: 970.0
          },
          {
            id: 20009,
            img: require("../../assets/img/timer/1.jpg"),
            title: "九阳台式洗碗机",
            lastprice: 1600.0,
            nowprice: 970.0
          }
        ],
        [
          {
            id: 20010,
            img: require("../../assets/img/timer/1.jpg"),
            title: "九阳台式洗碗机",
            lastprice: 1600.0,
            nowprice: 970.0
          },
          {
            id: 20011,
            img: require("../../assets/img/timer/1.jpg"),
            title: "九阳台式洗碗机",
            lastprice: 1600.0,
            nowprice: 970.0
          },
          {
            id: 20012,
            img: require("../../assets/img/timer/1.jpg"),
            title: "九阳台式洗碗机",
            lastprice: 1600.0,
            nowprice: 970.0
          }
        ]
      ]
    };
  },
  beforeCreat:function(){
    // this.seconds = this.seconds < 10 ? '0' + this.seconds : this.seconds;
  },
  created:function(){
    setInterval(() => {
      var hours = this.myTime  / 1000 / 60 / 60;
      this.hoursRound = Math.floor(hours) < 10 ? '0' + Math.floor(hours) : Math.floor(hours);
      var minutes = this.myTime / 1000 / 60 - (60 * this.hoursRound); 
      this.minutesRound = Math.floor(minutes) < 10 ? '0' + Math.floor(minutes) : Math.floor(minutes); 
      var sec = this.myTime / 1000 - (60 * 60 * this.hoursRound) - (60 * this.minutesRound)
      sec = sec < 10 ? '0' + sec : sec;
      this.seconds = sec;   
      // var time = this.hoursRound + ':' + this.minutesRound + ':' + this.seconds;
      // console.log(this.hoursRound);
      // console.log(this.minutesRound);
      // console.log(this.seconds);
      // console.log(time);
      

      this.myTime = this.myTime - 1000;
    },1000)
  },
  mounted: function() {
    new Swiper(".quicknav1", {
      // 如果需要分页器
      pagination: {
        el: ".quicknav_page1"
      },
      navigation: {
        nextEl: ".next",
        prevEl: ".prev"
      }
    });
    
  }
};
</script>
<style lang="less" scoped>
.txt{
  font-size: 0.48rem;
  margin-left:0.25rem; 
}
.time{
  font-size: 0.48rem;
  color: red;
  margin-right:0.25rem;
}
ul {
  width: 92%;
  margin: 0 auto;
  li {
    float: left;
    width: 33.33%;

    div {
      font-size: 0.32rem;
    }
    .pic {
      width: 100%;
      padding: 0 5%;
      box-sizing: border-box;
      margin: 0 !important;
    }
    .title,.lastprice,.nowprice {
      margin: 0 0.1rem;
      font-size: 0.28rem;
    }
    .price {
      display: flex;
      align-items:center;
      .lastprice {
        // float: left;
        text-decoration: line-through;
        font-size: 0.28rem;
        color: #999;
        font-weight: 300;
      }
      .nowprice {
        // float: right;
        font-size: 0.36rem;
        color: red;
      }
    }
  }
}
.next {
  position: absolute;
  top: 0.8rem;
  right: 0.2rem;
  z-index: 14;
  height: 0.8rem;
  width: 0.8rem;
  background-image: url(../../assets/img/nex.png);
  background-size: cover;
  box-shadow: 1px 1px 2px 1px #bbb;
  border-radius: 50%;
}
.prev {
  position: absolute;
  top: 0.8rem;
  left: 0.2rem;
  z-index: 14;
  height: 0.8rem;
  width: 0.8rem;
  // background-color: white;
  background-image: url(../../assets/img/pre.png);
  background-size: cover;
  box-shadow: -1px 1px 2px 1px #bbb;
  border-radius: 50%;
}
</style>