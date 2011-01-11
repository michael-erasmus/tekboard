require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Job Listing", %q{
  In order to check out the job market 
  As a job seeker 
  I want to look at all the lastest jobs
} do

  scenario "Browse the home page and see all the latest jobs" do
    ruby_dev = Job.make!(:title => "Ruby Developer")
    cs_dev = Job.make!(:title => "C# Developer")

    visit homepage
    page_should_have_job ruby_dev    
    page_should_have_job cs_dev
  end
end
