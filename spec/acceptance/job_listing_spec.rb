require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Job Listing", %q{
  In order to check out the job market 
  As a job seeker 
  I want to look at all the lastest jobs
} do

  scenario "Browse the home page and see all the latest jobs" do
    ruby_dev = Job.create(:title => "Ruby Developer", :location => "Johannesburg, Gauteng")
    cs_dev = Job.create(:title => "C# Developer", :location => "Johannesburg, Gauteng")

    visit homepage
    page.should have_content(ruby_dev.title)
    page.should have_content(cs_dev.title)
    
    page.should have_content(ruby_dev.location)
    page.should have_content(cs_dev.location)
  end
end
