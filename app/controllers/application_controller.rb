class ApplicationController < ActionController::Base
  before_action :basic_ninsho
  before_action :sinkitoroku, if: :devise_controller?

  private

  def basic_ninsho
    authenticate_or_request_with_http_basic do |username, password|
      username == 'liner' && password == '0000'
    end
  end
  
  def sinkitoroku
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :firstname, :lastname, :furiganafirst, :furiganalast, :birthday])
  end
end
