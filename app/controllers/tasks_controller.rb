class TasksController < ApplicationController
  respond_to :html, :js, :json

  before_filter :get_resource, :only => [:show, :update, :edit, :destroy]
  before_filter :new_resource, :only => [:new, :create]
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks
    respond_with(@tasks)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    respond_with(@task)
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
   respond_with(@task)
  end

  # GET /tasks/1/edit
  def edit
    respond_with(@task)
  end

  # POST /tasks
  # POST /tasks.json
  def create
    flash[:notice] = 'Task was successfully created.' if @task.save
    respond_with(@task)
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    status = Status.find(params[:task][:status_id])
    history_created = false
    history_created = save_to_history unless status == @task.status

    if history_created && @task.update_attributes(params[:task])
      flash[:notice] = 'Task was successfully updated.'
    end
    respond_with(@task)
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_with(@task)
  end


  private
  def get_resource
    @task = Task.find(params[:id]) if params[:id]
  end

  def new_resource
    @task = current_user.tasks.new(params[:task])
  end

  def save_to_history
     entry = StatusHistory.new
     entry.status_id = @task.status
     entry.task_id = @task
     entry.save
  end

end