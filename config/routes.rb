Rails.application.routes.draw do

  resources :addresses

  resources :model1s

  resources :modello1s

  resources :people

  resources :cells
  
  resources :generators do
    resources :attrs
  end

  get 'searches/search'
  get 'searches/search2'
  get 'searches/search3'
 get 'secondclassifications' => 'secondclassifications#index'
 get 'sample_rows/sample_rows_all' 
  
  resources :gradings
  resources :tprimarytumors

get 'mdistantmetastasis/new'
  resources :mdistantmetastasis

get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
get "searches/log_out" => "sessions#destroy", :as => "searches/log_out"


#root :to => "users#new"
resources :users
resources :sessions
resources :clinics_lungs
resources :micrornas



root :to => 'sessions#new'

 resources :patients
  resources :firstclassifications
  resources :secondclassifications
 # root :to => 'patients#index'

  resources :firstclassifications do
  resources :secondclassifications   
  #  get "firstclassifications/:firstclassifications_id/secondclassifications" => "application#sescondclassifications", :as => "secondclassifications", :format => :json
    end
 resources :secondclassifications   
 
  resources :patients do
    resources :therapies 

    resources :pathologies
    
    end


  
  resources :tprimarytumors
  resources :gradings  
  resources :nregionallymphnodes
  

  resources :sample_sheets do 
    resources :sample_rows
  end
     resources :rna_forms 
       resources :cell_types
       resources :docs 
     resources :file_types





  resources :cell_types
 resources :rins
  resources :bioanalyzers

 # resources :docs do 
  
 # end

  resources :file_types
  resources :rnas


 resources :microrna_patients do 
    resources :stickurins
    resources :pathologicalurins

  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
