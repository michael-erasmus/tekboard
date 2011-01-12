  class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def search
  end
end
