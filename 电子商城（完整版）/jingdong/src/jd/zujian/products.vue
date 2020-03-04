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
                productList:[],
                page:1,
                pagesize:6,
                pagescroll:0,
                refurbishBottom:false
            }
        },
        props:{
            refurbish:{
                type:Boolean,
                default:false
            },
            panduan:{
                type:Boolean,
                default:true
            }
        },
        created:function(){
            this.getsort(this.page)
            this.refurbishBottom = this.refurbish;
        },
        watch:{
            refurbish(newVal){
                if(newVal && this.page<6 && !this.panduan){
                    this.page=this.page+1;
                    this.getsort(this.page);
                    this.$emit('refC',false);
                }
            }
        },
        methods:{
            getsort(pag){
                this.$axios.get('http://192.168.1.6/jingdongBack/03getproducts.php?page=' + pag + '&pagesize=' + this.pagesize)
                .then((e) => {
                    var list = e.data.data;
                    // console.log(e.data);
                    for(let i=0;i<list.length;i++){
                        this.productList.push(list[i]);
                    }
                })
                
            },
            jumpToXQ:function(item){
                this.$router.push({
                    name:'shangpin',
                    query:{//表示在地址url后面加上count=1
                        'count':item.count,
                        'price':item.price,
                        'name':item.name
                    },
                    params:{
                        'id':item.Id,
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