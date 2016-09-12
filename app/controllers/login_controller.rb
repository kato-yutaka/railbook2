class LoginController < ApplicationController
  skip_before_action :check_logined
  def index
  end

  def auth
  #入力値がユーザー情報に存在するかどうか認証する
　##存在すれば、対象のオブジェクト
  ##存在しなければnil
  user = User.authenticate(params[params[:userid],params[:password])
  if usr then
  #セッションの初期化
  reset_session
  #セッションに対象のユーザーのIDを保存
　redirect_to params[:referer]
 else
  flash.now[:referer] = params[:referer]
  @error = 'ユーザーID/パスワードが間違っています。'
  render 'index'
  end
end
