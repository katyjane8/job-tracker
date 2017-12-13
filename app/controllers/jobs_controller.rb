class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_company
  before_action :set_category, only: [:new, :create, :edit, :update]

  def index
    @jobs = @company.jobs
    @contacts = Contact.new()
  end

  def new
    @job = Job.new()
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
  end

  def update
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy

    flash[:success] = "#{@job.title} at #{@job.company.name} was successfully deleted!"
    redirect_to company_jobs_path(@company)
  end

  def jobs
    if params[:sort] == 'interest'
      @jobs = Job.order(:level_of_interest)
    elsif params[:sort] == 'location'
      @jobs = Job.order(:city)
    elsif params[:location]
      @jobs = Job.where(city: params[:location])
    else
      @company = Company.find(params[:company_id])
      binding.pry
    end 
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_category
    @category = Category.all
  end
end
