class ComplaintNotifier < ActionMailer::Base
  default from: "iusher.response@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.complaint_notifier.received.subject
  #
  def received(complaint)
    @complaint = complaint

    mail to: complaint.comment, subject: "Follow up on your complaint"
  end
end
