class TasksController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :get_current_user

  def index
    # @user = User.find(session[:user_id])
    # @tasks = @user.tasks
    @tasks = Task.all
  end

  def create
    @mytask = Task.new(completed: false)
    @mytask.name = params[:task][:name]
    @mytask.description = params[:task][:description]
    @mytask.save
    redirect_to root_path
  end

  def destroy
    @mytask = Task.find(params[:id])
    @mytask.destroy
    redirect_to root_path
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
    redirect_to task_path
  end

  def complete
    Task.update(params[:id], :completed => true, :completed_at => Time.now)
    redirect_to root_path
  end

  private
  def get_current_user
    @user = User.find_by(id: session[:user_id])
  end

end
