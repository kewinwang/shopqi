# encoding: utf-8
class OrdersController < InheritedResources::Base
  prepend_before_filter :authenticate_member!, :except => [:car, :create]
  actions :index, :show, :destroy
  respond_to :js, :only => [ :create ]
  layout 'pages'

  def create
    @path = orders_path
    if member_signed_in?
      init_cookie_orders
      @order = end_of_association_chain.create :number => :aa, :price_sum => @price_count, :state => 0
    end
  end

  def car
    init_cookie_orders
    render :layout => "compact"
  end

  protected
  def begin_of_association_chain
    current_member
  end

  private
  def init_cookie_orders
    cookies['order'] = '' if cookies['order'].nil?
    order = cookies['order'].split(';').map{|item| item.split('|')}
    @products = order.map do |item|
      product_id = item[0]
      store.products.find(product_id)
    end
    @order_hash = Hash[*order.flatten]
    @items_count = @order_hash.values.map(&:to_i).sum
    @price_count = @products.map do |product|
      @order_hash[product.id.to_s].to_i * product.price
    end.sum
  end
end
