Rails.application.routes.draw do
  get 'matrices/new'
  get 'matrices/create'
  root to: "pages#home"
  resources :centers, only: [:new, :create] do
    resource :matrix, only: [:new, :create]
  end
end
