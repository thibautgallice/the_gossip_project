require_relative 'controller'

class Router

  def initialize
    @controller = Controller.new
  end

  def perform

    puts "BIENVENUE DANS THE GOSSIP PROJECT"
    
    while true
      
      #on affiche le menu
      puts "Tu veux faire quoi jeune mouss' ?"
      puts "1. Je veux créer un gossip"
      puts "2. Afficher tous les potins"
      puts "3. Supprimer un potin"
      puts "4. Je veux quitter l'app"
      params = gets.chomp.to_i #on attend le choix de l'utilisateur

      case params

      when 1
        puts "Tu as choisi de créer un gossip"
        @controller.create_gossip
      when 2
        puts "Tu veux afficher tous les potins"
        @controller.index_gossips
      when 3
        puts "Tu veux supprimer un potin"
        @controller.delete_gossip
      when 4
        puts "a+"
        break
      else
        puts "Ce choix n'existe pas, merci de ressayer."
      end
    end
  end
end
