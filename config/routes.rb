Rails.application.routes.draw do
  get 'products/index'

  resources :products
  resources :product_categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
