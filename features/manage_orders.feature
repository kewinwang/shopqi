# language: zh-CN
功能: 管理订单
  为了购买商品
  作为会员
  可以提交订单

  @focus
  @javascript
  场景: 管理收货人信息
    假如我已经以用户名saberma@shopqi.com成功注册
    而且已经填写完支付方式
    * 网店已有具体商品分类
    * 网店有以下商品:
      |名称              |市场价格|价格|分类|
      |个性背带格子衬衫  |298     |59  |男装|
    而且我已经以会员ben@shopqi.com登录
    当我访问个性背带格子衬衫商品详情页面
    * 点击立即购买
    * 点击去结算
    那么我应该能看到收货人信息
    假如我输入以下内容:
      |收货人姓名|saberma      |
      |详细地址  |科技园南区   |
      |邮政编码  |518057       |
      |手机      |13928xx28xx  |
      |固定电话  |0755-2674xxxx|
    * 我选择所在地区为广东省,深圳市,南山区
    当我点击配送至这个地址
    那么我应该能看到saberma(13928xx28xx,0755-2674xxxx) 广东省深圳市南山区科技园南区 518057
    #修改
    当我点击修改
    假如我输入以下内容:
      |收货人姓名|ben      |
    当我点击配送至这个地址
    那么我应该看不到saberma(13928xx28xx,0755-2674xxxx) 广东省深圳市南山区科技园南区 518057
    那么我应该能看到ben(13928xx28xx,0755-2674xxxx) 广东省深圳市南山区科技园南区 518057
    #添加
    当我点击添加
    当我点击配送至这个地址
    那么我应该能看到收货人姓名 不能为空
    假如我输入收货人姓名为jian
    当我点击配送至这个地址
    那么我应该能看到所在地区的省/直辖市 不能为空
    * 我选择所在地区为广东省,深圳市,南山区
    当我点击配送至这个地址
    那么我应该能看到详细地址 不能为空
    假如我输入详细地址为科技园南区
    当我点击配送至这个地址
    那么我应该能看到邮政编码 不能为空
    假如我输入邮政编码为518057
    当我点击配送至这个地址
    那么我应该能看到手机与固定电话 至少有一项必填
    假如我输入手机为13928xx28xx
    当我点击配送至这个地址
    那么我应该能看到jian(13928xx28xx) 广东省深圳市南山区科技园南区 518057
    #删除
    当我确定点击删除
    那么我应该看不到saberma(13928xx28xx,0755-2674xxxx) 广东省深圳市南山区科技园南区 518057

  @javascript
  场景: 未购买商品时提交订单
    假如我已经以用户名saberma@shopqi.com成功注册
    而且已经填写完支付方式
    假如我已经以会员ben@shopqi.com登录
    而且会员已关联收货地址
    当我访问提交订单页面
    * 点击提交订单
    那么我应该能看到产品清单 不能为空

  @javascript
  场景: 管理员查看处理订单
    假如会员ben@shopqi.com提交订单购买以下商品:
      |名称              |价格|
      |个性背带格子衬衫  |59  |
      |自由舒爽棉麻衬衫  |59  |
    假如我已经以用户名saberma@shopqi.com登录
    那么我应该在任务栏看不到订单2010010100001
    当会员成功支付订单
    那么我应该能在任务栏看到订单2010010100001
    当我单击订单2010010100001
    那么我应该能看到118.0
    * 我单击订单2010010100001
