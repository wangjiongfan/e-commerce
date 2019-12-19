<template>
    <div id="cart">
        <returnbar>购物车</returnbar>
        <div class="login" v-show="!$store.state.isLogin">
          <span>登录后可同步账户购物车中的商品</span>
          <button class="goLogin">登录</button>
        </div>
        <div class="empty" v-show="cartProducts.length == 0">
          <img width="90px" height="90px" src="../assets/img/empty.jpg" alt="">
          <div>
            登录后可同步购物车中的商品
          </div>
        </div>
        <cartProduct :select="selects" :cartProducts="cartProducts" @selected="onSelect"></cartProduct>
        <van-submit-bar
          :price="totalPrice"
          button-text="提交订单">
          <van-checkbox v-model="allchecked" checked-color="#ff0000" @click="AllCheck">全选</van-checkbox>
        </van-submit-bar>
    </div>
</template>
<script>
import returnbar from "@/jd/zujian/returnbar"
import cartProduct from "@/jd/zujian/cartProduct"
export default {
    data:function(){
      return{
          isLogin:false,
          allchecked:true,
          selects:[10001],
          cartProducts:[
            {
              id:10001,
              type:'灰色，网格',
              title:"三级包",
              price:109.00,
              img:require('../assets/img/sku/1.jpg'),
              count:1
            },
            {
              id:10021,
              type:'蓝色，防滑底',
              title:"拖鞋",
              price:29.00,
              img:require('../assets/img/sku/2.jpg'),
              count:1
            },
            {
              id:10031,
              type:'蓝色，防滑底',
              title:"拖鞋",
              price:29.00,
              img:require('../assets/img/sku/3.jpg'),
              count:1
            }
          ]
      }
    },
    name:'cart',
    components:{
      returnbar,
      cartProduct
    },
    methods:{
      onSelect:function(dat){
        this.selects = dat;
        // console.log(this.selects);
      },
      AllCheck:function(){
        this.selects = [];
        if(!this.allchecked){
          for(var j=0;j<this.cartProducts.length;j++){
            this.selects.push(this.cartProducts[j].id);
          }
        }
      }
    },
    computed:{
      totalPrice:function(){
        var all = 0;
        // for(var i=0;i<this.selects.length;i++){
        //   for(var j=0;j<this.cartProducts.length;j++){
        //     if(this.selects[i] == this.cartProducts[j].id){
        //       all += this.cartProducts[j].price * this.cartProducts[j].count
        //     }
        //   }
        // }
        for(var i=0;i<this.cartProducts.length;i++){
          for(var j=0;j<this.selects.length;j++){
            if(this.selects[i] == this.cartProducts[j].id){
              all += this.cartProducts[j].price * this.cartProducts[j].count
            }
          }
        }
        return(all * 100)
      }
    },
    created:function(){
      if(this.selects.length == this.cartProducts.length){
          this.allchecked = true;
        }else{
          this.allchecked = false;
        }
    },
    watch:{
      selects:function(newVal){
        if(newVal.length == this.cartProducts.length){
          this.allchecked = true;
        }else{
          this.allchecked = false;
        }
      }
    }
}
</script>
<style lang="less" scoped>
  #cart{
    padding-top: 0.88rem;
    .login{
      font-size: 0.28rem;
      text-align: center;
      margin-top: 0.2rem;
      margin-bottom: 0.2rem;
    }
    .goLogin{
      margin-left: 0.2rem;
      padding:0.1rem 0.4rem;
      border-radius: 5px;
      border: none;
      background-color: orangered;
      color: white;
    }
    .empty{
      margin-top: 1rem;
      font-size: 0.32rem;
      text-align: center;
      img{
        border-radius: 25%;
      }
    }
  }
</style>