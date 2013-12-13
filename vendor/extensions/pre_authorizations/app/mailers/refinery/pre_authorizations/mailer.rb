module Refinery
  module PreAuthorizations
    class Mailer < ActionMailer::Base

      def confirmation(pre_authorization, request)
        @pre_authorization = pre_authorization
        mail :subject  => Refinery::PreAuthorizations::Setting.confirmation_subject,
             :to       => pre_authorization.email,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :reply_to => Refinery::PreAuthorizations::Setting.notification_recipients.split(',').first
      end

      def notification(pre_authorization, request)
        @pre_authorization = pre_authorization
        mail :subject  => Refinery::PreAuthorizations::Setting.notification_subject,
             :to       => Refinery::PreAuthorizations::Setting.notification_recipients,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>"
      end

    end
  end
end
