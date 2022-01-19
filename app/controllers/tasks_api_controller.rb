class TasksApiController < ApplicationController
    def get_tasks
        tasks = Task.all
        render json: tasks
    end

    def update_task
        task_params = params.require(:task).permit(:name, :description, :status, :due_date, :priority, :user_id)
        task = Task.find(params[:id])
        task.update(task_params)
        render json: task
    end
end
