module Refinery
  module JobInquiries
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::JobInquiries

      engine_name :refinery_job_inquiries

      initializer "register refinerycms_job_inquiries plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "job_inquiries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.job_inquiries_admin_job_inquiries_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/job_inquiries/job_inquiry',
            :title => 'full_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::JobInquiries)
      end
    end
  end
end
