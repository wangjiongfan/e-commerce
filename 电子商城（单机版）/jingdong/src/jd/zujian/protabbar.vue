<template>
    <div id="protabbar">
        <ul>
            <li class="clear" v-for="(item,index) in gongneng" :key="index" @click="jumpToGWC(item.url)">
                    <i :class="item.icon" aria-hidden="true"></i>
                    <div v-text="item.title"></div>
            </li>
        </ul>
        <div class="gouwuche" @click="onOpen">加入购物车</div>
        <div class="buy">立即购买</div>
    </div>
</template>
<script>   
       export default {
           data(){
               return {
                   gongneng:[
                       {
                           icon:'fa fa-commenting',
                           title:'联系客服',
                           url:''
                       },
                       {
                           icon:'fa fa-university',
                           title:'进店',
                           url:''
                       },
                       {
                           icon:'fa fa-shopping-cart',
                           title:'购物车',
                           url:'/cart'
                       }
                   ]
               }
           },
            methods:{
                jumpToGWC:function(url){
                    if(url){
                        this.$router.push(url);
                    }else{
                        return false;
                    }
                    
                },
                onOpen:function(){
                   this.$emit('click',true);
               }
            }
	}
</script>


<style lang="less" scoped>
#protabbar{
    display: flex;
    height: 1rem;
    width: 100%;
    position: fixed;
    bottom: -1px;
    z-index: 12;
    background-color: white;
    ul{
        width: 42%;
        display: flex;
        justify-content:space-around;
        li{
            width: 33.33%;
            height: 1rem;
            text-align: center;
            display: flex;
            flex-direction: column;
            padding-top: 0.15rem;
            padding-bottom: 0.15rem;
            box-sizing: border-box;
            .fa{
                flex: 1;
                font-size: 0.34rem;
                color: #999;
            }
            div{
                font-size: 0.26rem;
                color: #999;
            }
        }
    }
    .gouwuche,.buy{
        font-size: 0.34rem;
        width: 29%;
        text-align: center;
        color: white;
        line-height: 1rem;
    }
    .gouwuche{
        background-color: orange;
    }
    .buy{
        background-color: red;
    }

}

</style>
