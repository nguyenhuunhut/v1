module Api::V1
  class RegistrationsController < Devise::RegistrationsController

    respond_to :json

    def create
      user = User.new user_params
      if user.save
        # UserNotifier.send_signup_email(user).deliver
        render json: {message: "Registration has been completed", user: user}, status: 200
      else
        warden.custom_failure!
        render json: {message: user.errors.full_messages}, status: 200
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :phone, :address, :name_company)
  end
end
end
