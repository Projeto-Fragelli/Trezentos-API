class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register]

  def all
    @users = User.order(:id)
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def login
    authenticate params[:email], params[:password]
  end

  def register
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    User.delete(params[:id])
  end

  private
    def authenticate(email, password)
      command = AuthenticateUser.call(email, password)

      if command.success?
        render json: {
          access_token: command.result,
          message: 'Login Successful'
        }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end

    def user_params
      params.permit(
        :id,
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :is_from_facebook,
        :telephone_ddi,
        :telephone_ddd,
        :telephone_number
      )
    end
end
