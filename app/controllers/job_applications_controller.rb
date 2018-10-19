class JobApplicationsController < ApplicationController

  def create
    @job_application = JobApplication.new(job_application_params)
    if @job_application.save
      flash[:success] = 'Your application has been submitted successfully'
      redirect_to job_path(params[:job_application][:job_id])
    else
      render_to new_job_application_path, alert: "Oops, there was a problem, please try again"
    end
  end

  private

  def job_application_params
    params.require(:job_application).permit(:user_id, :job_id)
  end
end
