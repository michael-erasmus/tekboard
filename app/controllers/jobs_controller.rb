class JobsController < ApplicationController
  def index
    @jobs = Job.active.shuffle #All jobs have an equal chance of being first  

    respond_to do |format|
      format.html # index.haml
      format.rss { render :layout => false } #index.rss.builder
    end
  end

  def search
  end

  def show
    @job = Job.find(params[:id])

  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])

  end

  def create
    state = params[:preview] ? "preview" : "new"

    @job = Job.new(params[:job].merge(:state => state))

    if !@job.save
      render :action => 'new'
    else
      if state == "preview"
        redirect_to preview_job_path(@job)
      else
        render 'jobs/thanks'
        JobsMailer.new_job(@job).deliver
      end
    end
  end

  def update
    state = params[:preview] ? "preview" : "update"
    @job = Job.find(params[:id])
    if !@job.save
      render :action => 'edit'
    else
      if state == 'preview'
        redirect_to preview_job_path(@job)
      else
        render 'jobs/thanks'
        JobsMailer.new_job(@job).deliver
      end
    end
  end

  def preview
    @job = Job.find(params[:id])
  end
end
