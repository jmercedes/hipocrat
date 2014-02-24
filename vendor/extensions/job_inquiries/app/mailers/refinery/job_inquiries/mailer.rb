module Refinery
  module JobInquiries
    class Mailer < ActionMailer::Base

      def confirmation(job_inquiry, request)
        @job_inquiry = job_inquiry
        mail :subject  => Refinery::JobInquiries::Setting.confirmation_subject,
             :to       => job_inquiry.email,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :reply_to => Refinery::JobInquiries::Setting.notification_recipients.split(',').first
      end

      def notification(job_inquiry, request)
        @job_inquiry = job_inquiry
        mail :subject  => Refinery::JobInquiries::Setting.notification_subject,
             :to       => Refinery::JobInquiries::Setting.notification_recipients,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>"
      end

    end
  end
end
