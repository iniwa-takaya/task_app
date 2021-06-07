class SpacesController < ApplicationController
  before_action :find_params, only: %i[edit update destroy]

  def index
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      redirect_to new_space_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @space.update(space_params)
      redirect_to space_tasks_path(@space)
    else
      render :edit
    end
  end

  def destroy
    @space.destroy
    redirect_to root_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :space_id).merge(user_id: current_user.id)
  end

  def find_params
    @space = Space.find(params[:id])
  end
end
