<template>
    <div id="products">
        <ul class="clear">
            <li class="left clear" v-for="(item ,index) in productList" :key="index" @click="jumpToXQ(item)">
                <div class="picture">
                    <img :src="item.img" alt="">
                </div>
                <div class="explain title" v-text="item.name"></div>
                <div class="explain left">￥{{item.price}}</div>
                <div class="explain right">看相似</div>
            </li>
        </ul>
    </div>
</template>
<script>   
    export default {
        data(){
            return {
                productList:[
                    {
                        id:10001,
                        name:'电脑',
                        price:5799.90,
                        img:require('../../assets/img/products/1.jpg'),
                        youhui:'满3000减500',
                        content:'这是一台非常顺畅的电脑'
                    },
                    {
                        id:10012,
                        name:'米花糖',
                        price:9.90,
                        img:require('../../assets/img/products/2.jpg'),
                        youhui:'买一送一',
                        content:'非常好吃的米花糖'
                    },
                    {
                        id:10014,
                        name:'拖鞋',
                        price:6.90,
                        img:require('../../assets/img/products/3.jpg'),
                        youhui:'买二送一',
                        content:'这是非常舒适的拖鞋'
                    },
                    {
                        id:10018,
                        name:'书本',
                        price:22.00,
                        img:require('../../assets/img/products/4.jpg'),
                        youhui:'满50减10元',
                        content:'这是非常有用的书本'
                    },
                    {
                        id:10019,
                        name:'洗洁精',
                        price:11.90,
                        img:require('../../assets/img/products/5.jpg'),
                        youhui:'买一送一',
                        content:'这是很好用的洗洁精'
                    },
                    {
                        id:10020,
                        name:'华为手机',
                        price:3499.50,
                        img:require('../../assets/img/products/6.jpg'),
                        youhui:'满3000减500',
                        content:'这是一台非常顺畅的电脑'
                    },
                    {
                        id:10021,
                        name:'铅笔',
                        price:9.90,
                        img:require('../../assets/img/products/7.jpg'),
                        youhui:'满50减20',
                        content:'非常流畅的铅笔'
                    },
                    {
                        id:10022,
                        name:'卫生纸',
                        price:16.90,
                        img:require('../../assets/img/products/8.jpg'),
                        youhui:'买三送一',
                        content:'这是用起来非常舒适的卫生纸'
                    },
                    {
                        id:10023,
                        name:'笔记本',
                        price:4.30,
                        img:require('../../assets/img/products/9.png'),
                        youhui:'买2送1',
                        content:'这是超好用的笔记本'
                    },
                    {
                        id:10024,
                        name:'计算器',
                        price:56.90,
                        img:require('../../assets/img/products/10.jpg'),
                        youhui:'买二送一',
                        content:'这是一个很好用的计算器'
                    }
                ]
            }
        },
        methods:{
            jumpToXQ:function(item){
                this.$router.push({
                    name:'shangpin',
                    query:{'count':1},//表示在地址url后面加上count=1
                    params:{
                        'id':item.id,
                        'year':new Date().getFullYear(),
                        'month':new Date().getMonth()+1,
                        'name':item.name,
                        'price':item.price,
                        'youhui':item.youhui,
                        'content':item.content
                    }
                });
                
            }
        }
    }
</script>
<style lang="less" scoped>
#products{
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
    ul{
        width: 100%;
        li{
            width: 48.4%;
            margin:0.8%;
            // box-sizing: border-box;
            background-color: white;
            .picture{
                width: 100%;
                height: 4rem;
                overflow: hidden;
                img{
                display: block;
                width: 100%;
                }
                

            }
            .explain{
                font-size: 0.28rem;
                margin-left: 0.1rem;
                // height: 0.32rem;

                &.left{
                    color:red;
                    font-weight: 500;
                    font-size: 0.32rem;
                    margin-left: 0.1rem;
                    letter-spacing: -0.01rem;
                }
                &.right{
                    font-size: 0.24rem;
                    padding:0 4px;
                    box-sizing: border-box;
                    color: #999;
                    border:1px solid #999;
                    margin-right: 0.1rem;
                }
            }
        }
    }
}
.title{
    height: 0.44rem;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
</style>