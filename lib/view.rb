class View

  def list_gossip_with_index(all_gossips_list)
      all_gossips_list.each_with_index do |gossip, index|
      puts "#{index+1} - #{gossip.content}, by #{gossip.author}"
    end
  end

  def create_gossip
    puts "Quel est l'auteur du Gossip ?"
    author = gets.chomp

    puts "Que dit le Gossip ?"
    content = gets.chomp
    
    return params = {"content_key" => content, "author_key" => author}
  end

  def index_gossips(all_gossips_list) # methode pour afficher les gossips
    puts "Voici la liste des Gossips :\n"
    list_gossip_with_index(all_gossips_list)
  end


  def index_gossips_to_delete(all_gossips_list) # methode pour afficher les gossips à supprimer
    puts "Voici la liste des Gossips que tu peux supprimer :\n"
    list_gossip_with_index(all_gossips_list)
    
    puts "Quel gossip souhaites-tu delete ? (choisi un chiffre)"
    print "> "
    index_to_delete = gets.chomp
    return index_to_delete
  end

  def confirm_deleted_gossip(deleted_gossip)
    puts "Le gossip de #{deleted_gossip.author}, qui disait #{deleted_gossip.content} a bien été supprimé."
  end

end

