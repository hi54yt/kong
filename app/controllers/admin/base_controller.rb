class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :signed_in_user

  protected

  def signed_in_user
    redirect_to signin_path, notice: "Please sign in." unless signed_in?
  end
end