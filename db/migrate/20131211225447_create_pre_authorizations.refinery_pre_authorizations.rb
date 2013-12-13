# This migration comes from refinery_pre_authorizations (originally 1)
class CreatePreAuthorizations < ActiveRecord::Migration

  def up
    create_table :refinery_pre_authorizations do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.integer :personal_id_id
      t.integer :insurance_id
      t.integer :prescription_id

      t.timestamps
    end

    add_index :refinery_pre_authorizations, :id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "pre_authorizations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pre_authorizations"})
    end

    drop_table :refinery_pre_authorizations
  end

end
