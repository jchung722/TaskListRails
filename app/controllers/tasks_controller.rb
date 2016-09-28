class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def new
  end

  def show
    @tasks = Task.all
    @mytask = nil

    @tasks.each do |task|
      num = params[:id].to_i
      if task[:id] == num
        @mytask = task
      end
    end

    if @mytask == nil
      @mytask = {id: params[:id].to_i, name: "Did not find", description: "", status: "", completed_at: nil}
    end
  end

  def update
  end

end
