class UserTasksController < ApplicationController
  before_action :authenticate!
  before_action :all_tasks, only: [:index, :create, :update, :destroy]
  before_action :set_user_task, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_task


  # GET /user_tasks
  # GET /user_tasks.json
  def index
    @user_tasks = UserTask.all
  end

  # GET /user_tasks/1
  # GET /user_tasks/1.json
  def show
  end

  # GET /user_tasks/new
  def new
    @user_task = UserTask.new
  end

  # GET /user_tasks/1/edit
  def edit
  end

  # POST /user_tasks
  # POST /user_tasks.json
  def create
    @user_task = current_user.user_tasks.build(user_task_params)
    #associates every task with a user

    respond_to do |format|
      if @user_task.save
        format.html { redirect_to @user_task, notice: 'User task was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @user_task }
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @user_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_tasks/1
  # PATCH/PUT /user_tasks/1.json
  def update
    respond_to do |format|
      if @user_task.update(user_task_params)
        format.js
        # format.html { redirect_to @user_task, notice: 'User task was successfully updated.' }
        # format.json { render :show, status: :ok, location: @user_task }
      else
        format.js { render :edit }
        # format.html { render :edit }
        # format.json { render json: @user_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_tasks/1
  # DELETE /user_tasks/1.json
  def destroy
    @user_task.destroy
    respond_to do |format|
      format.js
      # format.html { redirect_to user_tasks_url, notice: 'User task was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_task
      @user_task = current.user.user_tasks.find(params[:id])
      #this will only allow you to edit tasks belonging to the user that's logged in
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_task_params
      params.require(:user_task).permit(:description, :due)
    end

    def all_tasks
        @user_tasks = current_user.user_tasks.order(:due)
    end

    def invalid_task
      logger.error "Attempt to access invalid task #{params[:id]}"
      redirect_to user_tasks_url, notice: 'Invalid task'
    end

end
