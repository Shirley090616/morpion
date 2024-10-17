class BoardCase # classe de la case sur le plateau
    attr_accessor :value, :position #valeur de la case + position
# attr_accessor est un code qui donne la clé pour verifier
# et changer le contenu qui sont dans les fonctions
    def initialize(position)
        @position = position # donne la position et la garde en mémoire
        @value = " " # valeur de la case au depart "vide"
    end
end