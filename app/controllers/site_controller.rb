class SiteController < ApplicationController
  before_filter :authenticate_user!, only: :profile
  require 'will_paginate/array'
  def index
  end

  def catalog
    #@catalog = Catalog.all
    @catalog = Dir.glob("#{Rails.root}/app/assets/images/catalog/*").reverse.paginate(page: params[:page], per_page: 12)
  end

  def profile
    @user = current_user
    if request.patch? and @user.update_attributes(user_params)
      flash.now[:notice] = I18n.t 'Profile updated'
    end
  end

  def organizations
    @organizations = User.all.paginate per_page: 10, page: params[:page]
  end

  def organizationFull
    raise ActiveRecord::RecordNotFound if params[:id].nil?
    @organization = User.find(params[:id])
    @portfolios = @organization.portfolios.paginate page: params[:page], per_page: 9
    raise ActiveRecord::RecordNotFound if @organization.nil?
  end

  private
  def user_params
    params.require(:user).permit :firm, :phone, :site, :info
  end
end
