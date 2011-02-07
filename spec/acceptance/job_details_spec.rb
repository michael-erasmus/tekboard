require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Job Listing", %q{
  In order to find out more about a particular job
  As a job seeker 
  When I click on a job link
  I want to see the job detail
} do

  scenario "Click a job link and view the details" do
    ruby_dev = Job.make!(:title => "Ruby Developer")
    visit homepage

    click_link("Ruby Developer")
    current_path.should == "/jobs/#{ruby_dev.id}" 
  end
end
