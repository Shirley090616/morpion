require_relative "board_case"
class Board
    attr_accessor :cases, :position, :symbol
  
    def initialize
      # Création de 9 instances de BoardCase
        @cases = {}
        ("A".."C").each do |letter|
        (1..3).each { |number| @cases["#{letter}#{number}"] = BoardCase.new("#{letter}#{number}") }
      end
    end
  
    def play_turn(position, symbol) # Remplit la case choisie du joueur
        if @cases.has_key?(position)
            if @cases[position].value == " "
                @cases[position].value = symbol 
            else
                puts "Cette case est déjà prise! Choisissez une autre case." 
                return false 
            end 
        else
            puts "Cette case est déjà prise! Choisissez une autre case."
            return false
        end    
        true
    end
  
    def victory?
      # Vérifie si un joueur a gagné
      winning_combinations = [
        ["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"], # Lignes
        ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"], # Colonnes
        ["A1", "B2", "C3"], ["A3", "B2", "C1"]  # Diagonales
  ]
        winning_combinations.each do |combo|
                values = combo.map { |pos| @cases[pos].value }
                
            if values.all? { |val| val == values.first && val != " "} 
                return true                 
            end       
        end
      false
    end
  
    def full?
      # Vérifie si le plateau est plein
      @cases.values.all? { |board_case| board_case.value != " " }
    end
end
  