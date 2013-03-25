Airport::Application.routes.draw do
  resources :planes, only: [:index, :create, :show] do
    member do
      post :launch
    end
  end

  root to: 'planes#index'
end
