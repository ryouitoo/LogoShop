Rails.application.routes.draw do
 # 顧客用
 # URL /customers/sign_in ...
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

#顧客側
scope module: :user do

  root "homes#top"

  #Logo作品
  resources :items, only: [:index, :new, :create, :show, :edit, :update]

   # 会員
  get "customers/out" => "customers#out" #顧客の退会確認画面
  patch "customers/withdraw" => "customers#withdraw" #顧客の退会処理(ステータスの更新)
  get "customer" => "customers#show"
  get "customers/information/edit" => "customers#edit"
  patch "customers/information" => "customers#update"

end

#管理者側
 namespace :admin do

   root "homes#top"
   resources :genres, only: [:index, :new, :create, :update, :edit]
   resources :customers, only: [:index, :show, :update, :edit]

  end
end
