class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update, :edit, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    ## or simply : Task.create(task_params) which saves automatically
    redirect_to task_path(@task)
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def edit
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:title, :details, :completed)
  end
end
