Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
        resources :users
      end
    end
  # end
  devise_for :users
     scope module: 'api' do
     namespace :v1 do
       devise_scope :user do
         post "sign_up", :to => 'registrations#create'
         post "sign_in", :to => 'sessions#create'
         delete "sign_out", :to => 'sessions#destroy'
       end
     end
   end
end
