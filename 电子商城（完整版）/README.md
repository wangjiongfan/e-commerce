在使用完整版时请开启本地服务器，或使用公网域名下的服务器。并根据你的数据库类型，在SQL文件夹下选择指定数据库类型的文件夹将sql文件导入到你的指定数据库，并根据你的数据库信息修改jingdongBack文件夹下所有php文件内 第8行-第11行 的相关数据库信息。再将所有的php文件与img文件夹放入指定服务器文件夹内，即可完成后端与数据库部署。


注：如果要使用头像上传功能，请注意修改15upload.php文件第25行与第28行的图片上传的指定路径（图片大小不可过大）




完成后端与数据库部署之后，请根据你的后端部署的地址，修改以下vue文件接口地址：

1、 view文件夹下shangpin.vue       第150行，第158行

2、 view文件夹下MyShopping.vue     第31行

3、 view文件夹下Mycomment.vue      第24行

4、 view文件夹下Mine.vue           第51行，第74行

5、 view文件夹下login.vue          第50行

6、 view文件夹下Classify.vue       第55行，第108行

7、 view文件夹下Cart.vue           第53行，第81行，第113行

9、 jd下的zujian文件夹下sku.vue         第109行

10、jd下的zujian文件夹下products.vue    第51行

11、jd下的zujian文件夹下commentary.vue  第62行，第65行，第103行，第106行，第116行
