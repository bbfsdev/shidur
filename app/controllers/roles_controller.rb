class RolesController < ApplicationController
  def index
    unless current_user.root?
      redirect_to 'home#index'
    end
    @roles = Role.all.order(:name).includes(:users)
  end

  def new
  end 
  def create
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
