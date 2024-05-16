Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root "movie#index"

  # resources :movies do
  #   # Nested resources for bookmarks
  #   resources :bookmarks, only: [:create]
  # end

  resources :lists, except: [:edit, :update] do
    # Nested resources for bookmarks
    resources :bookmarks, only: [:index, :new, :create]

  end
  resources :bookmarks, only: :destroy
  # Defines the root path route ("/")
  # root "posts#index"
end



# return RoutesSet.draw do
#   get    '/restaurants',          to: 'restaurants#index'
#   post   '/restaurants',          to: 'restaurants#create'
#   get    '/restaurants/new',      to: 'restaurants#new'
#   get    '/restaurants/:id/edit', to: 'restaurants#edit'
#   get    '/restaurants/:id',      to: 'restaurants#show'
#   patch  '/restaurants/:id',      to: 'restaurants#update'
#   delete '/restaurants/:id',      to: 'restaurants#destroy'
# end
