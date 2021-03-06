#encoding: utf-8
class CreateTags < ActiveRecord::Migration
  def self.up

    create_table :tags do |t|
      t.references :shop, comment:  "商品应从属于商店", null: false
      t.string :name    , comment:  "名称"            , null: false
      t.integer :category, comment: "所属类别（1.商品，2.文章)"

      t.timestamps
    end

    #商品标签
    create_table :products_tags, id: false do |t|
      t.references :product, comment: '所属商品', null: false
      t.references :tag    , comment: '所属标签', null: false
    end

    create_table :articles_tags, id: false do |t|
      t.references :article, comment: '所属文章', null: false
      t.references :tag    , comment: '所属标签', null: false
    end

    add_index :tags         , :shop_id
    add_index :products_tags, :product_id
    add_index :products_tags, :tag_id
    add_index :articles_tags, :article_id
    add_index :articles_tags, :tag_id
  end

  def self.down
    drop_table :articles_tags
    drop_table :products_tags
    drop_table :tags
  end
end
