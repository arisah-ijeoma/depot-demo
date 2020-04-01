class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def alert_admin
    mail to: 'jay@depot.com', subject: 'Application failure'
  end
end
