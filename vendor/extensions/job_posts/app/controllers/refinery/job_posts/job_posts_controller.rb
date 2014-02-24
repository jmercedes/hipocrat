module Refinery
  module JobPosts
    class JobPostsController < ::ApplicationController

      before_filter :find_all_job_posts
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @job_post in the line below:
        present(@page)
      end

      def show
        @job_post = JobPost.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @job_post in the line below:
        present(@page)
      end

    protected

      def find_all_job_posts
        @job_posts = JobPost.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/job_posts").first
      end

    end
  end
end
