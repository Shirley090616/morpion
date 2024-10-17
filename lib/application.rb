require_relative "game" # recherche le fichier dans le dossier 

class Application # penser à mettre la majuscule
    def perform # défini le deroulement du jeu
      game = Game.new
      game.status = :ongoing # statut du jeu en cours
  
      while game.status == :ongoing # le jeu tourne tant qu'il est en cours
        game.turn
      end
  
      puts "Fin de la partie." # indique la phrase fin de partie
    end
end
  
  Application.new.perform # cette ligne est importante et fait que la partie
  # commence, tourne en boucle et s'arrête une fois terminé
  