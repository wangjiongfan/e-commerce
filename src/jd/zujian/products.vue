<template>
    <div id="products">
        <ul class="clear">
            <li class="left clear" v-for="(item ,index) in productList" :key="index" @click="jumpToXQ(item.id)">
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
                        name:'拖鞋',
                        price:9.90,
                        img:require('../../assets/img/products/1.jpg')
                    },
                    {
                        id:10012,
                        name:'拖鞋',
                        price:9.90,
                        img:require('../../assets/img/products/2.jpg')
                    },
                    {
                        id:10014,
                        name:'拖鞋',
                        price:9.90,
                        img:require('../../assets/img/products/3.jpg')
                    },
                    {
                        id:10018,
                        name:'拖鞋',
                        price:9.90,
                        img:require('../../assets/img/products/4.jpg')
                    },
                    {
                        id:10010,
                        name:'拖鞋',
                        price:9.90,
                        img:require('../../assets/img/products/5.jpg')
                    },
                    {
                        id:10010,
                        name:'拖鞋',
                        price:9.90,
                        img:require('../../assets/img/products/6.jpg')
                    },
                    {
                        id:10010,
                        name:'拖鞋',
                        price:9.90,
                        img:require('../../assets/img/products/7.jpg')
                    },
                    {
                        id:10010,
                        name:'拖鞋',
                        price:9.90,
                        img:require('../../assets/img/products/8.jpg')
                    },
                    {
                        id:10010,
                        name:'拖鞋',
                        price:9.90,
                        img:require('../../assets/img/products/9.png')
                    },
                    {
                        id:10010,
                        name:'拖鞋',
                        price:9.90,
                        img:require('../../assets/img/products/10.jpg')
                    }
                ]
            }
        },
        created:function(){
            this.$axios.get('http://leeyiqing.site/product.php')//get只是请求方式       如果是一个静态的模拟数据，用这种方式调用需要将json放到public文件夹里
            .then((e) =>{
                // console.log(e)
                this.productList = e.data;
            })
        },
        methods:{
            jumpToXQ:function(id){
                
                // 字符串
                // this.$router.push();

                // 对象
                // this.$router.push({path:'home'})
                // this.$router.push({name:'home'})

                // 带查询参数，变成/shangpin?id=123
                // this.$router.push({path:'shangpin',query:{'id':123}});

                this.$router.push({
                    name:'shangpin',
                    query:{'count':1},//表示在地址url后面加上count=1
                    params:{
                        'id':id,
                        'year':new Date().getFullYear(),
                        'month':new Date().getMonth()+1
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