<template>
    <div class="mine">
      <viewtopbar>
        我的
      </viewtopbar>
      <input type="checkbox" v-model="xieyi">阅读并接受注册协议{{xieyi}}<br/>

      <checkbox v-model="xieyi" class="cbox"></checkbox>阅读并接受注册协议{{xieyi}}<br/>

      <input type="checkbox" v-model="xueli" value="高中学历"/>三校生<br/>
      <input type="checkbox" v-model="xueli" value="大专学历"/>大专<br/>
      <input type="checkbox" v-model="xueli" value="本科学历"/>本科<br/>
      <input type="checkbox" v-model="xueli" value="硕士学历"/>研究生<br/>
      <input type="checkbox" v-model="xueli" value="博士学历"/>博士<br/>
      {{xueli}}
      <br/>
      <!-- v-model的优先级比value高 -->
      
      <navbar></navbar>
    </div>
</template>
<script>
import navbar from "@/jd/zujian/navbar"
import viewtopbar from "@/jd/zujian/viewtopbar"
import checkbox from "@/jd/zujian/checkBox"

export default {
    data:function(){
      return{
        xieyi:true,
        isCheck:false,
        xueli:[]
      }
    },
    name:'mine',
    components:{
      navbar,
      viewtopbar,
      checkbox
    }
}
</script>
<style lang="less" scoped>
  .mine{
    padding-top: 0.88rem;
    font-size: 0.36rem;
    .cbox{
      display: inline-block;
    }
  }
</style>