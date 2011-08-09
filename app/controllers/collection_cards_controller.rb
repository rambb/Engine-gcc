class CollectionCardsController < ApplicationController
  # GET /collection_cards
  # GET /collection_cards.xml
  def index
    @collection_cards = CollectionCard.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @collection_cards }
    end
  end

  # GET /collection_cards/1
  # GET /collection_cards/1.xml
  def show
    @collection_card = CollectionCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @collection_card }
    end
  end

  # GET /collection_cards/new
  # GET /collection_cards/new.xml
  def new
    @collection_card = CollectionCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @collection_card }
    end
  end

  # GET /collection_cards/1/edit
  def edit
    @collection_card = CollectionCard.find(params[:id])
  end

  # POST /collection_cards
  # POST /collection_cards.xml
  def create

    @user = current_user
    card = Card.find(params[:card_id])
    @collection_card = @user.add_card_to_collection(card_id)
#    @collection_card = CollectionCard.new(params[:collection_card])

    respond_to do |format|
      if @collection_card.save
        format.html { redirect_to(@collection_card, :notice => 'Collection card was successfully created.') }
        format.xml  { render :xml => @collection_card, :status => :created, :location => @collection_card }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @collection_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /collection_cards/1
  # PUT /collection_cards/1.xml
  def update
    @collection_card = CollectionCard.find(params[:id])

    respond_to do |format|
      if @collection_card.update_attributes(params[:collection_card])
        format.html { redirect_to(@collection_card, :notice => 'Collection card was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @collection_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_cards/1
  # DELETE /collection_cards/1.xml
  def destroy
    @collection_card = CollectionCard.find(params[:id])
    @collection_card.destroy

    respond_to do |format|
      format.html { redirect_to(collection_cards_url) }
      format.xml  { head :ok }
    end
  end
end
