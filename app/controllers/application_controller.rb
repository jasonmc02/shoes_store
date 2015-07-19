class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def validate_session
    unless (params.has_key?(:username) && params.has_key?(:password)) && 
       (params[:username].eql?("my_user") && params[:password].eql?("my_password"))
      return render :json => { :error_msg => "Authorization required", :success => false }, :status => 401
    end
  end
end
