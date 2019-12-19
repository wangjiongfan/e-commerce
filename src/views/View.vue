<template>
    <div id="views">
      <viewtopbar>
        <span class="fa fa-search"></span>
        <input type="search" class="search" placeholder="华硕笔记本"/>
      </viewtopbar>
      <div class="content clear">
        <div ref="aside" class="aside-left left" @touchstart="onStart" @touchmove="onMove" @touchend="onEnd">
          <ul :class="{transform:transform}" :style="{transform:'translateY('+temp+'px)'}" ref='scroll'>
            <li v-for="(item,index) in 40" :key="index" @click="changeItem(index, $event)" :class="choose == index? 'choose':''">分类{{item}}</li>
          </ul>
        </div>
        <div class="aside-right right" @touchstart="onRStart" @touchmove="onRMove" @touchend="onREnd">
          <ul ref="right" :class="{transform:transform}"  :style="{transform:'translateY('+rtemp+'px)'}" >
            <li v-for="(item,index) in list" :key="index" @click="changeItem(index, $event)"  >
              姓名：{{item.name}}，年龄：{{item.age}}
            </li>
          </ul>
        </div>
      </div>
      <navbar></navbar>
    </div>
</template>
<script>
import viewtopbar from "@/jd/zujian/viewtopbar"
import navbar from "@/jd/zujian/navbar"


export default {
    data:function(){
      return{
        choose:0,//选中的文字变红色

        temp:0,//
        start:0,
        end:0, //
        last:0, //

        transform:false,

        rtemp:0,
        rstart:0,
        rend:0,
        rlast:0,

        list:[]

      }
    },
    name:'view',
    components:{
      navbar,
      viewtopbar
    },
    methods:{
      // 左侧分类华东功能
      onStart:function(e){
        this.transform = false;
        // 这里面的e代表手指的触摸事件的属性TouchEvent
        // console.log(e);
        this.start = e.touches[0].clientY;//获取触摸开始时候的手指所在的y轴位置
        // console.log(this.start);
      },
      onMove:function(e){
        this.transform = false;
        // offsetTop是只读属性
        // console.log(this.$ref.scroll.offsetTop)
        // console.log(e.touches[0])
        // console.log(this.$refs.scroll.offsetHeight);
        let he = this.$refs.scroll.offsetHeight - this.$refs.aside.offsetHeight;//获取整个可以拖动的距离（整个ul的高度减外面套着的div的高度）
        this.end = e.touches[0].clientY;//获取手指触摸并移动时的手指坐标
        // console.log(this.end);
        let move  = this.end - this.start + this.last;//last表示相对于div顶部为坐标原点的整个ul顶部的Y轴坐标（往上为负），move表示最终的距离
        if(move > 150){
          move = 150;
        }else if(Math.abs(move) > he + 150){
          move = -(he + 150);
        }
        this.temp = move;
      },
      onEnd:function(e){
        // let move = this.end - this.start + this.last;
        let he = this.$refs.scroll.offsetHeight - this.$refs.aside.offsetHeight;
        
        if(this.temp > 0){// 松手时判断距离是否超过
          this.temp = 0;
        }else if(Math.abs(this.temp) > he){
          this.temp = -he;
        }
        // this.temp = move;
        this.transform = true;
        this.last = this.temp;
        console.log(this.last);
      },
      changeItem:function(ind,e){
        this.choose = ind;
        
        // console.log( this.$refs.scroll.offsetHeight/40);
        // console.log(this.$refs.scroll.offsetHeight/40*ind);
        
        this.temp = -this.$refs.scroll.offsetHeight / 40 * ind;
        let he = this.$refs.scroll.offsetHeight - this.$refs.aside.offsetHeight;
        if(this.temp > 0){// 松手时判断距离是否超过
          this.temp = 0;
        }else if(Math.abs(this.temp) > he){
          this.temp = -he;
        }
        this.transform = true;
        this.last = this.temp;
      },



      // 右侧底部加载更多
      onRStart:function(e){
        this.transform = false;
        console.log(1);
        this.rstart = e.touches[0].clientY;
      },
      onRMove:function(e){
        
        console.log(2);
        this.transform = false;
        let he = this.$refs.right.offsetHeight - this.$refs.aside.offsetHeight;//获取整个可以拖动的距离（整个ul的高度减外面套着的div的高度）
        this.rend = e.touches[0].clientY;//获取手指触摸并移动时的手指坐标
        let move  = this.rend - this.rstart + this.rlast;//last表示相对于div顶部为坐标原点的整个ul顶部的Y轴坐标（往上为负），move表示最终的距离
        if(move > 150){
          move = 150;
        }else if(Math.abs(move) > he + 150){
          move = -(he + 150);
        }
        this.rtemp = move;
      },
      onREnd:function(e){
        console.log(3);
        // let move = this.end - this.start + this.last;
        let he = this.$refs.right.offsetHeight - this.$refs.aside.offsetHeight;
        this.rtemp = this.rtemp > 0 ? 0 : this.rtemp;
        
        if(Math.abs(this.rtemp) > he){
          this.$axios.get("http://leeyiqing.site/school/userlist.php").then((res) => {
            this.list = [...this.list,...res.data];
          })
        }
        
        this.transform = true;
        this.rlast = this.rtemp;
      },
    },
    created:function(){
      this.$axios.get("http://leeyiqing.site/school/userlist.php").then((res) => {
        this.list = res.data;
      })
    }
}
</script>
<style lang="less" scoped>
  #views{
    height: 100%;
    .fa-search{
      color: #888;
    }
    .search{
      border: none;
      outline: none;
      font-size: 0.28rem;
      margin-left: 10px;
      line-height: 0.8rem;
    }
    .content{
      width: 100%;
      height: 100%;
    padding-top: 0.88rem;
    padding-bottom: 1rem;
    box-sizing: border-box;
      overflow: hidden;
      .aside-left{
        width: 23%;
        height: 100%;
        position: relative;
        border-right: 1px solid #aaa;
        box-sizing: border-box;
        ul{
          width: 100%;
          position: absolute;
          top: 0;
          left: 0;
          border-top:1px solid #ccc;
          &.transform{
            transition:all 0.5s
          } 
          li{
            text-align: center;
            font-size: 0.28rem;
            height: 0.72rem;
            line-height: 0.72rem;
            border-bottom:1px solid #ccc; 
          }
        }
      }
      .aside-right{
        width: 77%;
        height: 100%;
        background: yellow;
        ul{
          &.transform{
            transition:all 0.5s
          }
          li{
            font-size: 0.36rem;
            line-height: 1.5rem;
            height: 1.5rem;
          }
        }
      }
    }
  }
  .choose{
    color: red;
  }
</style>