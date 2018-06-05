class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path
  end

  def show
    find
  end

  def edit
    find
  end

  def update
    find

    # title = params[:task][:title]
    # details = params[:task][:details]
    # completed = params[:task][:completed]
    # @task.update(title: title, details: details, completed: completed)

    @task.update(task_params)

    redirect_to tasks_path
  end

  def destroy
    find

    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find
    @task = Task.find(params[:id])
  end
end
