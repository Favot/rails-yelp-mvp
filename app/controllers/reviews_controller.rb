class ReviewsController < ApplicationController
  before_action :set_reviews, only: %i[index]
  before_action :set_review, only: %i[show]

  def index; end

  def new
    @review = Review.new # needed to instantiate the form_for
  end

  def create
    @review = Review.new(review_params)
    @review.save

    # no need for app/views/reviews/create.html.erb
    redirect_to review_path(@review)
  end

  def show; end

  private

  def review_params
    params.require(:review).permit(:name, :rating, :content, :restaurant_id)
  end

  def set_reviews
    @reviews = Review.all
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
