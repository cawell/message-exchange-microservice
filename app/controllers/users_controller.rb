class UsersController < ApplicationController
  before_action :set_user, only: %i[update show destroy]

  def index
    @users = User.all

    ChatMessagesChannel.broadcast_to(
      "chat_messages_channel",
      title: 'New things!',
      body: 'All the news fit to print'
    )

    render json: { 
      user: @users.as_json(except: [:password_digest, :created_at, :updated_at]) 
    }, status: :ok
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render_as_success
    else 
      render_as_error
    end
  end

  def update
    if @user.update(user_params)
      render_as_success
    else
      render_as_error
    end
  end

  def show
    render_as_success
  end

  def destroy
    if @user.destroy
      render_as_success
    else
      render_as_error
    end
  end

  private

    def render_as_success
      render json: { 
        user: @user.as_json(except: [:password_digest, :created_at, :updated_at]) 
      }, status: :ok
    end

    def render_as_error
      render json: { 
        user: @user.as_json(except: [:password_digest, :created_at, :updated_at]), 
        errors: @user.errors.messages 
      }, status: :unprocessable_entity
    end

    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password
      )
    end

    def set_user
      @user = User.find(params[:id])
    end
end
