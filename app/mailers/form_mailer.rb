class FormMailer < ApplicationMailer
  def form(contact_params)
    @name = contact_params["name"]
    @email = contact_params["email"]
    @message = contact_params["message"]

    mail(to: "info@sneakertours.nl", subject: "Form Sneaker Tours", from: "info@sneakertours.nl")
  end

end
