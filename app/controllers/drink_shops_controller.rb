class DrinkShopsController < ApplicationController
  before_action :auth_google_user!, except: [:index]
  before_action :set_drink_shop, only: [:show, :edit, :update, :destroy]

  # GET /drink_shops
  # GET /drink_shops.json
  def index
    @drink_shops = DrinkShop.all
  end

  # GET /drink_shops/1
  # GET /drink_shops/1.json
  def show
  end

  # GET /drink_shops/new
  def new
    @drink_shop = DrinkShop.new
  end

  # GET /drink_shops/1/edit
  def edit
  end

  # POST /drink_shops
  # POST /drink_shops.json
  def create
    @drink_shop = DrinkShop.new(drink_shop_params)

    respond_to do |format|
      if @drink_shop.save
        format.html { redirect_to @drink_shop, notice: 'Drink shop was successfully created.' }
        format.json { render :show, status: :created, location: @drink_shop }
      else
        format.html { render :new }
        format.json { render json: @drink_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drink_shops/1
  # PATCH/PUT /drink_shops/1.json
  def update
    respond_to do |format|
      if @drink_shop.update(drink_shop_params)
        format.html { redirect_to @drink_shop, notice: 'Drink shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink_shop }
      else
        format.html { render :edit }
        format.json { render json: @drink_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drink_shops/1
  # DELETE /drink_shops/1.json
  def destroy
    @drink_shop.destroy
    respond_to do |format|
      format.html { redirect_to drink_shops_url, notice: 'Drink shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink_shop
      @drink_shop = DrinkShop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_shop_params
      params.require(:drink_shop).permit(
        :name,
        :phone,
        :address,
        :comment,
        :image_url,
      )
    end
end
