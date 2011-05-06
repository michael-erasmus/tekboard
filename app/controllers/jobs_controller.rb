class JobsController < ApplicationController
  def index
    @jobs = Job.active.sort_by(&:activated_date).reverse

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
    render text: "You are not authorized to edit this job", :status => :unauthorized if @job.is_active?  
  end

  def create
    state = params[:preview] ? "preview" : "new"

    @job = Job.new(params[:job])
    @job.state = state
    if !@job.save
      render :action => 'new'
    else
      if state == "preview"
        redirect_to preview_job_path(@job)
      else
        render 'jobs/thanks'
      end
    end
  end

  def update
    state = params[:preview] ? "preview" : "new"
    @job = Job.find(params[:id])
    @job.state = state
    if !@job.save
      render :action => 'edit'
    else
      if state == 'preview'
        redirect_to preview_job_path(@job)
      else
        render 'jobs/thanks'
      end
    end
  end

  def preview
    @job = Job.find(params[:id])
  end
end
