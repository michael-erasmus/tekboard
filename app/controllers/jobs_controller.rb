  class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def search
  end

  def show
    @job = Job.find(params[:id])
  end
end
