class LoginController < ApplicationController
  skip_before_action :check_logined

  def index
  render :index,layout: false
  end

  def auth
  #入力値がユーザー情報に存在するかどうか認証する
  ##存在しなければnil
  usr = User.authenticate(params[:userid],params[:password])
  if usr then
  #セッションの初期化
  reset_session
  #セッションに対象のユーザーのIDを保存
  session[:usr] = usr.id
  session[:loger] = usr.userid
  redirect_to books_path
 else
  flash.now[:referer] = params[:referer]
  @error = 'ユーザーID/パスワードが間違っています。'
  render 'index'
  end
end
end
