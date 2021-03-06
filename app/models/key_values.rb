# encoding: utf-8
module KeyValues

  class Base < ActiveHash::Base
    def self.options
      all.map {|t| [t.name, t.code]}
    end

    # {code1: name1, code2: name2}
    def self.hash
      Hash[*(all.map{|t| [t.code, t.name]}.flatten)]
    end
  end

  # 是否发布
  class PublishState < KeyValues::Base
    self.data = [
      {id: 1, name: '显示', code: 'true'},
      {id: 2, name: '隐藏', code: 'false'},
    ]
  end

  # 是否发布
  class PageSize < KeyValues::Base
    self.data = [
      {id: 1, name: '25' , code: '25' },
      {id: 2, name: '50' , code: '50' } ,
      {id: 3, name: '100', code: '100'},
      {id: 4, name: '250', code: '250'},
    ]
  end

  module Mail

    class Type < KeyValues::Base
        self.data = [
          {id: 1, name: '订单确认提醒'            , code: 'order_confirm'                 , des: '当订单创建时，给客户发送此邮件'         },
          {id: 2, name: '新订单提醒'              , code: 'new_order_notify'              , des: '当订单创建时，给客户发送此邮件'         },
          {id: 3, name: '货物发送提醒'            , code: 'ship_confirm'                  , des: '当订单创建时，给客户发送此邮件'         },
          {id: 4, name: '货物发送信息更改提醒'    , code: 'ship_update'                   , des: '当订单创建时，给客户发送此邮件'         },
          {id: 5, name: '订单取消提醒'            , code: 'order_cancelled'               , des: '当订单创建时，给客户发送此邮件'         },
          {id: 6, name: '顾客帐号激活提醒'        , code: 'customer_account_activation'   , des: '当订单创建时，给客户发送此邮件'         },
          {id: 7, name: '顾客帐号密码更改提醒'    , code: 'customer_password_reset'       , des: '当订单创建时，给客户发送此邮件'         },
          {id: 8, name: '顾客帐号确认提醒'        , code: 'customer_account_welcome'      , des: '当订单创建时，给客户发送此邮件'         }
        ]
    end
  end

  # 商品相关
  module Product

    module Inventory

      class Manage < KeyValues::Base
        self.data = [
          {id: 1, name: '不需要跟踪库存情况'            , code: ''      },
          {id: 2, name: '需要ShopQi跟踪此款式的库存情况', code: 'shopqi'}
        ]
      end

      class Policy < KeyValues::Base
        self.data = [
          {id: 1, name: '库存不足时拒绝用户购买此款商品', code: 'deny'    },
          {id: 2, name: '允许用户购买此款商品，即使库存不足', code: 'continue'}
        ]
      end

    end

    # 商品款式选项
    class Option < KeyValues::Base
      self.data = [
        {id: 1, name: '标题', code: 'title'    },
        {id: 2, name: '大小', code: 'size'     },
        {id: 3, name: '颜色', code: 'color'    },
        {id: 4, name: '材料', code: 'material' },
        {id: 5, name: '风格', code: 'style'    }
      ]
    end

  end

  # 订单
  module Order

    # 状态
    class Status < KeyValues::Base
      self.data = [
        {id: 1, name: '正常'  , code: 'open'    },
        {id: 2, name: '已关闭', code: 'closed'  },
        {id: 3, name: '已取消', code: 'cancelled'}
      ]
    end

    # 支付状态
    class FinancialStatus < KeyValues::Base
      self.data = [
        {id: 1, name: '已支付', code: 'paid'      },
        {id: 2, name: '待支付', code: 'pending'   },
        {id: 3, name: '认证'  , code: 'authorized'},
        {id: 4, name: '放弃'  , code: 'abandoned' },
      ]
    end

    # 配送状态
    class FulfillmentStatus < KeyValues::Base
      self.data = [
        {id: 1, name: '已发货'  , code: 'fulfilled'},
        {id: 2, name: '部分发货', code: 'partial'  },
        {id: 3, name: '未发货'  , code: 'unshipped'}
      ]
    end

    # 取消原因
    class CancelReason < KeyValues::Base
      self.data = [
        {id: 1, name: '顾客改变/取消订单', code: 'customer'    },
        {id: 2, name: '欺诈性订单'       , code: 'fraud'       },
        {id: 3, name: '没有商品了'       , code: 'inventory'   },
        {id: 4, name: '其他'             , code: 'other'       }
      ]
    end

  end

  module Link

    #链接类型
    class Type < KeyValues::Base
      self.data = [
        {id: 1, name: '博客'    , code: 'blog'      },
        {id: 2, name: '商店首页', code: 'frontpage' },
        {id: 3, name: '商品列表', code: 'collection'},
        {id: 4, name: '指定页面', code: 'page'      },
        {id: 5, name: '指定商品', code: 'product'   },
        {id: 6, name: '查询页面', code: 'search'    },
        {id: 7, name: '其他网址', code: 'http'      }
      ]
    end

  end

  module Collection

    #规则相关列
    class Column < KeyValues::Base
      self.data = [
        {id: 1 , name: '商品名称', code: 'title'                    , clazz: 'string'  },
        {id: 2 , name: '商品类型', code: 'product_type'             , clazz: 'string'  },
        {id: 3 , name: '商品厂商', code: 'vendor'                   , clazz: 'string'  },
        {id: 4 , name: '商品价格', code: 'variants_price'           , clazz: 'integer' },
        {id: 5 , name: '比较价格', code: 'variants_compare_at_price', clazz: 'integer' },
        {id: 6 , name: '库存现货', code: 'variants_inventory'       , clazz: 'integer' },
        {id: 7 , name: '款式名称', code: 'variants_option1'         , clazz: 'string'  }
      ]
    end

    #规则关系
    class Relation < KeyValues::Base
      self.data = [
        {id: 1, name: '等于'    , code: 'equals'      , clazz: 'all'    },
        {id: 2, name: '大于'    , code: 'greater_than', clazz: 'integer'},
        {id: 3, name: '小于'    , code: 'less_than'   , clazz: 'integer'},
        {id: 4, name: '以此开头', code: 'starts_with' , clazz: 'string' },
        {id: 5, name: '以此结束', code: 'ends_with'   , clazz: 'string' },
        {id: 6, name: '包含'    , code: 'contains'    , clazz: 'string' },
      ]
    end

    #排序
    class Order < KeyValues::Base
      self.data = [
        {id: 1 , name: '按标题拼音升序: A-Z'  , code: 'title.asc'      },
        {id: 2 , name: '按标题拼音降序: Z-A'  , code: 'title.desc'     },
        #{id: 3, name: '按销售量排序'         , code: 'best-selling'   },
        {id: 4 , name: '按创建日期: 最近-最远', code: 'created_at.desc'},
        {id: 5 , name: '按创建日期: 最远-最近', code: 'created_at.asc' },
        {id: 6 , name: '按价格排序: 最高-最低', code: 'price.desc'     },
        {id: 7 , name: '按价格排序: 最低-最高', code: 'price.asc'      },
        {id: 8 , name: '手动排序'             , code: 'manual'         },
      ]

      #手动排序?
      def self.is_manual?(order)
        'manual' == order
      end
    end

  end

end
