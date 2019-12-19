<template>
    <div id="cartproduct">
        <ul>
          <li v-for="(item,index) in cartProducts" class="" :key="index">
            <div class="left cbox">
                <van-checkbox-group v-model="plist" ref="checkboxGroup" @change="onSelected">
                    <van-checkbox class="checkbox" :name="item.id" checked-color="#ff0000">
                    </van-checkbox>
                </van-checkbox-group>
            </div>
            
            <!-- <input type="checkbox" class=""> -->
            <div class="image " >
                <img width="110px" :src="item.img" alt="">
            </div>
            <div class="text ">
                <div class="title">{{item.title}}</div>
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
                plist:[]
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
                // console.log(this.plist);
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
                margin-bottom: 0.3rem;
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
                }
            }
        }
    }
</style>
