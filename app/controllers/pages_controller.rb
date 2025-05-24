class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :sitemap]

  def home
    @contact = Contact.new
    @works = Work.all
    @work = Work.new
    @review = Review.new
    @reviews = Review.all
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to action: :sent
    else
      flash.now[:error] = 'Could not send message'
        render :new, status: :unprocessable_entity
    end
  end

  def sitemap
    @reviews = Review.all
  end
end
