class ReviewsController < ApplicationController
  def create
  	@product = Product.find(params[:product_id])
  	@review = @product.reviews.build(reviews_params)
  	@review.save
  	if @review.save
  		redirect_to @product, notice: "el comentario fue ingresado"
  	else
  		redirect_to @product, notice: "el comentario no fue ingresado"
  	end
  end

  end

  def reviews_params
  	params.require(:review).permit(:content)
  end
end
