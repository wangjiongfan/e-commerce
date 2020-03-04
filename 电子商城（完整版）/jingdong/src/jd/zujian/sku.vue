<template>
  <div id="sku" @touchmove.prevent>
    <transition name="fade" @after-leave="afterLeave">
      <div class="bg" style="clear:both;" v-show="shows" ref="bg">
        <div class="enter" style="" @click="onClose1"></div>
        <div class="image">
            <img width="100%" :src="productDetail.length == 0 ? '' : productDetail[0].img" alt="">
        </div>
        <div class="title-right">
            <div class="price">￥<span>{{int}}</span>.{{flo}}</div>
            <div class="selected">已选:&nbsp;<span v-for="(item,index) in select_inform" :key="index" style="color:black;font-size:0.3rem">{{item.val}}&nbsp;</span>{{num}}件</div>
        </div>
        <div class="select-list">
          <div class="left sel" v-for="(item,index) in productDetail" :key="index">
            <div class="type"><strong>{{item.detailKey}}</strong></div>
            <ul class="clear">
              <li class="left clear" v-for="(i,j) in item.selects" @click="choose(index,j)" :key="j">
                <span class="left" :class="select_key[index] == j ? 'active' : ''">{{i}}</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="count right clear">
            <span class="left number">数量：</span>
            <span class="left circle" @click="num = num <= 1 ? 1 : --num">-</span>
            <input type="num" v-model="num" class="left" size="5">
            <span class="left circle" @click="num++">+</span>
        </div>
        <button class="toGWC" @click="jumpToGWC">加入购物车</button>
      </div>
    </transition>
  </div>
</template>
<script>
export default {
    data(){
        return {
            select_key:[],
            select_color:0,
            select_size:0,
            num:1,
            exactPrice:'',
            EP:0,
            int:'',
            flo:'',
            select_inform:[],
        }
    },
  props: {
    shows: {
      type: Boolean,
      default: true
    },
    price:{
      type:String,
      default:''
    },
    productDetail:{
      type:Array,
      default:function(){
        return [];
      }
    },
    productDetailLength:{
      type:Number,
      default:0
    }
  },
  watch:{
    productDetail(newVal){
      for(let i = 0;i<newVal.length;i++){
        this.select_key.push(0);
        this.select_inform.push({name:newVal[i].detailKey,val:newVal[i].selects[0]});
      }
    },
    price(newVal){
      var p = parseFloat(newVal)*this.num;
      this.exactPrice = p.toFixed(2);
      this.int = this.exactPrice.split('.')[0];
      this.flo = this.exactPrice.split('.')[1];
    },
    num(newVal){
      var p = parseFloat(this.price)*newVal;
      this.exactPrice = p.toFixed(2);
      this.int = this.exactPrice.split('.')[0];
      this.flo = this.exactPrice.split('.')[1];
    }
  },
  methods: {
    choose(index,j){
      this.select_size = j
      this.select_key[index] = j;
      this.$forceUpdate();
      this.select_inform[index].val = this.productDetail[index].selects[j];
    },

    onClose1: function() {
      this.$emit("click1", false);
    },
    afterLeave: function() {
      this.$emit("clicks");
    },
    jumpToGWC:function(){
        let strArr = [];
        for(let i=0;i<this.select_inform.length;i++){
          strArr.push(this.select_inform[i].val)
        }
        let str = strArr.join('，');
        this.$axios.post('http://192.168.1.6/jingdongBack/09addUserCart.php?uid='+this.$store.state.userId+'&pid='+this.$route.params.id+'&productDetail='+str+'&count='+this.num)
        .then((e)=>{
          // console.log(e);
          this.$router.push('/cart');
        }).catch((err)=>{
          // console.log(err);
        })
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
        .sel{
          width: 100%;
          .type{
            font-size: 0.36rem;
            margin-left: 0.1rem;
            margin-bottom: 0.1rem;
          }
          li{
            margin-bottom: 0.2rem;
            float: left;
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
}
.toGWC{
    width: 100%;
    height: 0.8rem;
      font-size: 0.32rem;
      background-color: red;
      color: white;
      border: none;
      position: fixed;
      left: 0px;
      bottom: 0px;
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