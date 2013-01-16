class TasksController < ApplicationController
  respond_to :html, :js

  before_filter :get_resource, :only => [:moved,:show, :update, :edit, :destroy]
  before_filter :get_status, :only => [:moved]
  before_filter :new_resource, :only => [:new, :create]
  # GET /tasks
  # GET /tasks.json
  def index
    @todos = current_user.try(:tasks).todos.paginate(:per_page => 1, :page => params[:todos])
    @doings = current_user.try(:tasks).doings.paginate(:per_page => 1, :page => params[:doings])
    respond_with([@todos, @doings])
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
    flash[:notice] = 'Task was successfully updated.' if  @task.update_attributes(task_params)
    respond_with(@task) do |format|
      format.json { respond_with_bip(@task) }
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_with(@task)
  end


  # PUT /tasks/1/moved
  # PUT /tasks/1/moved.json
  def moved
    @task.status = @status
    flash[:notice] = 'Task was successfully updated.' if @task.save
    respond_with(@task)
  end

  # DELETE /tasks/remove_selected
  # DELETE /tasks/removed_selected.json
  def remove_selected
    @tasks = Task.destroy(params[:task_ids]) if params[:task_ids]
    respond_with(@tasks)
  end

  private
  def get_resource
    @task = Task.find(params[:id]) if params[:id]
  end

  def new_resource
    @task = current_user.tasks.build(task_params) if current_user
  end

  def get_status
    @status = Status.where(:name => params[:status]).first if params[:status]
  end

  def task_params
    params.require(:task).permit(:description, :title, :status_id) if params[:task]
  end



end
