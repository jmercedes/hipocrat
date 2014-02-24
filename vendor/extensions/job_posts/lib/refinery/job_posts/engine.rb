module Refinery
  module JobPosts
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::JobPosts

      engine_name :refinery_job_posts

      initializer "register refinerycms_job_posts plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "job_posts"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.job_posts_admin_job_posts_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/job_posts/job_post',
            :title => 'position'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::JobPosts)
      end
    end
  end
end
