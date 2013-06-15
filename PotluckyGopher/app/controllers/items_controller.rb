class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  respond_to :json, :html

  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    p "ITEM NEW!!!!!!!!!!!"
    # render :json => render_to_string(:partial => 'items/single', :locals => {:item => @item}).to_json
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    p "Item Saved!!!!!!!!!!!!!"
    @item = Item.new(params[:item])
    if @item.save
      render :json => render_to_string(:partial => 'items/single', :locals => {:item => @item}).to_json
    else
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end
end
