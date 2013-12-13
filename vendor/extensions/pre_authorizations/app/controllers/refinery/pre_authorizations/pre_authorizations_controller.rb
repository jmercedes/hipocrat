module Refinery
  module PreAuthorizations
    class PreAuthorizationsController < ::ApplicationController

      before_filter :find_page, :only => [:create, :new]

      def index
        redirect_to :action => "new"
      end

      def thank_you
        @page = Refinery::Page.find_by_link_url("/pre_authorizations/thank_you", :include => [:parts])
      end

      def new
        @pre_authorization = PreAuthorization.new
      end

      def create
        @pre_authorization = PreAuthorization.new(params[:pre_authorization])

        if @pre_authorization.save
          begin
            Mailer.notification(@pre_authorization, request).deliver
          rescue => e
            logger.warn "There was an error delivering the pre_authorization notification.\n#{e.message}\n"
          end

          if PreAuthorization.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@pre_authorization, request).deliver
            rescue => e
              logger.warn "There was an error delivering the pre_authorization confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to PreAuthorization if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_pre_authorizations_pre_authorizations_path
        else
          render :action => 'new'
        end
      end

    protected

      def find_page
        @page = Refinery::Page.find_by_link_url('/pre_authorizations/new', :include => [:parts])
      end

    end
  end
end
