class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  def check_logined
    #�Z�b�V�������:user(id�l)�����݂��邩
    if session[:user] then
      #���݂���ꍇ��users�e�[�u�����������A���[�U�[�����擾
      #begin-rescue�ŗ�O����
      begin
       @usr = User.find(session[:user])
      rescue ActiveRecord::RecordNotFound
        reset_session
     end
    end
   #���[�U�[��񂪎擾�ł��Ȃ������ꍇ�ɂ̓��O�C���y�[�W(login#index)��
   unless @usr
     flash[:referer] = request.fullpath
     redirect_to controller: :login, action: :index
    end
   end
end
