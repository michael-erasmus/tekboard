require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Job Posting", %q{
  In order to have my ad on the site 
  As a employer 
  I want to post a new job
} do

  scenario "Posting a job" do
    visit job_new
    fill_in 'job_title', :with => "Js Developer"
    fill_in 'job_location', :with => "Cape Town"
    fill_in 'job_description', :with => "We need a ruby dev"
    fill_in 'job_application_instructions', :with => "Email us"
    fill_in 'job_company', :with => "19Days"
    fill_in 'job_company_link', :with => "http://19days.com"
    fill_in 'job_company_email', :with => "john@19days"
    click_button "Create Job Posting" 

    page.should have_content("Thank you for creating this job")

    Job.all.index{|job| job.title == "Js Developer"}.should be_true
  end
end
