Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/new'
  get 'comments/edit'
    #- action with a html page
  root 'subs#index'
  #as will do shortcuts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'sub#index', as: to:


  # HTTP Verbs
  # GET -  Index, show, new, edit,  read
  # POST - create                   create
  # PUT/PATCH update              update
  # DELETE - destroy                destroy


    # get '/subs', to: 'subs#index'
  # get '/apple', to: 'subs#index'
  # post 'subs', to: 'subs#create'

  #embedded route
  #not recommended 
#   resources :subs do #parent 
#     resources :topics #child
#       resources :comments
#   end
# end

#recommended 
resources :subs do
  resources :topics
end

resources :topics do
  resources :comments
end


#likes
# resources :comments do
#   resources :likes
# end

# static_pages
#resources :static_pages
# get '/home, to: static_pages#index'
  # resources :subs, only: [:new, :index]
  # resources :subs, execept: [:create, :new]
end
