class OrdersController < ApplicationController


  include CreateCart 
  
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :current_cart, only: [:new, :create , :show, :index]
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
   puts "----------------------#{params.inspect}" 
    puts "this is the value of cart#{@cart.line_items.inspect}"
    if @cart.line_items.empty?
       render root_url     
    end
     @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create

    @order = Order.new(order_params)    

    respond_to do |format|

      if @order.save
        puts "-----------------------#{@cart.line_items}*****************"
        @line_item1 = @cart.line_items.where(:cart_id => session[:cart_id])
   
        @line_item1.update_all(order_id:  @order.id)
        session[:cart_id] = nil
        flash[:notice] = "Thank you for purchase..."
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
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
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
end

# // > capturing the order delails(i.e implement the create action of order controller.) 
# //  1) Capture the values from the form to populate a new Order model object.
# //  2)Add the line items from our cart to that order.
# //  3)validate and save the order.If this fails, display the appropriate messages and let the user correct any problems.
# //  4)Once the order is successfully saved,delete the cart,redisplay the catalog page, and display a message confirming that the line item to 
# //    the order.
