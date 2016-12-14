module Api::V1
class SessionsController < Devise::SessionsController
# before_action :ensure_params_exist, only: [:create, :destroy]
# before_action :load_user_authentication

respond_to :json

def create
  @user = User.find_by_email user_params[:email]
if @user.valid_password? user_params[:password]
  sign_in @user, store: false
  render json: {message: "Signed in successfully",
    user: @user},status: 200
    return
end
invalid_login_attempt
end

def destroy
if @user.authentication_token == user_params[:authentication_token] #token thông qua query string
  sign_out @user
  render json: {message: "Signed out"}, status: 200
else
  render json: {message: "Invalid token"}, status: 200
end
end

private
def user_params
params.require(:user).permit :email, :password, :authentication_token
end

def invalid_login_attempt
render json: {message: "Sign in failed"}, status: 200
end

end
end
