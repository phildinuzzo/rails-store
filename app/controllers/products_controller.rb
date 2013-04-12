class ProductsController < ApplicationController
  # GET /products
  # GET /products.json

  # attr_accessor :products
  # before_filter :products_defined
  before_filter :products_in_cart
  # # private :product_finder

  # def products_defined
  #   @products = Product.all
  # end

  def products_in_cart
    @products_in_cart = Product.where(:in_cart => true).all
  end


  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end



  def addcart
    @product = Product.find(params[:id])

  end

  def remcart
    @product = Product.find(params[:id])

  end

  # GET /products/1
  # GET /products/1.json
  def show
    # @review = Review.connection.select_all("SELECT "reviews".* FROM "reviews" WHERE "reviews"."product_id" = params[:id];")
    # # @review = Review.all
        @product = Product.find(params[:id])
    @review = Review.where(:product_id => params[:id]).all

    # Review.find(params[:id])
    
    # @pname = @products.find(params[:id]).name
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
        @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
          @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
