class ContactMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_email(contact)
    @contact = contact
    mail(to: ENV["OWNER_EMAIL"], from: @contact.email, :subject => "網站讀者意見")
  end
end
