Rails.application.routes.draw do
  
  resources :elevator_media
  resources :interventions
  devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => "users/sessions", :passwords => "users/passwords" }
  devise_for :employees, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :pages
  resources :quote
  resources :leads

  
  root 'leads#new'

  get 'index' => 'leads#new' # index
  get 'corporate' => 'pages#corporate' # corporate
  get 'residential' => 'pages#residential' # residential
  get 'quoteform' => 'quote#new' # quote form
  get 'login' => 'pages#login'
  get 'sign_up' => 'users#sign_up'
  get 'sign_in' => 'users#sign_in'
  get 'leads' => 'leads#new'
  get 'welcome' => 'watson#welcome'
  get 'intervention' => 'intervention#new'
  get 'useless' => 'pages#useless'
  
   resources :interventions do
    post :building_select, on: :collection
    post :battery_select, on: :collection
    post :column_select , on: :collection
    post :elevator_select, on: :collection
    # Anciennement pour les call ajax des drop down select.
    #post 'interventionpage/building_select' => 'interventionpage#building_select'
    #post 'interventionpage/battery_select' => 'interventionpage#battery_select'
    #post 'interventionpage/column_select' => 'interventionpage#column_select'
    #post 'interventionpage/elevator_select' => 'interventionpage#elevator_select'
  end  

  # namespace :admin do
  #   resources :addresses do
  #     resources :customers do
  #       resources :buildings do
  #         resources :building_details
  #       end
  #     end
  #   end
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
