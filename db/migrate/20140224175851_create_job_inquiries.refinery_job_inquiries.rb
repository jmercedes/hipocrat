# This migration comes from refinery_job_inquiries (originally 1)
class CreateJobInquiries < ActiveRecord::Migration

  def up
    create_table :refinery_job_inquiries do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :resume
      t.string :how_did_you_know

      t.timestamps
    end

    add_index :refinery_job_inquiries, :id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "job_inquiries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/job_inquiries"})
    end

    drop_table :refinery_job_inquiries
  end

end
