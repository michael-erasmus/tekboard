class JobsMailer < ActionMailer::Base
  default :from => "notify@techboard.co.za"
  
  def new_job(job)
    @job = job
    mail(:to => 'inbox@techboard.co.za',
         :subject => 'Techboard - A new job posting was added')
  end

  def active_job(job)
    @job = job
    mail(:to => @job.company_email,
         :subject => 'techboard.co.za - Your job post has been approved')
  end
end
