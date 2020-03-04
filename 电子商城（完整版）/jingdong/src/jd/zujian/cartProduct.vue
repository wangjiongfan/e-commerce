<template>
    <div id="cartproduct">
        <ul>
          <li v-for="(item,index) in cartProducts" class="" :key="index">
            <div class="left cbox">
                <van-checkbox-group v-model="plist" ref="checkboxGroup" @change="onSelected(item.id)">
                    <van-checkbox class="checkbox" :name="item.id" checked-color="#ff0000">
                    </van-checkbox>
                </van-checkbox-group>
            </div>
            
            <div class="image " >
                <img width="110px" :src="item.img" alt="">
            </div>
            <div class="text ">
                <div class="title"><span>{{item.title}}</span><span class="del right" @click="delet(item,index)">删除</span></div>
                <div class="type">{{item.type}}</div>
                <div class="price clear">
                    <div class="left">{{item.price}}</div>
                    <div class="right">
                        <span @click="item.count = item.count <=1 ? 1 : --item.count">-</span>
                        {{item.count}}
                        <span @click="item.count++">+</span>
                    </div>
                </div>
            </div>
          </li>
        </ul>
    </div>
</template>
<script>   
    export default {
        data(){
            return{
                plist:[],
                delLid:0,
                delInd:0
            }
        },
        props:{
            cartProducts:{
                type:Array,
                default:function(){
                    return [];
                }
            },
            select:{
                type:Array,
                default:function(){
                    return [];
                }
            }
        },
        methods:{
            onSelected:function(e){
                this.$emit('selected',this.plist);
                // console.log(e);
                // console.log(this.plist);
                // console.log(this.cartProducts);
            },
            delet(item,index){
                // console.log(item.Lid);
                this.delLid = parseInt(item.Lid);
                // console.log(index);
                this.delInd = index;
                this.$emit('del',this.delLid,this.delInd);
            }
        },
        created:function(){
            this.plist = this.select;
                // console.log(this.select);
        },
        watch:{
            select:function(newVal){
                this.plist = newVal;
            }
        }
	}
</script>
<style lang="less" scoped>
    #cartproduct{
        ul{
            li{
                height: 2.4rem;
                display: flex;
                align-items: center;
                background-color: white;
                margin-top: 0.3rem;
                .cbox{
                    height: 2.4rem;
                    line-height: 2.4rem;
                    width: 0.8rem;
                    .checkbox{
                        margin: 1rem auto;
                        width: 0.4rem;
                        height: 0.4rem;
                    }
                }
                input{
                    // display: inline-block;
                    margin-left: 0.4rem;
                    margin-right: 0.4rem;
                }
                .image{
                    width: 2rem;
                    height: 2rem;
                    overflow: hidden;
                }
                .text{
                    font-size: 0.36rem;
                    width: 55%;
                    .title{
                        .del{
                            font-size: 0.3rem;
                            color: red;
                            border: 1px solid red;
                            padding:0 0.1rem;
                        }
                    }
                }
            }
        }
    }
</style>
