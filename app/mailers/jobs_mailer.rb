class JobsMailer < ActionMailer::Base
  default :from => "notify@techboard.co.za"
  
  def new_job(job)
    @job = job
    mail(:to => 'inbox@techboard.co.za',
         :subject => 'Techboard - A new job posting was added')
  end
end
