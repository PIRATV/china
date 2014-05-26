class ContactsController < ApplicationController
  extend ApplicationHelper
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash[:notice] = I18n.t('Thank you for your message') and redirect_to request.fullpath
    else
      flash.now[:error] = I18n.t('Cannot send message.')
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end