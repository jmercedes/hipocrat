# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "JobPosts" do
    describe "Admin" do
      describe "job_posts" do
        refinery_login_with :refinery_user

        describe "job_posts list" do
          before do
            FactoryGirl.create(:job_post, :position => "UniqueTitleOne")
            FactoryGirl.create(:job_post, :position => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.job_posts_admin_job_posts_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.job_posts_admin_job_posts_path

            click_link "Add New Job Post"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Position", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::JobPosts::JobPost.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Position can't be blank")
              Refinery::JobPosts::JobPost.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:job_post, :position => "UniqueTitle") }

            it "should fail" do
              visit refinery.job_posts_admin_job_posts_path

              click_link "Add New Job Post"

              fill_in "Position", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::JobPosts::JobPost.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:job_post, :position => "A position") }

          it "should succeed" do
            visit refinery.job_posts_admin_job_posts_path

            within ".actions" do
              click_link "Edit this job post"
            end

            fill_in "Position", :with => "A different position"
            click_button "Save"

            page.should have_content("'A different position' was successfully updated.")
            page.should have_no_content("A position")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:job_post, :position => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.job_posts_admin_job_posts_path

            click_link "Remove this job post forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::JobPosts::JobPost.count.should == 0
          end
        end

      end
    end
  end
end
