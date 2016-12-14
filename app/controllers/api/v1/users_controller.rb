module Api::V1
  class UsersController < ApiController
    before_action :set_user, only: [:update, :destroy, :show]
    respond_to :json

    api :GET, '/v1/users', "Get all users"
    def index
      users = User.all
      render json: users.as_json(only: [:email, :confirmation_token])
    end

    api :PUT, '/v1/users/:id', "Update a user"
    # param :id, Integer, "Id of user", :required => true
    param :email, String
    param :name_company, String
    param :phone, String
    param :address, String
    def update
      @user_params = {
        :email => params[:email],
        :name_company => params[:name_company],
        :phone => params[:phone],
        :address => params[:address]
      }
      if @user.update @user_params
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    api :GET, '/v1/users/:id', "Get a user"
    def show
      render json: @user
    end

    private

    def set_user
      @user = User.find params[:id]
    end


  end
end
