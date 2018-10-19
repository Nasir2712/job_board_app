class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def jobs_list
    @jobs_list = Job.all
  end

  def index
    @company_jobs = current_user.jobs
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = 'Job Successfully Created'
      redirect_to job_path(@job.id)
    else
      render 'new'
    end
  end

  def show
    @job = Job.find(params[:id])
    @job_application = JobApplication.new
    @job_applied = JobApplication.find_by_user_id_and_job_id(current_user.id, params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :employer_name, :user_id)
  end
end
