class FormMailer < ApplicationMailer
  def form(contact_params)
    @name = contact_params["name"]
    @email = contact_params["email"]
    @message = contact_params["message"]

    mail(to: "aafke.smal@gmail.com", subject: "Form Sneaker Tours", from: "info@sneakertours.nl")
  end

end
