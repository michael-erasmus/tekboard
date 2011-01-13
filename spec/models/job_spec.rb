require 'spec_helper'

describe Job do
  it "should return the latest jobs" do
    new_job1 = Job.make!()
    new_job2 = Job.make!()
    old_job = Job.make!(:created_at => 5.days.ago) 

    Job.latest.should include new_job1
    Job.latest.should include new_job2
    Job.latest.should_not include old_job 
    
  end
end
