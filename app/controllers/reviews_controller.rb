class ReviewsController < ApplicationController

  def top
    @reviews = Review.all.page(params[:page]).per(3)
  end

  def index
    if params[:smartphone_name]
    @reviews = Review.where('smartphone_name LIKE ?', "%#{params[:smartphone_name]}%")
    @reviews = @reviews.page(params[:page])
    else
    @reviews = Review.all.page(params[:page]).per(4)
    end
  end

  def new
   @review = Review.new
   @user = current_user
  end

  def show
    @review = Review.find(params[:id])
    @reviews = Review.all
  end

  def edit
    @review = Review.find(params[:id])
    @reviews = Review.all
  end

  def update
     @review = Review.find(params[:id])
     @review.update(review_params)
     redirect_to review_path(@review.id)
  end

  def destroy
  end

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      flash[:notice] = "投稿完了。"
      redirect_to reviews_path
    else
      flash[:alert] = "新規投稿内容に不備があります。"
      render :new
    end
  end


  private
  def review_params
      params.require(:review).permit(:smartphone_name, :manufacturer_name, :kuchikomi, :holding, :battery, :camera, :response, :image)
  end

end
