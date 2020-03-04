<template>
    <div id="topbar">
       <div class="back" ><i class="fa fa-bars" aria-hidden="true"></i></div>
       <div class="center">
           <slot></slot>
       </div>
       <div class="menu"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></div>
    </div>
</template>
<script>   
    export default {
	methods:{
        goback:function(){
            // console.log(this.$router);
            this.$router.go(-1);
        }
    }
}
</script>
<style lang="less" scoped>
    #topbar{
        width: 100%;
        background: white;
        z-index: 10;
        display: flex;
        font-size: 0.32rem;
        text-align: center;
        height: 0.88rem;
        line-height: 0.88rem;
        position: fixed;
        top:0;
        .back,.menu{
            font-size: 0.36rem;
            width: 0.8rem;
        }
        .center{
            flex:1;
        }
    }
</style>