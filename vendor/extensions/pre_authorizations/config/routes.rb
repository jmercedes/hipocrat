Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :pre_authorizations do
    resources :pre_authorizations, :path => '', :only => [:new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :pre_authorizations, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/pre_authorizations" do
      resources :pre_authorizations, :path => '' 
      resources :settings, :only => [:edit, :update]
    end
  end
end

