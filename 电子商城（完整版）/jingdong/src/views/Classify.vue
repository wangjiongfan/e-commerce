<template>
    <div id="classify">
      <viewtopbar>
        <span class="fa fa-search"></span>
        <input type="search" class="search" placeholder="华硕笔记本"/>
      </viewtopbar>
      <div class="content clear">
        <div ref="aside" class="aside-left left" @touchstart="onStart" @touchmove="onMove" @touchend="onEnd">
          <ul :class="{transform:transform}" :style="{transform:'translateY('+temp+'px)'}" ref='scroll'>
            <li v-for="(item,index) in classifyList" :key="index" @click="changeItem(index, $event)" :class="choose == index? 'choose':''">{{item}}</li>
          </ul>
        </div>
        <div class="aside-right right" @touchstart="onRStart" @touchmove="onRMove" @touchend="onREnd">
          <ul ref="right" class="clear" :class="{transform:transform}"  :style="{transform:'translateY('+rtemp+'px)'}" >
            <li class="left" v-for="(item,index) in list" :key="index" @click="toshangpin(item)">
              <div class="productImg">
                <img :src="item.img" alt="">
              </div>
              <div class="productName">{{item.name}}</div>
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
        classifyList:['食品药品','穿着用品','数码产品','书籍书本','家用电器','学习用品','家务用具','其他分类','分类9','分类10','分类11','分类12','分类13','分类14','分类15','分类16','分类17','分类18','分类19','分类20','分类21','分类22','分类23','分类24','分类25','分类26','分类27','分类28','分类29','分类30','分类31','分类32'],
        choose:0,//选中的文字变红色
        temp:0,
        start:0,
        end:0,
        last:0,
        transform:false,
        rtemp:0,
        rstart:0,
        rend:0,
        rlast:0,
        list:[]
      }
    },
    name:'classify',
    components:{
      navbar,
      viewtopbar
    },
    created:function(){
      this.$axios.get("http://192.168.1.6/jingdongBack/07classify.php?cid=1").then((res) => {
        this.list = res.data.data;
        console.log(this.list)
      })
    },
    methods:{
      toshangpin(item){
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
        })
      },
      // 左侧分类华东功能
      onStart:function(e){
        // 这里面的e代表手指的触摸事件的属性TouchEvent
        this.transform = false;
        this.start = e.touches[0].clientY;//获取触摸开始时候的手指所在的y轴位置
        // console.log(this.start);
      },
      onMove:function(e){
        this.transform = false;
        // offsetTop是只读属性
        let he = this.$refs.scroll.offsetHeight - this.$refs.aside.offsetHeight;//获取整个可以拖动的距离（整个ul的高度减外面套着的div的高度）
        this.end = e.touches[0].clientY;//获取手指触摸并移动时的手指坐标
        let move  = this.end - this.start + this.last;//last表示相对于div顶部为坐标原点的整个ul顶部的Y轴坐标（往上为负），move表示最终的距离
        if(move > 150){
          move = 150;
        }else if(Math.abs(move) > he + 150){
          move = -(he + 150);
        }
        this.temp = move;
      },
      onEnd:function(e){
        let he = this.$refs.scroll.offsetHeight - this.$refs.aside.offsetHeight;
        
        if(this.temp > 0){// 松手时判断距离是否超过
          this.temp = 0;
        }else if(Math.abs(this.temp) > he){
          this.temp = -he;
        }
        this.transform = true;
        this.last = this.temp;
      },
      changeItem:function(ind,e){
        this.$axios.get("http://192.168.1.6/jingdongBack/07classify.php?cid=" + (ind + 1)).then((res) => {
          this.list = res.data.data;
          console.log(this.list);
          this.rtemp = 0;
          this.rstart = 0;
          this.rend = 0;
          this.rlast = 0;
        })
        this.choose = ind;
        
        this.temp = -this.$refs.scroll.offsetHeight / this.classifyList.length * ind;
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
        // console.log(1);
        this.rstart = e.touches[0].clientY;
        console.log(this.$refs.right.offsetHeight);
      },
      onRMove:function(e){
        this.transform = false;
        let he = this.$refs.right.offsetHeight - this.$refs.aside.offsetHeight;//获取整个可以拖动的距离（整个ul的高度减外面套着的div的高度）
        console.log(he);
        this.rend = e.touches[0].clientY;//获取手指触摸并移动时的手指坐标
        let move  = this.rend - this.rstart + this.rlast;//last表示相对于div顶部为坐标原点的整个ul顶部的Y轴坐标（往上为负），move表示最终的距离
        console.log(move);
        if(move > 150){
          move = 150;
        }else if(he<0 && move<0){
          move = 0
        }else if(he>0 && Math.abs(move) > he + 150){
          move = -(he + 150);
        }
        this.rtemp = move;
      },
      onREnd:function(e){
        let he = this.$refs.right.offsetHeight - this.$refs.aside.offsetHeight;
        if(this.rtemp>0){
          this.transform = true;
          this.rtemp = 0;
        }else{
          this.transform = false;
        }
        this.rlast = this.rtemp;
      },
    }
    
}
</script>
<style lang="less" scoped>
  #classify{
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
        padding-top:0.2rem; 
        width: 77%;
        height: 100%;
        // background: yellow;
        ul{
          width: 100%;
          &.transform{
            transition:all 0.5s
          }
          li:nth-of-type(2n-1){
            margin-left: 4%;
            margin-right: 2%;
          }
          li:nth-of-type(2n){
            margin-left: 2%;
            margin-right: 4%;
          }
          li{
            font-size: 0.36rem;
            line-height: 3.5rem;
            height: 3.5rem;
            width: 44%;
            .productImg{
              line-height: 3rem;
              height: 3rem;
              overflow: hidden;
              width: 100%;
              background-color: white;
              img{
                display: block;
                width: 100%;
              }
            }
            .productName{
              line-height: 0.5rem;
              height: 0.5rem;
              text-align: center;
              font-size: 0.32rem;
            }
          }
        }
      }
    }
  }
  .choose{
    color: red;
  }
</style>