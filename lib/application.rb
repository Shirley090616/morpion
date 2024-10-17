require_relative "game" # recherche le fichier dans le dossier 

class Application # penser à mettre la majuscule
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
  