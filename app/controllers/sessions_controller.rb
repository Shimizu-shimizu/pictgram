class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end
  # rails 05 課題
  def user_email
    params.requier(:session).permit(:email)
  end
  
  def user_password
    params.requier(:session).permit(:password)
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
