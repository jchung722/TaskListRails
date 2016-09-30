class TasksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @tasks = Task.all
  end

  def create
    @mytask = Task.new
    @mytask.name = params[:task][:name]
    @mytask.description = params[:task][:description]
    @mytask.status = params[:task][:status]
    @mytask.completed_at = params[:task][:completed_at]
    @mytask.save
    redirect_to action: 'index'
  end

  def destroy
    @mytask = Task.find(params[:id])
    @mytask.destroy
    redirect_to action: 'index'
  end

  def edit
    @mytask = Task.new
  end

  def new
    @mytask = Task.new
  end

  def show
    @mytask = Task.find(params[:id])

    if @mytask == nil
      render :file => 'public/404.html',
        :status => :not_found
    end
  end

  def update
  end

end
