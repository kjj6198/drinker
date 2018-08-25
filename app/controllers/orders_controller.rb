class OrdersController < ApplicationController
  before_action :auth_google_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Menu.find(params[:menu_id]).orders.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @menu = Menu.find(params[:menu_id])
    @order = @menu.orders.new(order_params)
    @order.user_id = current_user.id

    if @menu.end_time < Time.now
      return redirect_to menu_path(@menu), notice: "本次訂單已經截止，沒有訂到就哭哭哦！"
    end

    respond_to do |format|
      if @order.save
        if @menu.is_full?
          @menu.update({ is_active: false })
        end
        format.html { redirect_to menu_path(@menu), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to menu_path(@menu), notice: @order.errors.full_messages.join(' ') }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    if @order.menu.end_time < Time.now
      return respond_to do |format|
        format.html { redirect_to menu_path(@order.menu), notice: '已經截止，無法進行修改' }
        format.json { render json: { message: "已經截止，無法進行修改" } }
      end
    end

    if @order.user_id != current_user.id
      return respond_to do |format|
        format.html { redirect_to menu_path(@order.menu), notice: '不可以修改別人的訂單！' }
        format.json { render json: { message: "已經截止，無法進行修改" } }
      end
    end

    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to menu_path(@order.menu), notice: 'Order was successfully updated.' }
        format.json { render @order, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit!
    end
end
