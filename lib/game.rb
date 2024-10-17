require_relative "player"
require_relative "board"
require_relative "show"

class Game
    attr_accessor :player1, :player2, :current_player, :status
  
    def initialize
        @player1 = Player.new("Joueur 1", "X")
        @player2 = Player.new("Joueur 2", "O")
        @board = Board.new
        @current_player = @player1
        @status = :ongoing
        @show = Show.new
    end
  
    def turn
        loop do
            @show.display_board(@board) # Utilisation de Show pour afficher le plateau
            puts "#{@current_player.name}, où veux-tu jouer ? (ex : A1, B2...)"
            position = gets.chomp.upcase
       
            if @board.play_turn(position, @current_player.symbol)
                break
            else
            puts "Faites un autre choix"  
            end 
        end 
  
            if @board.victory?
                @show.display_board(@board)
                puts "#{@current_player.name} a gagné !"
                @status = :finished
            elsif @board.full?
                @show.display_board(@board)
                puts "Match nul !"
                @status = :finished
            else
                switch_player
            end

    end
  
    def switch_player
        @current_player = @current_player == @player1 ? @player2 : @player1
    end
end
  