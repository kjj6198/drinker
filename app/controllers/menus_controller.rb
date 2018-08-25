class MenusController < ApplicationController
  before_action :auth_google_user!, except: [:index, :unpaid]
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
  end

  def unpaid
    @menu = Menu.find(params[:menu_id])
    @unpaid_orders = @menu.orders.where.not(has_paid: :true)

    render json: @unpaid_orders
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = current_user.menus.build
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    if request.headers["Content-Type"] == "application/json"
      if bearer_token != ENV["DRINK_ACCESS_TOKEN"]
        return render json: { error: "no permission" }, status: :unauthorized
      end

      @user = User.find_by_email(params[:email])
      
      unless @user.present?
        return render json: { error: "can not found user" }, status: :not_found
      end

      @menu = @user.menus.new(menu_json_params)
      @menu.end_time = Time.now + params[:duration] * 60

      if @menu.save!
        return render json: @menu
      else
        return render json: @menu.errors, status: :unprocessable_entity
      end
    end

    @menu = current_user.menus.create(menu_params)

    if @menu.end_time < Time.now
      return render :new, flash[:notice] => "不得小於現在時間"
    end

    respond_to do |format|
      if @menu.save!
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update

    if @menu.user_id != current_user.id
      return render json: {}, status: 401
    end

    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def bearer_token
      pattern = /^Bearer /
      header  = request.headers["Authorization"] # <= env
      return header.gsub(pattern, '') if header && header.match(pattern)
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_json_params
      params.permit(
        :name,
        :channel,
        :drink_shop_id
      )
    end

    def menu_params
      params.require(:menu).permit(
        :max_count,
        :name,
        :end_time,
        :channel,
        :drink_shop_id
      )
    end

    def auth_google_user!
      if request.format == "application/json" || request.headers["Content-Type"] == "application/json"
      
      else
        unless current_user
          redirect_to user_google_oauth2_omniauth_authorize_path
        end
      end
    end
end
