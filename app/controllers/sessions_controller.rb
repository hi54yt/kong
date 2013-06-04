class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  layout "admin" 
	def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      respond_to do |format|
        format.html { redirect_to admin_posts_path }
        format.json { render :status => '201', :json => user.as_json(:only => [:remember_token]) }
      end
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
