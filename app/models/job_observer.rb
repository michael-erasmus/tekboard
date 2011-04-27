class JobObserver < ActiveRecord::Observer
  def before_save(job)
      JobsMailer.active_job(job).deliver if job.is_active? and job.state_changed?
  end
  def after_save(job)
    JobsMailer.new_job(job).deliver if job.state == 'new'
  end
end
