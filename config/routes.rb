Rails.application.routes.draw do

  devise_for :users, :skip => [:sessions, :registrations]
  as :user do
    get '/admin/login' => 'devise/sessions#new', :as => :new_user_session
    post '/admin/login' => 'devise/sessions#create', :as => :user_session
    delete '/admin/logout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  namespace :admin do
    get '/' => 'admin#index'
    get '/articles/published' => 'articles#published', as: :articles_published
    get '/articles/new' => 'articles#new', as: :article_new
    post '/articles/new' => 'articles#create', as: :article_create
    delete '/articles/:id' => 'articles#delete', as: :article_delete
    post '/articles/:id/publish' => 'articles#publish', as: :article_publish
    post '/articles/:id/unpublish' => 'articles#unpublish', as: :article_unpublish
    get '/articles/:id/edit' => 'articles#edit', as: :article_edit
    post '/articles/:id/edit' => 'articles#update', as: :article_update
    resources :topics, only: [:index, :edit, :update, :destroy]
  end

  get '/create' => 'articles#create', as: :articles_create
  get '/articles/:id/:slug' => 'articles#show', as: :articles_show
  get '/topics/:slug' => 'topics#show', as: :topics_show
  get '/search' => 'search#index', as: :search


  root 'home#index'

end
