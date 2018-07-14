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

    if !@user.valid?
      render json: { error: @user.valid?, message: @user.message_sign_up_already_exists }
    elsif @user.save
      render json: { error: @user.valid?, message: @user.message_sign_up_success, user: @user }, status: :created, location: @user
    else
      render json: @user, status: :unprocessable_entity
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
    @user = User.find(params[:id])
    
    if !@user.present?
      render json: { error: true, message: @user.user_not_exist }, status: :not_found
    elsif @user.delete
      render json: { error: false, message: @user.delete_user_success }, status: :ok
    else
      render json: { error: true, message: @user.delete_user_error }, status: :not_found
    end
  end

  private
    def authenticate(email, password)
      command = AuthenticateUser.call(email, password)
      @user = User.find_by_email(email)

      if command.success?

        render json: {
          access_token: command.result,
          error: false,
          user: @user,
          message: @user.message_login_success
        }
      else
        render json: { error: true, message: @user.message_login_error }, status: :unauthorized
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
