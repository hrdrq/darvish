class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?
      @contact.save
      # ContactMailer.contact_email(@contact).deliver
      flash.now[:notice] = "謝謝來信，#{@contact.name}，我們已收到您的意見。"
      redirect_to new_contact_path
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
