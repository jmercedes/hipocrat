# This migration comes from refinery_job_posts (originally 1)
class CreateJobPostsJobPosts < ActiveRecord::Migration

  def up
    create_table :refinery_job_posts do |t|
      t.string :position
      t.text :description
      t.datetime :opening_date
      t.datetime :closing_date
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-job_posts"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/job_posts/job_posts"})
    end

    drop_table :refinery_job_posts

  end

end
