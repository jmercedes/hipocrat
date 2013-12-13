module Refinery
  module PreAuthorizations
    module Admin
      class PreAuthorizationsController < Refinery::AdminController

        crudify :'refinery/pre_authorizations/pre_authorization', 
                :title_attribute => "full_name", 
                :order => "created_at DESC"

        def index
          unless searching?
            find_all_pre_authorizations
          else
            search_all_pre_authorizations
          end

          @grouped_pre_authorizations = group_by_date(@pre_authorizations)
        end

      end
    end
  end
end
