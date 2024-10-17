require_relative "game"

class Application
    def perform
      game = Game.new
      game.status = :ongoing
  
      while game.status == :ongoing
        game.turn
      end
  
      puts "Fin de la partie."
    end
end
  
  Application.new.perform
  