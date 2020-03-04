<template>
    <div id="commentary" @click="com = false">
        <div class="title">商品评论</div>
        <div class="subForm">
            <form action="">
                <textarea name="" id="commentText" cols="" rows="" placeholder="请写下你的评论"></textarea>
                <input type="button" @click="subNewComment" value="提交">
            </form>
        </div>
        <div class="noComment" v-if="noComment">暂无评论</div>
        <div class="comment" v-for="(item,index) in commentaryList" :key="index">
            <img class="headImg" :src="item.src" alt="">
            <div class="commentUser clearfix">{{item.name}}<span class="answer right" @click.self="answer1(item,index)">回复</span></div>
            <div class="commentText">{{item.commentary}}</div>
            <div class="commentReplay" v-for="(i,j) in item.CList" :key="j">
                <img class="replayImg" :src="i.src" alt="">
                <div class="replayUser">{{i.name}}</div>
                <div class="replayMaster clearfix">回复{{i.commentUser}}<span class="answer right" @click.self="answer2(i,j,index)">回复</span></div>
                <div class="replayText">{{i.commentary}}</div>
            </div>
            <textarea name="" id="replaycomment" ref="replaycomment" cols="" rows="" v-if="index == commentIndex && com" @click="preventBubbling"></textarea>
            <button class="subReplayComment" @click="subReplayComment" v-if="index == commentIndex && com">回复评论</button>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            commentaryList:[],
            comlist:[],
            linshi:[],
            noComment:true,
            commentIndex:0,
            com:false,
            temporary:{}
        }
    },
    methods:{
        preventBubbling(){
            event.stopPropagation();
        },
        subReplayComment(){
            event.stopPropagation();
            this.com = false;
            let tim = new Date();
            let year = tim.getFullYear();
            let month = tim.getMonth() + 1;
            let day = tim.getDate();
            let hour = tim.getHours();
            let mint = tim.getMinutes();
            console.log(this.temporary);

            let params = new URLSearchParams();
            params.append('pid', this.$route.params.id);
            params.append('uid', localStorage.getItem('userId'));
            params.append('commentary', document.getElementById('replaycomment').value);
            params.append('time', year+'-'+month+'-'+day+' '+hour+':'+mint);
            params.append('reply', '1');
            params.append('replayId', this.temporary.Id);
            params.append('replayTid', this.temporary.replayTid ? this.temporary.replayTid : this.temporary.Id);
            this.$axios.post('http://192.168.1.6/jingdongBack/14addComment.php',params)
            .then(e=>{
                // console.log(e.data);
                this.$axios.get('http://192.168.1.6/jingdongBack/04comment.php?pid=' + this.$route.params.id).then((response) => {
                    // console.log(response.data.data);
                    this.comlist = response.data.data;
                })
            }).catch(err=>{
                // console.log(err)
            })
        },
        answer1(item,index){
            event.stopPropagation();//阻止最外层的点击事件触发
            this.commentIndex = index;
            this.com = true;
            this.temporary = item;            
        },
        answer2(i,j,index){
            event.stopPropagation();//阻止最外层的点击事件触发
            this.commentIndex = index;
            this.com = true;
            this.temporary = i;
        },
        subNewComment(){
            let tim = new Date();
            let year = tim.getFullYear();
            let month = tim.getMonth() + 1;
            let day = tim.getDate();
            let hour = tim.getHours();
            let mint = tim.getMinutes();
            
            let params = new URLSearchParams();
            params.append('pid', this.$route.params.id);
            params.append('uid', localStorage.getItem('userId'));
            params.append('commentary', document.getElementById('commentText').value);
            params.append('time', year+'-'+month+'-'+day+' '+hour+':'+mint);
            params.append('reply', '0');
            params.append('replayId', null);
            params.append('replayTid', null);

            document.getElementById('commentText').value = '';
            this.$axios.post('http://192.168.1.6/jingdongBack/14addComment.php',params)
            .then(e=>{
                // console.log(e.data);
                this.$axios.get('http://192.168.1.6/jingdongBack/04comment.php?pid=' + this.$route.params.id).then((response) => {
                    // console.log(response.data.data);
                    this.comlist = response.data.data;
                })
            }).catch(err=>{
                // console.log(err)
            })
        }
    },
    created(){
        this.$axios.get('http://192.168.1.6/jingdongBack/04comment.php?pid=' + this.$route.params.id).then((response) => {
            this.comlist = response.data.data;
        })
    },
    watch:{
        comlist(newVal){
            let lscom = [];
            let ls = [];
            if(newVal){
                this.noComment = false;
                for(let i=0;i<newVal.length;i++){
                    if(newVal[i].reply == 0){
                        let aaa = JSON.stringify(newVal[i]);
                        let bbb = JSON.parse(aaa)
                        lscom.push(bbb);
                    }else{
                        ls.push(newVal[i]);
                    }
                }
                for(let i=0;i<ls.length;i++){
                    for(let j=0;j<newVal.length;j++){
                        if(ls[i].replayId == newVal[j].Id){
                            ls[i].commentUser = newVal[j].name
                        }
                    }
                }
                for(let i=0;i<lscom.length;i++){
                    lscom[i].CList = [];
                    for(let j=0;j<ls.length;j++){
                        if(lscom[i].Id == ls[j].replayTid){
                            lscom[i].CList.push(ls[j]);
                        }
                    }
                }
                this.commentaryList = lscom;
            }else{
                this.noComment = true;
            }
        }
    },
    updated(){
        console.log(this.commentIndex);
        console.log(this.com);
        if(this.com){
            document.getElementById('replaycomment').focus();
            document.documentElement.scrollTop = document.getElementById('replaycomment').offsetTop - 200;
        }
    }
}
</script>
<style lang="less" scoped>
#commentary{
    overflow: hidden;
    zoom: 1;
    padding: 0.25rem;
    padding-top: 0.1rem;
    box-sizing: border-box;
    background-color: white;
    .title{
        font-size: 0.44rem;
        padding-bottom:0.1rem;
        font-weight: 400; 
    }
    .subForm{
        form{
            text-align: center;
            height: 3.7rem;
            textarea{
                display: block;
                width: 100%;
                height: 2.5rem;
                border-radius: 0.1rem;
                font-size: 0.36rem;
                border:1px solid red;
                box-sizing: border-box;
            }
            input{
                display: block;
                margin: 0.2rem auto 0.4rem;
                font-size: 0.36rem;
                width: 1rem;
                border-radius: 0.05rem;
                border: none;
                background-color: red;
                color: white;
            }
        }
    }
    .comment{
        margin-bottom: 0.25rem;
        padding-bottom: 0.25rem;
        border-bottom:1px solid #ddd;
        .commentUser{
            font-size: 0.4rem;
            height: 1.2rem;
            line-height: 1.2rem;
            font-weight: bold;
            margin-left: 1.4rem;
            .answer{
                height: 0.4rem;
                width: 0.8rem;
                text-align: center;
                line-height: 0.4rem;
                margin:0.4rem 0.2rem;
                font-size: 0.3rem;
                border: 1px solid red;
                box-sizing: border-box;
                color: red;
                font-weight: 500;
            }
        }
        .headImg{
            float: left;
            width: 1.2rem;
            height: 1.2rem;
            border-radius: 50%;
        }
        .commentText{
            font-size: 0.32rem;
        }
        .commentReplay{
            margin-left: 0.7rem;
            overflow: hidden;
            zoom: 1;
            .replayImg{
                float: left;
                width: 0.8rem;
                height: 0.8rem;
                border-radius: 50%;
            }
            .replayUser{
                float: left;
                font-size: 0.30rem;
                font-weight: bold;
                height: 0.8rem;
                line-height: 0.8rem;
                margin-left: 0.2rem;
                margin-right: 0.1rem;
            }
            .replayMaster{
                font-size: 0.30rem;
                height: 0.8rem;
                line-height: 0.8rem;
                color: #888;
                .answer{
                    height: 0.4rem;
                    width: 0.8rem;
                    text-align: center;
                    line-height: 0.4rem;
                    margin: 0.2rem;
                    font-size: 0.30rem;
                    border: 1px solid red;
                    box-sizing: border-box;
                    color: red;
                }
            }
            .replayText{
                font-size: 0.28rem;
            }
        }
        #replaycomment{
            width: 90%;
            margin: 0 5%;
            display: block;
            height: 2.5rem;
            border-radius: 0.1rem;
            font-size: 0.36rem;
            border:1px solid red;
            box-sizing: border-box;

        }
        .subReplayComment{
            display: block;
            margin: 0.2rem auto 0.4rem;
            font-size: 0.30rem;
            width: 2rem;
            border-radius: 0.05rem;
            border: none;
            background-color: red;
            color: white;
        }
    }
}
</style>