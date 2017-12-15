Rails.application.routes.draw do

  resources :slots
  resources :diplomas
  devise_for :centers,
             :path=>'recruteur',
             :path_names=>{:sign_in=>'login', :edit=>'profile'},
             :controllers=>{
                 :registrations=>'centers/registrations',
                 :sessions=>'centers/sessions'
             }

  devise_for :users,
             :path=>'',
             :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
             :controllers=>{
                 :registrations=>'users/registrations',
                 :sessions=>'users/sessions'
             }

  resources :users do
    get :matching_offers
  end
  get '/animateurs' => 'users#manage'
  resources :centers
  resources :availabilities
  resources :circonscriptions
  resources :offers
  resources :schools

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root page of the application

  root 'pages#home'

  get '/search' => 'pages#search'
end
