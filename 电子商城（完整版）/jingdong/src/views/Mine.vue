<template>
    <div class="mine">
      <viewtopbar>我的</viewtopbar>
      <div class="info ">
        <div class="clear">
          <div class="left headImg" :style="headImg" @click="clickImg"></div>
          <span class="left">{{username}}</span>
        </div>
        <input type="file" name="" id="file" value="" hidden="" @change="chooseImg($event)"/>
      </div>
      <div class="cell">
        个人信息
      </div> 
      <div class="cell" @click="gotoMyshopping">
        订单信息
      </div>
      <div class="cell" @click="gotoMycomment">
        我的评论
      </div> 
      <div class="cell">
        设置
      </div>
      <div class="cell" @click="logout">
        退出登录
      </div>
      <navbar></navbar>
    </div>
</template>
<script>
import navbar from "@/jd/zujian/navbar"
import viewtopbar from "@/jd/zujian/viewtopbar"

export default {
    data:function(){
      return{
        xieyi:true,
        isCheck:false,
        // username:this.getCookie('username'),
        username:localStorage.getItem('username'),
        password:localStorage.getItem('password'),
        headImg:'',
        userId:0
      }
    },
    name:'mine',
    components:{
      navbar,
      viewtopbar
    },
    created(){
      this.$axios.get('http://192.168.1.6/jingdongBack/05person.php?usname=' + this.username)
      .then((e)=>{
        console.log(e.data.list);
        this.headImg = "background-image:url(" + e.data.list.src + ")";
        this.userId = parseInt(e.data.list.Id);
        console.log(this.userId);
      })
    },
    methods:{
      clickImg(){
        console.log(111);
        document.getElementById('file').click();
      },
      chooseImg(e){
        console.log(e);
        let formData = new FormData();
        formData.append('file',e.target.files[0]);
        formData.append('uid',localStorage.getItem('userId'));
        console.log(formData.get('file')) // FormData私有类对象，访问不到，可以通过get判断值是否传进去
        let config = {
          headers: {'Content-Type': 'multipart/form-data'}
        }
        // 添加请求头
        this.$axios.post('http://192.168.1.6/jingdongBack/15upload.php', formData, config)
        .then(response => {
          console.log(response.data)
          this.headImg = "background-image:url(" + response.data + ")";
        })
      },
      gotoMycomment(){
        this.$router.push({
          name:'mycomment',
          params:{
            'usname':this.username,
            'usId':this.userId
          }
        });
      },
      gotoMyshopping(){
        this.$router.push({
          name:'myshopping',
          params:{
            'usname':this.username,
            'usId':this.userId
          }
        });
      },
      logout(){
        this.$store.commit('changeLogin',false);
        this.$router.push('/');
      },
      getCookie(name){
        var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
        if(arr=document.cookie.match(reg))
        return unescape(arr[2]);
        else
        return null;
      }
    }
}
</script>
<style lang="less" scoped>
  .mine{
    padding-top: 0.88rem;
    font-size: 0.36rem;
    width: 100%;
    .info{
      background-color: rgb(58, 58, 58);
      height: 4rem;
      width: 100%;
      padding-top: 1rem;
      box-sizing: border-box;
      .clear{
        div{
          width: 2rem;
          height: 2rem;
          border-radius: 50%;
          background-color: skyblue;
          border: 3px solid white;
          line-height: 2rem;
          text-align: center;
          margin-right: 0.2rem;
          margin-left: 0.2rem;
          box-sizing: border-box;
        }
        .headImg{
          background-size: cover;
        }
        span{
          height: 2rem;
          line-height: 2rem;
          margin-left: 0.2rem;
          color: white;
        }
      }
    }
    .cell{
      width: 100%;
      height: 0.88rem;
      background: #d9d9d9;
      margin: 0.1rem 0;
      line-height: 0.88rem;
      font-size: 0.32rem;
      padding-left: 1rem;
      box-sizing: border-box;
    }
  }
</style>