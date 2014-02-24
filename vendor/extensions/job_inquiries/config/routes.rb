Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :job_inquiries do
    resources :job_inquiries, :path => '', :only => [:new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :job_inquiries, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/job_inquiries" do
      resources :job_inquiries, :path => '' 
      resources :settings, :only => [:edit, :update]
    end
  end
end

