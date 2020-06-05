Rails.application.routes.draw do
  root to: 'pages#home'


  get 'auth/:provider/callback', to: 'sessions#googleAuth' #after successfully signing in thru Google path gets called
  get 'auth/failure', to: redirect('/')


  get '/signin' => 'sessions#new'
  
  get '/logout' => 'session#destroy'

  resources :philanthropic_initiatives
  resources :beneficiaries
  resources :businesses
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
