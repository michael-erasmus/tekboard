  class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def search
  end

  def show
    @job = Job.find(params[:id])
  end
  def new
    @job = Job.new
  end
  def create
    @job = Job.new(params[:job])

    @job.save
  end
end
