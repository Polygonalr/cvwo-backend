class TagTasksController < ApplicationController
  before_action :set_tag_task, only: %i[ show edit update destroy ]

  # GET /tag_tasks or /tag_tasks.json
  def index
    @tag_tasks = TagTask.all
  end

  # GET /tag_tasks/1 or /tag_tasks/1.json
  def show
  end

  # GET /tag_tasks/new
  def new
    @tag_task = TagTask.new
  end

  # GET /tag_tasks/1/edit
  def edit
  end

  # POST /tag_tasks or /tag_tasks.json
  def create
    @tag_task = TagTask.new(tag_task_params)

    respond_to do |format|
      if @tag_task.save
        format.html { redirect_to @tag_task, notice: "Tag task was successfully created." }
        format.json { render :show, status: :created, location: @tag_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_tasks/1 or /tag_tasks/1.json
  def update
    respond_to do |format|
      if @tag_task.update(tag_task_params)
        format.html { redirect_to @tag_task, notice: "Tag task was successfully updated." }
        format.json { render :show, status: :ok, location: @tag_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_tasks/1 or /tag_tasks/1.json
  def destroy
    @tag_task.destroy
    respond_to do |format|
      format.html { redirect_to tag_tasks_url, notice: "Tag task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_task
      @tag_task = TagTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_task_params
      params.require(:tag_task).permit(:tag_id, :task_id)
    end
end
