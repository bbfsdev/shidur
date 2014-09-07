class UsersController < ApplicationController
  def index
    unless current_user.root?
      redirect_to 'home#index'
    end
    @users = User.all.order(:role_id, :name).includes(:role)
    @roles = Role.all.order(:name)
  end

  def new
    if current_user.root?
      @user = User.new(role: Role.find_by(name: 'group'))
      @roles = Role.all.order(:name)
    else
      redirect_to root_path
    end
  end

  def create
    if current_user.root?
      @user = User.new(user_params)
      @user.confirmed_at = Time.now
      if @user.save
        redirect_to root_path
      else
        @roles = Role.all.order(:name)
        render :new
      end
    else
      logger.warn "Попытка доступа к закрытой части сайта"
    end
  end
  def edit
  end
  def update
  end
  def destroy
    if current_user.root?
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
    else
      logger.warn "Попытка доступа к закрытой части сайта"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :role_id, :password_confirmation)
  end
end
