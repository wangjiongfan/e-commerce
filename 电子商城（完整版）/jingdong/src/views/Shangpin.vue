<template>
    <div id="shangpin">
        <returnbar>
            <ul class="classify clear">
                <!-- <li :class="{active:item.isShow}" class="left" v-for="(item , index) in menus" :key="index" @click="changeItem(index)">
                    <i class="fa fa-map-marker" aria-hidden="true" v-show="item.isShow"></i>
                    <span v-text="item.title"></span>
                </li> -->
                <li :class="navIndex == index ? 'active' :''" v-for="(item ,index) in lists" :key="index" @click="changeScroll(index)">
                    <i class="fa fa-map-marker" aria-hidden="true" v-show="navIndex == index"></i>
                    <span v-text="item"></span>
                </li>
            </ul>
        </returnbar>
        <div ref="sp"></div>
        <pro-banner :imglist="imglist"></pro-banner>

        <ul class="detail">
            <li class="price">￥{{price}}</li>
            <li class="pname">商品名称：{{pname}}</li>
            <li class="jieshao">商品介绍：{{jieshao}}</li>
            <li class="youhui">优惠活动：{{youhui}}</li>
            <li class="count">库存数量：{{count}}</li>
        </ul>

        <div ref="pj" id="pj" class="pj">
            <commentary></commentary>
        </div>
        <div ref="tj" id="tj" class="tj" style="width:100%;height:1000px;background:yellow">推荐</div>
        <div ref="xq" id="xq" class="xq" style="width:100%;height:1000px;background:orange">详情</div>

        <protabbar @click="onOpen"></protabbar>
        
        
        <sku :shows="isSku" :price="price" :productDetail="productDetail" :productDetailLength="productDetailLength" @clicks="isFlg = false" @click1="isSku = false"></sku>
        
        <div v-show="isFlg" class="mask" @click.self="onClose" @touchmove.prevent></div>
    </div>
</template>
<script>
        import returnbar from "@/jd/zujian/returnbar"
        import ProBanner from "@/jd/zujian/proBanner"
        import protabbar from "@/jd/zujian/protabbar"
        import sku from "@/jd/zujian/sku"
        import commentary from "@/jd/zujian/commentary"
        export default {
           data(){
               return {
                   imgurl:'',
                   pid:0,
                   pname:'',
                   price:'',
                   youhui:'',
                   jieshao:'',
                   count:'',
                   imglist:[require("../assets/img/probanner/1.jpg"),require("../assets/img/probanner/2.jpg"),require("../assets/img/probanner/3.jpg"),require("../assets/img/probanner/4.png"),require("../assets/img/probanner/5.jpg")],
                   lists:['商品','评价','详情','推荐'],
                   navIndex:0,
                   menus:[],
                   isFlg:false,
                   isSku:false,
                   productDetail:[],
                   productDetailLength:0
               }
           },
           mounted:function(){
               document.documentElement.scrollTop = 0;
               this.menus = [
                   {
                       el:this.$refs.sp,
                       index:0
                    },
                    {
                        el:this.$refs.pj,
                       index:1
                    },
                    {
                        el:this.$refs.tj,
                       index:3
                    },
                    {
                        el:this.$refs.xq,
                       index:2
                    }
                ]
           },
           components:{
               returnbar,
               ProBanner,
               protabbar,
               sku,
               commentary
           },
           methods:{
               onOpen:function(){
                    this.isFlg = true;
                    this.isSku = true;
               },
               onClose:function(){
                   this.isSku = !this.isSku;
               },
               closeMask:function(){
                   this.isFlg = false;
                   this.isSku = false;
               },
                changeScroll:function(ind){
                    this.navIndex = ind;
                    var pjy = document.querySelector('#pj')
                    var end = 0;
                    switch(ind){
                        case 0:
                            end = this.$refs.sp.offsetTop - 44;
                            break;
                        case 1:
                            end = this.$refs.pj.offsetTop - 44;
                            break;
                        case 2:
                            end = this.$refs.xq.offsetTop - 44;
                            break;
                        case 3:
                            end = this.$refs.tj.offsetTop - 44;
                            break;
                        default:
                            break;
                    }

                    // document.documentElement.scrollTop = end;  //瞬间切换

                    // 动画切换
                    var start = document.documentElement.scrollTop || document.body.scrollTop;

                    var count = 40;//滑动的步数
                    
                    var temp = end - start;//滑动的距离
                    var step = temp / count;//每次滑动的距离

                    var timer = setInterval(() => {
                        count--;
                        document.documentElement.scrollTop += step;
                        if(count <= 0){
                            document.documentElement.scrollTop = end;
                            clearInterval(timer);
                        }
                    },10/step*1.5)
                }
           },
           created:function(){
               this.pid = this.$route.params.id;
               this.count = this.$route.query.count;//query是url的属性的意思
               this.$axios.get('http://192.168.1.6/jingdongBack/02getproductInformation.php?id=' + this.$route.params.id).then((response) => {
                //    console.log(response);
                   var data = response.data.data[0];
                   this.pname = data.name;
                   this.price = data.price;
                   this.youhui = data.youhui;
                   this.jieshao = data.content;
               })
                this.$axios.get('http://192.168.1.6/jingdongBack/11getproductSku.php?id=' + this.$route.params.id)
                .then((e)=>{
                    // console.log(e.data.data);
                    var allclassify = []
                    for(let i=0;i<e.data.data.length;i++){
                        allclassify.push(e.data.data[i].detailKey);
                    }
                    function unique (arr) {
                        return Array.from(new Set(arr))
                    }
                    var strArr = unique(allclassify);
                    // console.log(strArr);
                    for(let i=0;i<strArr.length;i++){
                        let lingshi = {
                            detailKey:strArr[i],
                            detailId:i,
                            selects:[]
                        }
                        for(let j=0;j<e.data.data.length;j++){
                            if(e.data.data[j].detailKey == strArr[i]){
                                lingshi.selects.push(e.data.data[j].detailVal);
                                lingshi.img = e.data.data[j].img;
                            }
                        }
                        this.productDetail.push(lingshi);
                    }
                    this.productDetailLength = this.productDetail.length;
                })
                window.onscroll = () => {
                    var stop = document.documentElement.scrollTop || document.body.scrollTop;
                    this.menus.forEach((item,index) => {
                        if((stop + 54) > item.el.offsetTop ){//stop后面加上44后再加一个小于50的数值，避免发生误差
                           this.navIndex = item.index;
                        }
                   })
               }
           }
	}
</script>
<style lang="less" scoped>
    #shangpin{
        padding-top: 0.88rem;
        height: 100%;
        .detail{
            padding: 0.25rem;
            .price{
                color: red;
                font-weight: bold;
                font-size: 0.40rem;
            }
            .pname{
                font-weight: bold;
                font-size: 0.40rem;
            }
        }
    }
    li{
        font-size: 0.32rem;
    }
    .classify{
        width: 90%;
        margin: 0 auto;
        display: flex;
        li{
            flex: 1;
            font-size: 0.32rem;
            width: 25%;
            .fa-map-marker{
                margin-right: 0.1rem;
            }
            &.active{
                color: red;
            }
        }
    }
    .mask{
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
            position: fixed;
            top: 0;
            z-index: 100
            }
    
</style>