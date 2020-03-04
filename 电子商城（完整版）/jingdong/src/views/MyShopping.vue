<template>
    <div id="myshopping">
        <returnbar>订单信息</returnbar>
        <div class="item clear" v-for="(item, index) in myShopList" :key="index">
            <div class="itemImg left"><img :src="item.img" alt=""></div>
            <div class="itemInform left clear">
                <div class="itemName">商品名称：{{item.name}}</div>
                <div class="itemDetail">商品类型：{{item.productDetail}}</div>
                <div class="itemNumber clear">
                    <div class="itemAllPrice left">总价：￥{{parseFloat(item.price)*item.count}}元</div>
                    <div class="itemCount right">商品数量：{{item.count}}</div>
                </div>
            </div>
            
        </div>
    </div>
</template>
<script>
import returnbar from "@/jd/zujian/returnbar"
export default {
    data(){
        return {
            myShopList:[]
        }
    },
    components:{
        returnbar
    },
    name:'myshopping',
    created(){
        this.$axios.get('http://192.168.1.6/jingdongBack/13getMyShopList.php?uid=' + parseInt(localStorage.getItem('userId')))
        .then(e=>{
            // console.log(e.data);
            this.myShopList = e.data.data;
        })
    }
}
</script>
<style lang="less" scoped>
    #myshopping{
        padding-top: 0.88rem;
        .item{
            width: 100%;
            height: 2rem;
            margin-top: 0.2rem;
            background-color: white;
            div{
                font-size: 0.36rem;
            }
            .itemImg{
                width: 1.5rem;
                height: 1.5rem;
                margin-top: 0.25rem;
                margin-left: 0.2rem;
                overflow: hidden;
                img{
                    width: 100%;
                }
            }
            .itemInform{
                width:calc(100% - 1.7rem);
                box-sizing: border-box;
                padding:0.15rem; 
                div{
                    font-size: 0.36rem;
                }
                .itemDetail{
                    font-size: 0.24rem;
                    color: #777;
                }
                .itemNumber{
                    width: 100%;
                    .itemAllPrice{
                        font-size: 0.3rem;
                        color: red;
                    }
                    .itemCount{
                        font-size: 0.3rem;
                    }
                }
            }
        }
    }
</style>