require 'spec_helper'

module Refinery
  module JobPosts
    describe JobPost do
      describe "validations" do
        subject do
          FactoryGirl.create(:job_post,
          :position => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:position) { should == "Refinery CMS" }
      end
    end
  end
end
