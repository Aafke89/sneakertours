class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email
  attribute :message

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "testmail",
      :to => "aafke.smal@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
