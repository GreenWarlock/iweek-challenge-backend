Rails.application.routes.draw do
  resources :business_photos
  resources :businesses
  resources :categories
  resources :users

  get 'businesses/:id/get_photos' => 'businesses#get_photos', :as => 'get_business_photos'
  get 'me' => 'users#me', :as => 'me'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
