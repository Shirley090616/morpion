class BoardCase
    attr_accessor :value, :position #valeur de la case + position

    def initialize(position)
        @position = position
        @value = " " # valeur de depart vide
    end
end