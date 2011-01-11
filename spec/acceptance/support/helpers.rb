module HelperMethods
  def page_should_have_job(job)
    page.should have_content(job.title)
    page.should have_content(job.location.upcase)
    page.should have_content(job.company)
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance
