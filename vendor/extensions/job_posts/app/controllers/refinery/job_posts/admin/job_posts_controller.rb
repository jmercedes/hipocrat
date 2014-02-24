module Refinery
  module JobPosts
    module Admin
      class JobPostsController < ::Refinery::AdminController

        crudify :'refinery/job_posts/job_post',
                :title_attribute => 'position',
                :xhr_paging => true

      end
    end
  end
end
