class TasksController < ApplicationController
  def index
    @spaces= Space.all.order('created_at DESC')
    @space = Space.find(params[:space_id])
  end
  def new
    
  end
end
