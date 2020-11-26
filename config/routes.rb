Rails.application.routes.draw do

  root to: "pages#home"
  resources :centers, only: [:new, :create] do
    resources :matrices, only: [:new, :create]
  end
end
