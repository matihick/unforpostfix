Postfixman::Application.routes.draw do
  root to: 'domains#index'

  resources :domains, shallow: true do
    resources :users, except: [:index, :show]
    resources :aliases, except: [:index]
    resources :recipient_bccs, except: [:index, :show]
    resources :sender_bccs, except: [:index, :show]
  end

  resources :client_accesses, except: [:show]
  resources :recipient_accesses, except: [:show]
  resources :sender_accesses, except: [:show]
end
