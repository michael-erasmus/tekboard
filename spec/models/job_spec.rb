require 'spec_helper'

describe Job do
  it "should return the latest jobs" do
    new_job1 = Job.make!()
    new_job2 = Job.make!()
    old_job = Job.make!(:created_at => 5.days.ago) 
  
    Job.latest_approved.should include new_job1
    Job.latest_approved.should include new_job2
    Job.latest_approved.should_not include old_job 
    
  end
  
  it "should only return the approved jobs" do
    approved_job = Job.make!()
    unapproved_job = Job.make!(:approved => false)

    Job.latest_approved.should include approved_job
    Job.latest_approved.should_not include unapproved_job
  end
end
