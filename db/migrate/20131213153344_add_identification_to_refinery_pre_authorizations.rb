class AddIdentificationToRefineryPreAuthorizations < ActiveRecord::Migration
  def change
    add_column :refinery_pre_authorizations, :identification_image, :string
    add_column :refinery_pre_authorizations, :insurance_image, :string
    add_column :refinery_pre_authorizations, :prescription_image, :string
  end
end
