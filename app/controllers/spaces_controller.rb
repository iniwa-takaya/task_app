class SpacesController < ApplicationController
  before_action :show_spaces, only: %i[index new]

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

  private

  def space_params
    params.require(:space).permit(:name).merge(user_id: current_user.id)
  end

  def show_spaces
    @spaces = Space.all.order('created_at DESC')
  end
end
