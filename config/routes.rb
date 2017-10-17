Rails.application.routes.draw do

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

  resources :users
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
