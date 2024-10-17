require_relative "board_case"
class Board
    attr_accessor :cases, :position, :symbol
  
    def initialize
        @cases = {} # les cases vides sur le plateau
        # création des 9 cases+execution du code pour chaque element
        # lettre et chiffre pour les cases du plateau
        ("A".."C").each do |letter|
        (1..3).each { |number| @cases["#{letter}#{number}"] = BoardCase.new("#{letter}#{number}") }
      end
    end
  
    def play_turn(position, symbol) # Remplit la case choisie 
      # du joueur avec son symbole
        if @cases.has_key?(position) # si la position choisie existe
            if @cases[position].value == " "# si la case est vide
                @cases[position].value = symbol # on met le symbole
            else # sinon
                puts "Cette case est déjà prise! Choisissez une autre case." 
                return false 
            end 
          else
                puts "Cette case est déjà prise! Choisissez une autre case."
            return false
        end    
        true
    end
  
    def victory? # le joueur a gagne
      winning_combinations = [ # les combi du jeu possible
        ["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"], # Lignes
        ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"], # Colonnes
        ["A1", "B2", "C3"], ["A3", "B2", "C1"]  # Diagonales
  ]
        winning_combinations.each do |combo|
                values = combo.map { |pos| @cases[pos].value }
                # la position prend la valeur de la combi l'un
                #apres l'autre grace à | |
            if values.all? { |val| val == values.first && val != " "} 
                return true                 
            end       
        end
      false
    end
  
    def full? # Vérifie si les cases sont toutes rempli
      @cases.values.all? { |board_case| board_case.value != " " }
    end
end
  