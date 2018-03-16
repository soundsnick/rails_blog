class AuthController < ApplicationController
  require 'digest'
  def signup
    if check_auth
      redirect_to articles_path, notice: 'You are already logged in'
    end
    @action = 'register'
    @method = 'get'
    @title = 'Sign Up'
    render 'index'
  end

  def signin
    if session[:current_user_email] && session[:current_user_email] == 'soundsnick@gmail.com'
      redirect_to articles_path, notice: 'You are already logged in'
    end
    @action = 'login'
    @method = 'post'
    @title = 'Sign In'
    render 'index'
  end

  def register
    @userEmail = Users.search(form_params[:email])
    if !@userEmail
      @user = Users.new(form_params)
      @user.save
      session[:current_user_email] = form_params[:email]
      redirect_to articles_path, notice: 'Welcome ' + form_params[:email]
    else
      redirect_to signupPage_path, notice: 'User with that email already exist'
    end
  end

  def login
    @user = Users.search(form_params[:email])
    if @user
      binding.pry
      if @user.password == form_params[:password]
        session[:current_user_email] = form_params[:email]
        redirect_to articles_path, notice: 'Welcome ' + form_params[:email]
      else
        loginError('Your password is incorrect')
      end
    else
      loginError('Email is not found')
    end
  end

  def logout
    session[:current_user_email] = nil
    redirect_to articles_path
  end

  private

  def loginError(notice)
    redirect_to loginPage_path(:isError => 'error'), notice: notice
  end

  def form_params
    @formData = params.require(:login).permit(:email, :password)
    @formData[:password] = Digest::SHA256.hexdigest @formData[:password]
    @formData
  end
end
