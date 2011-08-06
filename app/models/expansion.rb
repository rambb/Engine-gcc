class Expansion < ActiveRecord::Base
  has_many :cards, :dependent => :destroy #quando distruggo l'espansione distruggerò pure le carte corrispondenti
end
