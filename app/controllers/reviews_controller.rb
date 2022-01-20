class ReviewsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant_id = params[:restaurant_id]
    if @review.save
      redirect_to restaurant_path(params[:restaurant_id])
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
      render "restaurants/show"
    end
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
