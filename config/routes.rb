Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
  end

  resources :components, only: :index do
    collection do
      get :money
      get :datatime
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
