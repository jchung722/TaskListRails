class TasksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @tasks = Task.all
  end

  def create
    @mytask = Task.new(completed: false)
    @mytask.name = params[:task][:name]
    @mytask.description = params[:task][:description]
    @mytask.save
    redirect_to action: 'index'
  end

  def destroy
    @mytask = Task.find(params[:id])
    @mytask.destroy
    redirect_to action: 'index'
  end

  def edit
    @mytask = Task.find(params[:id])
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
    Task.update(params[:id], :name => params[:task][:name], :description => params[:task][:description])
    redirect_to show_path
  end

  def complete
    Task.update(params[:id], :completed => true, :completed_at => Time.now)
    redirect_to root_path
  end

end
