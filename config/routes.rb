Rails.application.routes.draw do
  devise_for :users
  resources :blog_posts do
    resource :cover_image, only: [:destroy], mmodule: :blog_posts
  end

  root "blog_posts#index"
  post 'random_joke', to: 'jokes#random_joke'  # Rota definida para método POST
end