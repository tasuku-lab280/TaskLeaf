class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.recent
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:success] = "タスク「#{@task.name}」を登録しました。"
      redirect_to @task
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task.update!(task_params)
    flash[:success] = "タスク「#{@task.name}」を更新しました。"
    redirect_to tasks_url
  end

  def destroy
    @task.destroy
    flash[:success] = "タスク「#{@task.name}」を削除しました。"
    redirect_to tasks_url
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

end
