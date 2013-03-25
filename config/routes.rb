Airport::Application.routes.draw do
  resources :planes, only: [:index, :new, :show] do
    collection do
      post :launch
    end
  end

  root to: 'planes#index'
end
