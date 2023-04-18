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
  resources :items do
   resource :favorites, only: [:create, :destroy]
   resources :item_comments,only:[:create,:destroy]
  end


   # 会員
   resources :customers, only: [:index, :show, :edit, :update, :update]

  get 'customers/out' => 'devise/registrations#cancel', as: :customers_out
  delete 'customers' => 'devise/registrations#destroy', as: :customer_destroy

end

#管理者側
 namespace :admin do

   root "homes#top"
   resources :genres, only: [:index, :new, :create, :update, :edit]
   resources :customers, only: [:index, :show, :update, :edit]

  end
end
