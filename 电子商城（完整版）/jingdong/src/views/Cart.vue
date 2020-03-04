<template>
    <div id="cart">
        <div class="delshade " v-if="delConfig">
          <div class="delbox">
            <div class="deltext">确定删除？</div>
            <button class="delsure" @click="delensure">确定</button><button class="delcancle" @click="delConfig=false">取消</button>
          </div>
        </div>
        <returnbar>购物车</returnbar>
        <div class="login" v-show="!$store.state.isLogin || $store.state.isLogin === 'false'">
          <span>登录后可同步账户购物车中的商品</span>
          <button class="goLogin" @click="login">登录</button>
        </div>
        <cartProduct :select="selects" :cartProducts="cartProducts" @selected="onSelect" @del="del"></cartProduct>
        <van-submit-bar
          :price="totalPrice"
          button-text="提交订单"
          @submit="onSubmit">
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
          allchecked:false,
          selects:[],
          cartProducts:[],
          delConfig:false,
          delLid:0,
          delInd:0,
          accountSelect:[]
      }
    },
    name:'cart',
    components:{
      returnbar,
      cartProduct
    },
    methods:{
      del(delLid,delInd){
        this.delLid = delLid;
        this.delInd = delInd;
        this.delConfig = true;
      },
      delensure(){
        this.cartProducts.splice(this.delInd,1);
        this.delConfig = false;
        this.$axios.get('http://192.168.1.6/jingdongBack/10delUserCart.php?Id=' + this.delLid)
        .then((e)=>{
          // console.log(e);
        })
      },
      login(){
          this.$router.push('login');
      },
      onSelect:function(dat){
        this.selects = dat;
      },
      AllCheck:function(){
        this.selects = [];
        if(!this.allchecked){
          for(var j=0;j<this.cartProducts.length;j++){
            this.selects.push(this.cartProducts[j].id);
          }
        }
      },
      onSubmit(){
        // console.log(this.selects);
        // console.log(this.cartProducts);
        let arr = [...this.cartProducts];
        let arr2 = [];
        for(let i=0;i<this.cartProducts.length;i++){
          let panduan = false;
          for(let j=0;j<this.selects.length;j++){
            if(this.selects[j] == this.cartProducts[i].id){
              this.$axios.get('http://192.168.1.6/jingdongBack/12addOrderForm.php?Id=' + this.cartProducts[i].id + '&uid=' + this.cartProducts[i].uid + '&pid=' + this.cartProducts[i].pid + '&productDetail=' + this.cartProducts[i].type + '&count=' + this.cartProducts[i].count)
              .then(e=>{
                // console.log(e.data);
              })
              panduan = true;
            }
          }
          if(!panduan){
            arr2.push(this.cartProducts[i])
          }
        }
        this.cartProducts = arr2;
        this.selects = [];
        // console.log(arr2);
      }
    },
    computed:{
      totalPrice:function(){
        var all = 0;
        for(var i=0;i<this.cartProducts.length;i++){
          for(var j=0;j<this.selects.length;j++){
            if(this.selects[j] == this.cartProducts[i].id){
              all += this.cartProducts[i].price * this.cartProducts[i].count;
            }
          }
        }
        // console.log(all);
        return(all * 100)
      }
    },
    created:function(){
      // console.log(this.$store.state.isLogin)
      this.$axios.get('http://192.168.1.6/jingdongBack/08getUserCart2.php?uid=' + this.$store.state.userId)
      .then((e)=>{
        // console.log(e.data.data);
        let arr = [];
        for(let i=0;i<e.data.data.length;i++){
          var obj = {
            id:parseFloat(e.data.data[i].Id),
            type:e.data.data[i].productDetail,
            title:e.data.data[i].name,
            price:parseFloat(e.data.data[i].price),
            img:e.data.data[i].img,
            count:parseInt(e.data.data[i].count),
            pid:parseInt(e.data.data[i].pid),
            uid:parseInt(e.data.data[i].uid)
          }
          arr.push(obj);
        }

        this.cartProducts = arr;
        if(this.selects.length == this.cartProducts.length){
          this.allchecked = true;
        }else{
          this.allchecked = false;
        }
      })
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
    box-sizing: border-box;
    width: 100%;
    height: 100%;
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
    .delshade{
      position: fixed;
      z-index: 200;
      width:100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.7);
      .delbox{
        position: fixed;
        background-color: white;
        width: 70%;
        height: 5rem;
        left: 15%;
        top: 50%;
        margin-top: -2.5rem;
        border-radius: 0.15rem;
        .deltext{
          font-size: 0.72rem;
          text-align: center;
          line-height: 3.5rem;
          height: 3.5rem;
        }
        button{
          width: 50%;
          height: 1.5rem;
          border: 1px solid rgb(95, 95, 95);
          background-color: white;
          font-size: 0.72rem;
          box-sizing: border-box;
          &.delsure{
            border-bottom-left-radius: 0.15rem;
          }
          &.delcancle{
            border-bottom-right-radius: 0.15rem;
          }
        }
      }
    }
  }
</style>