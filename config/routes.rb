Airport::Application.routes.draw do
  resources :planes, only: [:index, :create, :show] do
    collection do
      get :history
    end

    member do
      post :launch
    end
  end

  root to: 'planes#index'
end
