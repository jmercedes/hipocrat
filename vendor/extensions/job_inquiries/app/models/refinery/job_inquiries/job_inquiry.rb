module Refinery
  module JobInquiries
    class JobInquiry < Refinery::Core::BaseModel
      self.table_name = 'refinery_job_inquiries'

      attr_accessible :full_name, :email, :phone, :resume, :how_did_you_know, :position

      # def message was created automatically because you didn't specify a text field
      # when you ran the refinery:form generator. <3 <3 Refinery CMS.
      def message
        "Override def message in vendor/extensions/job_inquiries/app/models/refinery/job_inquiries/job_inquiry.rb"
      end

      alias_attribute :name, :full_name

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :full_name, :presence => true

      HOW_DID_YOU_KNOWS = []
    end
  end
end
