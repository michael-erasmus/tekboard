module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    "/"
  end
  def job_new
    "jobs/new"
  end
end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
