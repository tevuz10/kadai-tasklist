class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスク作成が完了しました。'
      redirect_to root_url
    else
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
      flash[:danger] = 'タスクの作成に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def edit
    @task = current_user.tasks.find(params[:id])
  end
  
  def update
    @task = current_user.tasks.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasks.destroy
    flash[:success] = 'タスクを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @tasks = current_user.tasks.find_by(id: params[:id])
    unless @tasks
      redirect_to root_url
    end
  end
end
