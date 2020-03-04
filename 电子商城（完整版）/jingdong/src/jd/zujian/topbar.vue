<template>
    <div id="topbar">
        <div class="menu"><i class="fa fa-bars" aria-hidden="true"></i></div>
        <div class="searchbar">
            <span class="logo"></span>
            <span class="fa fa-search"></span>
            <input type="text" placeholder="华硕笔记本电脑" @keyup.enter="getSearch"/>
        </div>
        <div v-if="!islogin" class="login" @click="login">登录</div>
        <div v-else class="haslogin"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></div>
    </div>
</template>
<script>   
    export default {
        data(){
            return {
                
            }
        },
        props:{
            islogin:{
                type:Boolean,
                default:false
            }
        },
        methods:{
            getSearch:function(){
                this.$router.push('mine');
            },
            login(){
                this.$router.push('login');
            }
        }
        
	}
</script>
<style lang="less" scoped>
    #topbar{
        width: 100%;
        height: 0.88rem;
        /*background-color: red;*/
        display: flex;
        text-align: center;
        padding-top:0.14rem;
        box-sizing: border-box;
        position: fixed;
        top: 0px;
        z-index: 10;
        
        .menu{
            width:1rem;
            line-height: 0.24rem;

            .fa-bars{
                font-size:0.48rem;
                color:white;
            }
        } 
        .login{
            width: 1rem;
            line-height: 0.6rem;
            font-size: 0.32rem;
            color:white;
        }
        .haslogin{
            width: 1rem;
            // background-color: aqua;
            line-height: 0.24rem;
            .fa-paper-plane-o{
                font-size:0.48rem;
                color:white;
                // background-color: black
            }
        }
        .searchbar{
            height: 0.6rem;
            background-color: white;
            flex-grow: 1;
            border-radius: 0.3rem;
            position: relative;
            .logo{
                display: inline-block;
                width: 0.4rem;
                height: 0.3rem;
                background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAeCAYAAABe3VzdAAAAAXNSR0IArs4c6QAAA/tJREFUWAnNmF9oU1ccx8/v5iZXov2nTVOloowJDjfYk4w1SW2xVdDik08iYw8Dqw9j4tsYFMZe3HAMBg593B5mVQSLD0abalL/FcUHNwTFvsjU/HFNW21N0tzfvifNiTf3pqajtc2B8Pv9vvec3/3c8+fec0KiSkm0hyIsuNNazaD6tY0jl8alFm8P/SEEH7Belz5BhJkSRBNw0gjjJOgesxh1Gfqd5kjkH3ubSrFeSVwKDVBgFPWCuR52I36f4EF3ytz5TE4kAsFrgumkb9vWC3TqVE7qlYpWSVwODT25A8BnEn8/fJwKhbrmu+eKAVqANpl5vhpvD57g/ftdFr3gvpchdmmugxjiWZPZTWw2YKybTKKtxGI7eu1DO0RxOnyTev5iFa4dtl5/L4DrWn0DdPZs1noj5SdCoS2c5z4i+oqZ1yhdWpNFHxbdmP9G9CelL/sQt0Sjj/03YkfZo3+KZXRHgby1/MN4V9cmFS87oLqxPxJ50rK+tROvnrtKK1pPLjv7ndJWDFACYBrMkNfYh+F+pYCK9otkd/cG6a8ooATwXbnyjEj8Jn1VMDd1nsnukvGKA0oIN3tOSmstLMxuGdcEYOPI1TEM81MrIDGFagZwDozLVzSJVu7v12qiB+cAKWHtQcxD11Qs1lRDgKKwO7JCZvN5Xy0BOr5qJj6XtQPItM7ae9J3C5GqHUAy26yAWNWzjcPDEwsBdGyBrImWwi9ss1h8bs2FHc5TQHJVQCbhsTaUfoM3V3GnYq+30DjxIvUZgOTOu1SwRRuWQVVA1PGXWkmH6A2Fw6/LtMUGPHvMngKAQ1J7JyD39nqJeXNZY+Z4WbzIIBns7MBGdp8tzbRhuC9L7Z2AyX8n9qLr5eGnVPBhv1UKFumkAzs/MDl/zn4PjcSv9UNDL2X6eQFlYxwVf3YyaGGn9v+VZKCjNyMyt3Hqa7a2Rm9MGobnuNIcL8epnp6Wmek3X2Y58y2erE5VnLMU93mNgXJt4VE6sKcpJ17txk7liMlmu70lVm2eNHFQ9Z68rieDoR9NU6zHim7DUbsNcJvld9DeWMaaxv0LWSDJ5/Hj8UAwj7nlxqJqwBGzEVPjowxPbqmUV2mof8QXjV5UsbS6aXJhBSHJXCk5xVgZEqd9sVjZxlJdsls84NdSK6Qs5psvbaEtUUoQH/LFouftueadg6oi5kQOXfc9zg99SlsqK78W6Nk/Vxvuj/2xmANO3scxB9XNASb/VxnQNfHL2uj1B0pfEktiDC+H9zWPfrrafzQ6IG5jMPDipUlAjeOp/sJ/Jvebm+pGaXBwuhqQptEjDN9NZ73CoE5BTzNTGi+ruCa0u6u8ntG6cLhs7+ds+1b5D7N0Tl8rtx1wAAAAAElFTkSuQmCC);
                background-repeat: no-repeat;
                background-position: center;
                background-size: 0.4rem 0.3rem;
                position: absolute;
                top:0.15rem;
                left:0.2rem;
                
            }
            .fa-search{
                font-size: 0.32rem;
                color:#999;
                position: absolute;
                top:0.15rem;
                left: 0.75rem;
                border:none;
                border-left: 1px solid #707070;
                padding-left: 5px;

            }
            input{
                border:0px;
                outline:0px;
                line-height: 0.6rem;
                position: absolute;
                top: 0;
                left: 1.2rem;
                width: 4rem;
                height: 0.6rem;
                // border-radius: 0.3rem;
                font-size: 0.32rem;
            }
        }
    }
</style>