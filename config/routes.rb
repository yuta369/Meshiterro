Rails.application.routes.draw do
  # ルーティングを一括して自動生成, 生成するルーティングの限定
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  devise_for :users  # devise を使用する際に URL として users を含む
  root to: "homes#top"
  get "homes/about", to: "homes#about", as: "about"
end