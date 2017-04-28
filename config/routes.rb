Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users
  resources :groups,except:[:destroy] do
    resources :comments do
      collection do
        post 'search'
      end
    end
  end
  resources :users, only:[:index]

end
