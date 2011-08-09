class DeckItemsController < ApplicationController
  # GET /deck_items
  # GET /deck_items.xml
  def index
    @deck_items = DeckItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deck_items }
    end
  end

  # GET /deck_items/1
  # GET /deck_items/1.xml
  def show
    @deck_item = DeckItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deck_item }
    end
  end

  # GET /deck_items/new
  # GET /deck_items/new.xml
  def new
    @deck_item = DeckItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deck_item }
    end
  end

  # GET /deck_items/1/edit
  def edit
    @deck_item = DeckItem.find(params[:id])
  end

  # POST /deck_items
  # POST /deck_items.xml
  def create
    
    @deck = current_deck #Va definito nell'application controller, riga 118
    card = Card.find(params[:card_id])
    @deck_item = @deck.add_card_to_deck(card_id)
 #    @deck_item = DeckItem.new(params[:deck_item]) #originale

    respond_to do |format|
      if @deck_item.save
        format.html { redirect_to(@deck_item, :notice => 'Deck item was successfully created.') }
        format.xml  { render :xml => @deck_item, :status => :created, :location => @deck_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deck_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deck_items/1
  # PUT /deck_items/1.xml
  def update
    @deck_item = DeckItem.find(params[:id])

    respond_to do |format|
      if @deck_item.update_attributes(params[:deck_item])
        format.html { redirect_to(@deck_item, :notice => 'Deck item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deck_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deck_items/1
  # DELETE /deck_items/1.xml
  def destroy
    @deck_item = DeckItem.find(params[:id])
    @deck_item.destroy

    respond_to do |format|
      format.html { redirect_to(deck_items_url) }
      format.xml  { head :ok }
    end
  end
end
