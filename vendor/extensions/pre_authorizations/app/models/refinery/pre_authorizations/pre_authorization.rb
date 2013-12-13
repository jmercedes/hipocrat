module Refinery
  module PreAuthorizations
    class PreAuthorization < Refinery::Core::BaseModel
      self.table_name = 'refinery_pre_authorizations'

      attr_accessible :full_name, :email, :phone, :personal_id, :insurance_id, :prescription_id, :position, :identification_image, :insurance_image, :prescription_image
      
      mount_uploader :identification_image, ImageUploader
      mount_uploader :insurance_image, ImageUploader
      mount_uploader :prescription_image, ImageUploader


      # def message was created automatically because you didn't specify a text field
      # when you ran the refinery:form generator. <3 <3 Refinery CMS.
      def message
        "Override def message in vendor/extensions/pre_authorizations/app/models/refinery/pre_authorizations/pre_authorization.rb"
      end

      alias_attribute :name, :full_name

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :full_name, :presence => true

      belongs_to :personal_id, :class_name => 'Refinery::Image'

      belongs_to :insurance, :class_name => 'Refinery::Image'

      belongs_to :prescription, :class_name => 'Refinery::Image'
    end
  end
end
