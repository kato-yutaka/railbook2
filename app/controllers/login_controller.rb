class LoginController < ApplicationController
  skip_before_action :check_logined
  def index
  end

  def auth
  #���͒l�����[�U�[���ɑ��݂��邩�ǂ����F�؂���
�@##���݂���΁A�Ώۂ̃I�u�W�F�N�g
  ##���݂��Ȃ����nil
  user = User.authenticate(params[params[:userid],params[:password])
  if usr then
  #�Z�b�V�����̏�����
  reset_session
  #�Z�b�V�����ɑΏۂ̃��[�U�[��ID��ۑ�
�@redirect_to params[:referer]
 else
  flash.now[:referer] = params[:referer]
  @error = '���[�U�[ID/�p�X���[�h���Ԉ���Ă��܂��B'
  render 'index'
  end
end
