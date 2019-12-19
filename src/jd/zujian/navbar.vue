<template>
    <div id="navbar">
        <ul >
            <li v-for="(item,index) in list" :key="index">
                <router-link :to="item.path">
                    <img :src="newPath == item.path? item.img_act : item.img" alt=""/>
                    <div :class="newPath == item.path? 'active' : ''" v-text="item.title"></div>
                </router-link>
            </li>
        </ul>
    </div>
</template>
<script>
export default {
    data:function(){
        return{
            list:[
                {
                    title:'首页',
                    img:require("../../assets/img/navbar/home1.png"),
                    img_act:require("../../assets/img/navbar/home.png"),
                    path:"/"
                },
                {
                    title:'分类',
                    img:require("../../assets/img/navbar/view1.png"),
                    img_act:require("../../assets/img/navbar/view.png"),
                    path:"/view"
                },
                {
                    title:'购物车',
                    img:require("../../assets/img/navbar/cart1.png"),
                    img_act:require("../../assets/img/navbar/cart.png"),
                    path:"/cart"
                },
                {
                    title:'我的',
                    img:require("../../assets/img/navbar/mine1.png"),
                    img_act:require("../../assets/img/navbar/mine.png"),
                    path:"/mine"
                }
            ],
            newPath:"/"
        }
    },
    methods:{

    },
    created:function(){
        // $表示vue的系统的属性和方法
        // $router表示项目全局的路由器对象
        // console.log(this.$router);
        // $route表示当前页面的路由
        // console.log(this.$route);
        this.newPath = this.$route.path;


    }
}
</script>

<style lang="less" scoped>
    #navbar{
        position: fixed;
        bottom: 0;
        width:100%;
        text-align: center;
        background-color: #ffffff;
        box-shadow:10px 10px 10px 10px #dbdbdb;
        ul{
            list-style: none;
            li{
                float: left;
                width: 25%;
                font-size: 0.24rem;
                img{
                    display: block;
                    width:36px;
                    height: 36px;
                    margin: 0 auto;
                }
                div{
                    margin-top: -5px;
                    &.active{
                        color:red;
                    }
                }
            }
        }
    }
</style>