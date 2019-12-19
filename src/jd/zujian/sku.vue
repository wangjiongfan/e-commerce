<template>
  <div id="sku">
    <transition name="fade" @after-leave="afterLeave">
      <div class="bg" style="clear:both;" v-show="shows" ref="bg">
        <div class="enter" style="" @click="onClose1"></div>
        <div class="image">
            <img width="100%"  :src="product.img[select_color]" alt="">
        </div>
        <div class="title-right">
            <div class="price">￥<span>{{product.price*num}}</span>.00</div>
            <div class="selected">已选:<span style="color:black;font-size:0.3rem">{{product.size[select_size]}}、{{product.color[select_color]}}，{{num}}件</span></div>
        </div>
        <div class="select-list">
            <div class="type"><strong>尺寸</strong></div>
            <ul class="clear">
                <li class="left clear" v-for="(item,index) in product.size" :key="index" @click="select_size = index">
                    <span class="left" :class="select_size == index ? 'active' : ''">{{item}}</span>
                </li>
            </ul>
            <div class="type"><strong>颜色</strong></div>
            <ul class="clear">
                <li class="left clear" v-for="(item,index) in product.color" :key="index" @click="select_color = index">
                    <span class="left" :class="select_color == index ? 'active' : ''">{{item}}</span>
                </li>
            </ul>
        </div>
        <div class="count right clear">
            <span class="left number">数量：</span>
            <span class="left circle" @click="num = num <= 1 ? 1 : --num">-</span>
            <input type="num" v-model="num" class="left" size="5">
            <span class="left circle" @click="num++">+</span>
        </div>
        <button class="btn" @click="jumpToGWC">加入购物车</button>
      </div>
    </transition>
  </div>
</template>
<script>
export default {
    data(){
        return {
            product:{
                price:109,
                size:['10寸','12寸','14寸','16寸'],
                color:['红色','灰色','蓝色','黑色'],
                img:[require("../../assets/img/sku/1.jpg"),require("../../assets/img/sku/2.jpg"),require("../../assets/img/sku/3.jpg"),require("../../assets/img/sku/4.jpg")]
            },
            select_color:0,
            select_size:0,
            num:1
        }
    },
  props: {
    shows: {
      type: Boolean,
      default: true
    }
  },
  methods: {
    onClose1: function() {
      //$emit表示组件与页面间的事件监听，前面的是事件名称

      //    在Shangpin页里写onClose方法的地方的参数（如果写了的话），参数的值就是false
      this.$emit("click1", false);
      console.log(1);
    },
    afterLeave: function() {
      this.$emit("clicks");
      console.log('aa');
    },
    jumpToGWC:function(){
        this.$router.push('/cart');
                    
    }
  }
};
</script>
<style lang="less" scoped>
#sku {
  width: 100%;
  .bg {
    width: 100%;
    min-height: 9.5rem;
    max-height: 11.5rem;
    position: fixed;
    z-index: 101;
    bottom: 0;
    background-color: white;
    .enter{
        width:0.6rem;
        height:0.6rem;
        background-color: green;
        position: absolute;
        right:0.3rem;
        top:0.3rem;
    }
    .image{
        width:1.8rem;
        height: 1.8rem;
        line-height: 0px !important;
        position: absolute;
        left: 0.4rem;
        top:-0.48rem;
        overflow: hidden;
        image{
            display: block;
        }
    }
    .title-right{
        margin-left: 2.4rem;
        .price{
            font-size: 0.36rem!important;
            color: red;
            span{
                font-size: 0.5rem;
            }
        }
        .selected{
            font-size: 0.24rem;
            color: #666;
        }
    }
    
    .select-list{
        margin-top: 1rem;
        padding: 0 0.2rem;
        .type{
            font-size: 0.36rem;
            margin-left: 0.1rem;
            margin-bottom: 0.1rem;
        }
        li{
            margin-bottom: 0.2rem;
            span{
                display: inline-block;
                font-size: 0.30rem;
                width: 1.2rem;
                height: 0.6rem;
                line-height: 0.6rem;
                text-align: center;
                border:1px solid #999;
                margin:0 0.1rem;
                box-sizing: border-box;
                &.active{
                    color: white;
                    background-color: red;
                    border:none;
                }
            }
        }
    }
    .count{
        font-size: 0.4rem;
        margin-top: 0.4rem;
        margin-right: 0.4rem;
        .number{
            font-size: 0.32rem;
            line-height: 0.6rem;
        }
        .circle{
            display: inline-block;
            line-height: 0.5rem;
            width: 0.6rem;
            height: 0.6rem;
            text-align: center;
            border:1px solid red;
            border-radius: 50%;
        }
        input{
            text-align: center;
            line-height: 0.6rem;
            border: none;
            outline: none;
        }
    }
  }
  .btn{
      width: 100%;
      height: 0.8rem;
      font-size: 0.32rem;
      background-color: red;
      color: white;
      border: none;
      position: absolute;
      bottom: 0;
  }
}

.fade-enter {
  transform: translateY(100%);
}
.fade-enter-active {
  transition: all 0.4s;
}
.fade-enter-to {
  transform: translateY(0%);
}

.fade-leave {
  transform: translateY(0);
}
.fade-leave-active {
  transition: all 0.2s;
}
.fade-leave-to {
  transform: translateY(100%);
}
</style>