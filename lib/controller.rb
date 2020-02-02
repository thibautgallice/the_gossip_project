require_relative 'view'
require_relative 'gossip'

class Controller

  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    my_gossip = Gossip.new(params["author_key"], params["content_key"])
    my_gossip.save
  end

  def index_gossips
    all_gossips = Gossip.all
    all_gossips_list = @view.index_gossips(all_gossips)
  end

  def delete_gossip
    ### recuperer la liste de gossip dans le model Gossip + return
    all_gossips = Gossip.all #j'ai un tableau avec les objets gossip à dispo avec les index

    ### afficher la liste des gossips depuis view (display gossip to delete) + return le choix du user
    index_to_delete = @view.index_gossips_to_delete(all_gossips) #return choix du user (entre 1 et X) (la position dans le array)

    ### envoyer le choix duser vers gossip.rb => voilà l'item à delete, le delete (return le delete)
    deleted_gossip = Gossip.save_temp_gossip_before_delete(index_to_delete, all_gossips) # stocker le gossip à delete pour l'afficher dans la confirmation plus tard

    Gossip.delete_gossip_index(index_to_delete) # delete le gossip
    
    #confirmer le delete en appellant une confirmation de delete dans view
    deleted_confirmation = @view.confirm_deleted_gossip(deleted_gossip)

    ### on re-affiche la liste pour montrer qu'il a bien disparu :)
    # all_gossips = Gossip.all
    # all_gossips_list = @view.index_gossips(all_gossips)
  end
end
