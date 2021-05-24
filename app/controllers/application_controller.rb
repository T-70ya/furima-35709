class ApplicationController < ActionController::Base
  before_action :basic_ninsho

  private

  def basic_ninsho
    authenticate_or_request_with_http_basic do |username, password|
      username == 'liner' && password == '0000'
    end
  end
end
