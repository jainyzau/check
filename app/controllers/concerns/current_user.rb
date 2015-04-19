module CurrentUser
  extend ActiveSupport::Concern

  private
    def current_user
      @user = User.find(session[:user_id]) if session[:user_id]
    end
end
