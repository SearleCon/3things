Foundation::Application.routes.draw do

  authenticated :user do
    root :to => 'tasks#index'
  end
  root :to => "home#index"

  devise_for :users, :controllers => {:sessions => "sessions", :registrations => "users/registrations", :passwords => "users/passwords"}
  resources :users

  resources :suggestions, only: [:new, :create]

  resources :plans, :only => [:index] do
    resources :subscriptions, :only => [:new, :create]
    get :paypal_check_out, on: :member
  end

  resources :payment_notifications, controller: 'payment_notification',  only: [:create]

  resources :tasks do
    member { put :moved }
    collection do
     delete :remove_selected
     post :editing
     put :update_multiple
    end
  end


  #contact routes
  match '/contact_us' => 'contact#new', :as => 'contact_us', :via => :get
  match '/send_contact_email' => 'contact#create', :as => 'send_contact_email', :via => :post

  #non-dynamic pages go here
  match '/terms_and_conditions', to: 'static_pages#terms_and_conditions', via: :get
  match '/privacy_policy', to: 'static_pages#privacy_policy', via: :get
  match '/faq', to: 'static_pages#faq', via: :get
  match '/about', to: 'static_pages#about', via: :get
  match '/pricing', to: 'static_pages#pricing', via: :get


  #handle all routing errors
  match "*path", :to => "application#routing_error"

end

# use command 'annotate --routes' in your console to generate the list of routes below courtesy of Annotate gem

#== Route Map
# Generated on 05 Jan 2013 18:10
#
#                     root        /                                           tasks#index
#         new_user_session GET    /users/sign_in(.:format)                    sessions#new
#             user_session POST   /users/sign_in(.:format)                    sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                   sessions#destroy
#            user_password POST   /users/password(.:format)                   users/passwords#create
#        new_user_password GET    /users/password/new(.:format)               users/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)              users/passwords#edit
#                          PUT    /users/password(.:format)                   users/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                     users/registrations#cancel
#        user_registration POST   /users(.:format)                            users/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                    users/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                       users/registrations#edit
#                          PUT    /users(.:format)                            users/registrations#update
#                          DELETE /users(.:format)                            users/registrations#destroy
#                    users GET    /users(.:format)                            users#index
#                          POST   /users(.:format)                            users#create
#                 new_user GET    /users/new(.:format)                        users#new
#                edit_user GET    /users/:id/edit(.:format)                   users#edit
#                     user GET    /users/:id(.:format)                        users#show
#                          PUT    /users/:id(.:format)                        users#update
#                          DELETE /users/:id(.:format)                        users#destroy
#              suggestions POST   /suggestions(.:format)                      suggestions#create
#           new_suggestion GET    /suggestions/new(.:format)                  suggestions#new
#       plan_subscriptions POST   /plans/:plan_id/subscriptions(.:format)     subscriptions#create
#    new_plan_subscription GET    /plans/:plan_id/subscriptions/new(.:format) subscriptions#new
#    paypal_check_out_plan GET    /plans/:id/paypal_check_out(.:format)       plans#paypal_check_out
#                    plans GET    /plans(.:format)                            plans#index
#    payment_notifications POST   /payment_notifications(.:format)            payment_notification#create
#               moved_task PUT    /tasks/:id/moved(.:format)                  tasks#moved
#    remove_selected_tasks DELETE /tasks/remove_selected(.:format)            tasks#remove_selected
#                    tasks GET    /tasks(.:format)                            tasks#index
#                          POST   /tasks(.:format)                            tasks#create
#                 new_task GET    /tasks/new(.:format)                        tasks#new
#                edit_task GET    /tasks/:id/edit(.:format)                   tasks#edit
#                     task GET    /tasks/:id(.:format)                        tasks#show
#                          PUT    /tasks/:id(.:format)                        tasks#update
#                          DELETE /tasks/:id(.:format)                        tasks#destroy
#               contact_us GET    /contact_us(.:format)                       contact#new
#       send_contact_email POST   /send_contact_email(.:format)               contact#create
#     terms_and_conditions GET    /terms_and_conditions(.:format)             static_pages#terms_and_conditions
#           privacy_policy GET    /privacy_policy(.:format)                   static_pages#privacy_policy
#                      faq GET    /faq(.:format)                              static_pages#faq
#                    about GET    /about(.:format)                            static_pages#about
#                  pricing GET    /pricing(.:format)                          static_pages#pricing
#                                 /*path(.:format)                            application#routing_error
