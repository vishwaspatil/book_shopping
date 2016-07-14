class LineItemsController < ApplicationController

  require "createcart"

  include CreateCart 

  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :current_cart, only: [:create]
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create

    @cart = current_cart

    puts "-----#{@cart.inspect}"

    @line_item = @cart.line_items.find_by(:product_id => params[:product_id])

     puts "-----#{@line_item.inspect}"
    
    if @line_item.present?
       @line_item.update_attributes(:quantity => (@line_item.quantity.to_i + 1).to_s  )
    else
        @line_item = LineItem.new(:product_id => params[:product_id] , :cart_id => @cart.id)
        @line_item.save  
    end 
    
    respond_to do |format|
      if @cart
        format.html { redirect_to root_url, notice: 'Line item was successfully created.' }
        format.js { @current_item = @line_item }
        format.json { render :show, status: :created, location: @line_item }
        
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
 
end
