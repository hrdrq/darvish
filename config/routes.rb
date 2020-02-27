Darvish::Application.routes.draw do
  resources :news

  resources :comments

  devise_for :users
  resources :records
  match "/blogs/year/:year(/page/:page)", :to => "blogs#index",  :via => 'get', :as =>'blogs_year'
  resources :blogs do
    # get 'page/:page', :action => :index, :on => :collection
    #get 'year/:year(/page/:page)', :action => :index, , :as =>'blogs_year'
    collection do
      get :feed
      get 'page/:page', :action => :index
    end
  end
  resources :contacts, only: [:new, :create]
  root to: 'homes#new'
end
