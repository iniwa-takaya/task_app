class SpacesController < ApplicationController
  before_action :show_spaces, only: %i[index new create edit update]
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
      redirect_to root_path
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
    params.require(:space).permit(:name).merge(user_id: current_user.id)
  end

  def show_spaces
    @spaces = Space.all.order('created_at DESC')
  end

  def find_params
    @space = Space.find(params[:id])
  end
end
