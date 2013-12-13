module Refinery
  module PreAuthorizations
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PreAuthorizations

      engine_name :refinery_pre_authorizations

      initializer "register refinerycms_pre_authorizations plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pre_authorizations"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pre_authorizations_admin_pre_authorizations_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/pre_authorizations/pre_authorization',
            :title => 'full_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PreAuthorizations)
      end
    end
  end
end
