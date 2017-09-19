Rails.application.routes.draw do

  devise_for :users,
             :path=>'',
             :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
             :controllers=>{:registrations=>'registrations'}

  resources :users, only: [:index, :show, :edit, :update]
  resources :circonscriptions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root page of the application
  root 'pages#home'

end
