class CardsController < ApplicationController
  # GET /cards
  # GET /cards.xml
  def index
    @cards = Card.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cards }
    end
  end

  # GET /cards/1
  # GET /cards/1.xml
  def show
    @card = Card.find(params[:id])

    abilities_id = @card.abilities.split(",") #old
   
    @abilities_array = [] #array finale

     
    for ability_id in abilities_id
      ability = Ability.find(ability_id)

      ability_summary= { :cost => ability.cost,
                        :effect => ability.effect,
                        :effect_code => ability.effect_code,
                        :title => ability.title }
                      
      @abilities_array.push(ability_summary)

    end

    powers_id = @card.special_powers.split(",") #old
    @powers_array = [] #array finale

    for power_id in powers_id
      power = Power.find(power_id)
                         
      @powers_array.push(power.name)
    end
#RAILS_DEFAULT_LOGGER.debug "ciao"
Rails.logger "ciao2"
#RAILS_DEFAULT_LOGGER.debug @abilities_array.inspect   

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/new
  # GET /cards/new.xml
  def new
    @card = Card.new
    @all_expansions = Expansion.find(:all, :order=>"name")
    @all_card_types = CardType.find(:all, :order=>"id")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
    @all_expansions = Expansion.find(:all, :order=>"name")
    @all_card_types = CardType.find(:all, :order=>"id")
  end

  # POST /cards
  # POST /cards.xml
  def create
    @card = Card.new(params[:card])

    respond_to do |format|
      if @card.save
        format.html { redirect_to(@card, :notice => 'Card was successfully created.') }
        format.xml  { render :xml => @card, :status => :created, :location => @card }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.xml
  def update
    @card = Card.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to(@card, :notice => 'Card was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.xml
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to(cards_url) }
      format.xml  { head :ok }
    end
  end
end
