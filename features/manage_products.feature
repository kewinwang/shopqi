# language: zh-CN
功能: 管理产品
  为了向访问者展示产品
  作为用户
  可以添加、修改商品
  
  @focus
  @javascript
  场景: 上传商品图片
    假如我已经以用户名saberma登录
    当我点击添加商品
    而且将图片public/images/logo.jpg上传
    那么缩略图应该能显示
  
  @javascript
  场景: 添加商品
    假如我已经以用户名saberma登录
    * 点击添加商品
    当我输入名称为iphone
    当我输入价格为99
    而且点击保存
    那么我应该能看到添加成功
