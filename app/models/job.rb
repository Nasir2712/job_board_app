class Job < ApplicationRecord
  def get_job_applicant(job)
    applicant_names = []
    job_application_user_ids = JobApplication.where(job_id: job.id).pluck(:user_id)
    job_application_user_ids.each do |user_id|
      applicant_names << User.find_by_id(user_id).name
    end
    applicant_names.join(' , ')
  end

end
