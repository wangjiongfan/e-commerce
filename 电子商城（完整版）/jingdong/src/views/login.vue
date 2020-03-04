<template>
    <div id="login">
        <returnbar>登录</returnbar>
        <div class="input_user">
            <input type="text" v-model="username" placeholder="用户名"><i class="fa fa-times close1" v-show="username.length > 0" aria-hidden="true" @click="username = ''"></i>
            <input :type="showPwd ? 'text' : 'password'" v-model="password" name="" id="" placeholder="请输入密码">
            <div class="pwd">
                <i class="fa fa-times close2" aria-hidden="true" v-show="password.length > 0"  @click="password = ''"></i>
                <i class="fa " :class="showPwd ? 'fa-eye' : 'fa-eye-slash'" aria-hidden="true" @click="showPwd = !showPwd"></i>
                <span>忘记密码</span>
            </div>
            <button :class="username.length > 0 && password.length > 0 ? '' : 'disable'" @click="goLogin">登录</button>
        </div>
        
    </div>
</template>
<script> 
import returnbar from "@/jd/zujian/returnbar"  
    export default {
        data:function(){
            return {
                showPwd:false,
                hasVal:false,
                username:'',
                password:''
            }
        },
        components:{
            returnbar
        },
        watch:{
            username:function(newVal){
                this.hasVal = false;
                if(newVal.length > 0 && this.password.length > 0){
                    this.hasVal = true;
                }
            },
            password:function(newVal){
                this.hasVal = false;
                if(newVal.length > 0 && this.username.length > 0){
                    this.hasVal = true;
                }
            }
        },
        methods:{
            goLogin:function(){
                if(this.hasVal){
                    let poster = 'usname=' + this.username + '&password=' + this.password;

                    this.$axios.get('http://192.168.1.6/jingdongBack/01login.php?' + poster)
                    .then((e)=>{
                        if(e.data.msg == 'error'){
                            alert('用户名密码错误')
                            console.log(e.data);
                        }else{
                            console.log(e.data);
                            localStorage.setItem('username',e.data.list.name);
                            localStorage.setItem('userId',e.data.list.Id);
                            this.$store.commit('changeLogin',true,true)//后面的true传到store下的index中的changeLogin函数的第二个参数
                            this.$router.push('mine');
                            this.setCookie('username',this.username,'s600');
                        }
                    }).catch((err)=>{
                        console.log(err);
                    })
                }else {
                    return false;
                }
            },

            // 以下代码百度上搜js cookie
            getCookie(name){
                var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
                if(arr=document.cookie.match(reg))
                return unescape(arr[2]);
                else
                return null;
            },
            setCookie(name,value,time){
                var strsec = this.getsec(time);
                var exp = new Date();
                exp.setTime(exp.getTime() + strsec*1);
                document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
            },
            getsec(str) {
                // alert(str);
                var str1=str.substring(1,str.length)*1;
                var str2=str.substring(0,1);
                if (str2=="s")
                {
                return str1*1000;
                }
                else if (str2=="h")
                {
                return str1*60*60*1000;
                }
                else if (str2=="d")
                {
                return str1*24*60*60*1000;
                }
            }
        }
	}
</script>
<style lang="less" scoped>
#login{
    padding-top: 0.88rem;
    font-size: 0.36rem;
    .input_user{
        position: relative;
        text-align: center;
        input{
            display: block;
            width: 80%;
            margin: 0.4rem auto;
            font-size: 0.32rem;
            line-height: 0.7rem;
            border:none;
            border-bottom: 1px solid #d9d9d9;
            background-color: rgba(0, 0, 0, 0);
        }
        i{
            padding: 10px;
        }
        .close1{
            position: absolute;
            top:0;
            right: 0.8rem;
            color:#666;
        }
        .pwd{
            position: absolute;
            top: 1rem;
            right: 0.9rem;
            color: #666;
            .close2{
                padding-right: 0;
            }
            span{
                font-size: 0.28rem;
                padding-left: 0.1rem;
                border-left: 1px solid #666;
            }
        }
        button{
            margin: 0.4rem auto;
            width: 80%;
            background: red;
            height: 1rem;
            border-radius: 0.5rem;
            color: white;
            border: none;
            &.disable{
                opacity: 0.3;
            }
        }
    }
    
}
</style>