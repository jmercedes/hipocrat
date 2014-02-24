module Refinery
  module JobInquiries
    module Admin
      class JobInquiriesController < Refinery::AdminController

        crudify :'refinery/job_inquiries/job_inquiry', 
                :title_attribute => "full_name", 
                :order => "created_at DESC"

        def index
          unless searching?
            find_all_job_inquiries
          else
            search_all_job_inquiries
          end

          @grouped_job_inquiries = group_by_date(@job_inquiries)
        end

      end
    end
  end
end
