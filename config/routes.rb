Rails.application.routes.draw do

  resources :categories, except: [:edit, :new] do
    resources :sub_categories, except: [:edit, :new] do
      resources :products, except: [:edit, :new]
    end
  end
end
