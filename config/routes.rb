Postfixman::Application.routes.draw do
  root to: 'domains#index'

  resources :domains, shallow: true, except: [:index] do
    resources :users, except: [:index, :show]
    resources :aliases, except: [:index, :show]
    resources :recipient_bccs, except: [:index, :show]
    resources :sender_bccs, except: [:index, :show]
  end
end
