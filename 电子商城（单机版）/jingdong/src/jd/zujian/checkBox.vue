<template>
    <div id="checkbox">
        <i class="fa" :class="xieyi ? 'fa-check-circle' : 'fa-circle-o'" aria-hidden="true" @click="changeCheck"></i>
        
    </div>
</template>
<script>   
       export default {
           data(){
               return {
                   xieyi:false
               }
           },
           props:{
               value:{//这里的value不能起别的名字，它绑定的就是前面v-model绑定的value
                   type:Boolean,
                   default:false
               }
           },
           methods:{
               changeCheck:function(){
                   this.xieyi = !this.xieyi;
                   this.$emit('input',this.xieyi);
               }
           },
           created:function(){
               this.xieyi = this.value;
           },
           watch:{
               value:function(){
                   this.xieyi = this.value;
               }
           }
	
	}
</script>
<style lang="less" scoped>
    #checkbox{
        color: red;
    }
</style>
