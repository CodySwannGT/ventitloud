class ShareMailer < ActionMailer::Base
  default from: "no-reply@ventitloud.com"
  
  def share_email(share)
    @user = share.user
    @share = share
    from = share.vent.public? ? share.vent.user.email : "anonymous@ventitloud.com"
    to = share.with.split("\r\n").reject{|email| !(email =~ /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/) }
    mail(from: from, to: to, subject: "You have a new vent")
  end
end
