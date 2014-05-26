class SiteController < ApplicationController
  before_filter :authenticate_user!, only: :profile

  def index
  end

  def catalog
    @catalog = Catalog.all
  end

  def profile
    @user = current_user
    if request.patch? and @user.update_attributes(user_params)
      flash.now[:notice] = I18n.t 'Profile updated'
    end
  end

  def organizations
    @organizations = User.all.paginate(per_page: 1, page: params[:page])
  end

  def organizationFull
    raise ActiveRecord::RecordNotFound if params[:id].nil?
    @organization = User.find(params[:id])
    @portfolios = @organization.portfolios.paginate page: params[:page], per_page: 1
    raise ActiveRecord::RecordNotFound if @organization.nil?
  end

  private
  def user_params
    params.require(:user).permit :firm, :phone, :site, :info
  end
end
