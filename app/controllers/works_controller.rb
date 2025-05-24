class WorksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_work, only: %i[ show edit update destroy ]
  # GET /works
  def index
    @works = Work.all
  end

  # GET /works/1
  def show
  end

  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to @work, notice: "work was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /works/1
  def update
    if @work.update(work_params)
      redirect_to @work, notice: "work was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /works/1
  def destroy
    @work.destroy
    redirect_to works_url, notice: "work was successfully destroyed."
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(:name, :address)
  end
end
