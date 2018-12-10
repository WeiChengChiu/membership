class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  layout 'admin'

  def index
    @products = Product.all
    @users = User.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    find_product
  end

  def update
    find_product

    if @product.update(product_params)
      flash[:notice] = "Successfully update #{@product.name}"
      redirect_to admin_products_path(@product)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :image)
  end

  def find_product
    @product = Product.find_by(id: params[:id])
  end
end
