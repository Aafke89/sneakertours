class ContactsController < ApplicationController
  def new
    @contact = Contact.new(params[:contact])
  end

  def create
    # Contact.new(contact_params).deliver
    # redirect_to '/contacts/thanks', :alert => ["Yeah!"]

    @contact =  Contact.new(params[:contact])
    @contact.request = request

    @contact.deliver

    if @contact.deliver
      raise 'rainbow'
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      raise 'hellfire'
      flash.now[:error] = 'Cannot send message.'
      render :new
    end

  end

  # def contact_params
  #   params.require(:contact).permit(:name, :email, :message)
  # end


end
