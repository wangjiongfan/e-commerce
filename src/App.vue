<template>
  <div id="app">
    <router-view/>
  </div>
</template>


<style lang="less" >
  html{
    font-size: calc(100vw/7.5);
    background-color:#F0F2F5;
  }
  html,body,#app{
    height: 100%;
  }
  a{
    color: #bfbfbf;
  }
  *{
    margin: 0;
    padding: 0;
    list-style: none;
  }
  .left{
    float:left;
  }
  .right{
    float: right;
  }
  .clear{
    overflow: hidden;
    zoom:1;
  }

</style>
