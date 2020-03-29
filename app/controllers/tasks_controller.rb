class TasksController < ApplicationController
  before_action :require_logged_user

  def index
    @task = Task.new
    @tasks = current_user.tasks.order('completed_at')
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path,
        notice: t('flash.tasks.create.notice')
      else
        render :new
      end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path,
        notice: t('flash.tasks.update.notice')
      else
        render :new
      end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy!

    redirect_to tasks_path,
      notice: t('flash.tasks.destroy.notice')
  end

  def batch_update
    Task.transaction do
      current_user.tasks.where(id: params[:task_ids], completed_at: nil)
      .update_all(completed_at: Time.current)

      current_user.tasks.where.not(id: params[:task_ids])
      .update_all(completed_at: nil)

      redirect_to tasks_path,
        notice: "Atualizou todos!"
    end
  end

  private

  def task_params
    params
    .require(:task)
    .permit(:title, :task_ids)
  end
end
