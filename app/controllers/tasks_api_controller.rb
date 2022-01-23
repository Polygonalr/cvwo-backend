class TasksApiController < ApplicationController
    def get_tasks
        tasks = Task.all
        tasks_with_tags = []
        tasks.each do |task|
            task_with_tags = task.as_json
            task_with_tags[:tags] = task.tags.as_json
            task_with_tags[:user] = task.user.name.as_json
            tasks_with_tags.push(task_with_tags)
        end
        render json: tasks_with_tags
    end

    def add_task
        task_params = params.require(:task).permit(:title, :description)
        task = Task.new(task_params)
        task.user_id = @user.id
        task.status = 0
        if task.save
            render json: task
        else
            render json: task.errors, status: :unprocessable_entity
        end
    end

    def update_task
        task_params = params.require(:task).permit(:id, :title, :description, :status, :tag_ids => [])
        task = Task.find(task_params[:id])
        if @user == task.user || @user.role == 1
            task.update(task_params)
            # delete all tags from task
            TagTask.where(task_id: task.id).destroy_all
            # add new tags to task
            for tag_id in task_params[:tag_ids]
                puts params[:tag_ids]
                tag_task = TagTask.new(tag_id: tag_id, task_id: task.id)
                tag_task.save
            end
            render json: task
        else
            render json: { error: 'Unauthorized' }, status: :unauthorized
        end
    end

    def get_tags
        tags = Tag.all
        render json: tags
    end

    def add_tag
        tag_params = params.require(:tag).permit(:name, :color_id)
        tag = Tag.new(tag_params)
        if tag.save
            render json: tag
        else
            render json: tag.errors, status: :unprocessable_entity
        end
    end

    def remove_tag
        tag = Tag.find(params[:id])
        if @user.role == 1
            tag.destroy
            render json: tag
        else
            render json: { error: "You are not authorized to remove this tag." }, status: :unauthorized
        end
    end

    def assign_tag
        tag_task_params = params.require(:tag_task).permit(:tag_id, :task_id)
        task = Task.find(tag_task_params[:task_id])
        tag = Tag.find(tag_task_params[:tag_id])
        if (task && tag ) && (@user == task.user || @user.role == 1)
            tag_task = TagTask.new(tag_task_params)
            tag_task.save
            render json: tag_task
        else
            render json: { error: "You are not authorized to assign this tag to this task." }, status: :unauthorized
        end
    end

    def unassign_tag
        tag_task_params = params.require(:tag_task).permit(:tag_id, :task_id)
        task = Task.find(tag_task_params[:task_id])
        if @user == task.user || @user.role == 1
            tag_task = TagTask.where(tag_id: tag_task_params[:tag_id], task_id: tag_task_params[:task_id])
            tag_task.destroy_all
            render json: tag_task
        else
            render json: { error: "You are not authorized to unassign this tag from this task." }, status: :unauthorized
        end
    end

    def get_colors
        colors = Color.all
        render json: colors
    end
end
