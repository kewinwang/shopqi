# encoding: utf-8
#http://www.engineyard.com/blog/2010/the-lowdown-on-routes-in-rails-3/
Shopqi::Application.routes.draw do

  resources :orders

  resources :containers do
    collection do
      post :sort
      get :operates
    end
  end

  #首页热门分类
  resources :hots do
    collection do
      post :sort
      get :operates
    end
  end

  resources :categories do
    resources :products, :only => :index
  end

  #图片合成
  resources :images do
    collection do
      post :upload
    end
  end

  #菜单
  resources :menus do
    collection do
      post :sort
    end
  end

  #导航
  resources :navs do
    collection do
      post :sort
    end
  end

  resources :focuses do
    collection do
      post :sort
    end
  end

  #主页面
  resources :pages do
    collection do
      post :logo
    end
  end
  #测试subdomain，可以访问vancl.lvm.me:3000
  constraints(Subdomain) do
    match '/' => 'pages#show'
  end
  match 'stylesheets/pages/dynamic.css' => 'pages#dynamic'

  resources :products do
    collection do
      post :upload
    end
  end
  match 'products/:id/add_to_car.js' => 'products#add_to_car'

  ##### 官网 #####
  root :to => "home#index"
  match "why" => "home#why"
  match "features" => "home#features"
  match "questions" => "home#questions"
  match "contact" => "home#contact"

  # 网店平台会员
  devise_for :users
  #用户登录后的跳转页面(符合devise命名规范)
  match "user_root" => "home#show"

  # 商品购买者
  devise_for :members
end
