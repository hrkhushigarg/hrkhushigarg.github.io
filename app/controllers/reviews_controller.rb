class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  before_action :set_work

  def new
    @work = Work.find(params[:work_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.work = @work
    if @review.save
    redirect_to work_path(@work)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index;
    if params[:work_id]  ;
      @work = Work.find_by_id(params[:work_id]);
      @reviews = work.reviews;
    else
        @reviews = Review.all;
    end
  end
  private

  def set_work
    @work = Work.find(params[:work_id])
  end

  def review_params
    params.require(:review).permit(:content, :name, :position)
  end
end
