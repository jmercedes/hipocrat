Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :job_posts do
    resources :job_posts, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :job_posts, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :job_posts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
