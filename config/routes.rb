Rails.application.routes.draw do
  resources :dogs, only: [:index, :show]
  resources :employees, only: [:index, :show, :new, :create, :edit, :update]
end