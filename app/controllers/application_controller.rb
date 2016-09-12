class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  def check_logined
    #セッション情報:user(id値)が存在するか
    if session[:user] then
      #存在する場合はusersテーブルを検索し、ユーザー情報を取得
      #begin-rescueで例外処理
      begin
       @usr = User.find(session[:user])
      rescue ActiveRecord::RecordNotFound
        reset_session
     end
    end
   #ユーザー情報が取得できなかった場合にはログインページ(login#index)へ
   unless @usr
     flash[:referer] = request.fullpath
     redirect_to controller: :login, action: :index
    end
   end
end
