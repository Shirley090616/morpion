# show.rb
class Show
    def display_board(board)
      puts "   1   2   3" # Affiche les numéros de colonnes
      ("A".."C").each do |letter|  # Pour chaque ligne (A, B, C)
        row = "#{letter} " # Commence la ligne avec la lettre de la ligne
        row += "#{board.cases["#{letter}1"].value} | #{board.cases["#{letter}2"].value} | #{board.cases["#{letter}3"].value}"
        puts row # Affiche la ligne
        puts "---------"
      end
    end
  end
  