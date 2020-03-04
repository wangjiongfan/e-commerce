<template>
    <div id="mycomment">
        <returnbar>我的评论</returnbar>
        <div class="mycommentAllInform" v-for="(item,index) in commentList" :key="index">
            <div class="productInform">在&nbsp;{{item.pname}}&nbsp;商品处的评论</div>
            <div class="commentMaster" v-if="item.commentUser"><span>回复</span><span>{{item.commentUser}}</span></div>
            <div class="commentText">{{item.commentary}}</div>
        </div>
    </div>
</template>
<script>
import returnbar from "@/jd/zujian/returnbar"
export default {
    data(){
        return {
            commentList:[]
        }
    },
    components:{
        returnbar
    },
    created(){
        console.log(this.$route.params);
        this.$axios.get('http://192.168.1.6/jingdongBack/06mycomment.php?usId=' + parseInt(localStorage.getItem('userId')))
        .then(e=>{
            console.log(e.data.data);
            this.commentList = e.data.data;
        })
    },
    watch:{
        commentList(newVal){
            console.log(newVal);
        }
    }
}
</script>
<style lang="less" scoped>
#mycomment{
    padding-top: 0.88rem;
    font-size: 0.36rem;
    .mycommentAllInform{
        padding: 0.25rem;
        .productInform{
            font-weight: bold;
        }
        .commentMaster{
            font-weight: bold;
            font-size:0.30rem; 
            color: #999
        }
    }
}
</style>