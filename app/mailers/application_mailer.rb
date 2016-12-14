class ApplicationMailer < ActionMailer::Base
  default from: "nguyenhuunhut1@gmail.com"
  layout 'mailer'

  def signup_notification(recipient)
  recipients      recipient.email_address_with_name
  subject         "New account information"
  from            "nguyenhuunhut1@gmail.com"

  part :content_type => "text/html",
    :body => render_message("signup-as-html", :account => recipient)

  part "text/plain" do |p|
    p.body = render_message("signup-as-plain", :account => recipient)
    p.transfer_encoding = "base64"
  end
end

end
