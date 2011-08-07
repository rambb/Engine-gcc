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

    abilities = @card.abilities.split(",") #old
   
    @abilities_array = [] #array finale

#    @abilities.each do |a|

      #ability = Ability.find(a)
     # @abilities_array.push(ability)
     
      for ability_id in abilities
#        @ability = Ability.find(ability_id)
        ability = Ability.find(ability_id)


        effects_id = ability.type_id.split(",")
        effect_summary = []
        for effect_id in effects_id
            effect = Effect.find(effect_id)
            effect_summary.push({ :description => effect.description, :routines => effect.routines})
        end

        ability_summary= { :cost => ability.cost,
                          :target => ability.target,
                          :quantity => ability.quantity,
                          :effects => effect_summary,      
                          :title => ability.title }
                        
        @abilities_array.push(ability_summary)
#     effects = @ability.type_id.split(",") #old
#        for effect_id in @abilities_array

    
#      @abilities_array.push()

      #@ability2 = Effect.find (@ability.type_id
        
      #@effects.each do |e|
      #    #@ability_array.push(e) 
      #    @effect_array = e
      #end
    end

#RAILS_DEFAULT_LOGGER.debug "ciao"
RAILS_DEFAULT_LOGGER.debug @abilities_array.inspect   

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
