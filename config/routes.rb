Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # get '/lists', to: 'lists#index'
  # get '/lists/new', to: 'lists#new', as: :new_list
  # post '/lists', to: 'lists#create'
  # get '/lists/:id', to: 'lists#show', as: :list

  resources :lists, only: [:index, :new, :create, :show] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
    # resources :bookmarks, only: [:destroy]
end
