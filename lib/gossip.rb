require 'csv'

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    gossip_csv = File.open("db/gossip.csv", "a")
    gossip_csv.puts("#{@author},#{@content}")
    gossip_csv.close
  end

  def self.all
    all_gossips = []

    file = File.open("db/gossip.csv", "r")

    file.each_line do |line|
      fields = line.split(',')
      gossip = Gossip.new(fields[0], fields[1])
      all_gossips << gossip
    end

    return all_gossips
  end

  # def self.all_with_index
  #   all_gossips = []
  #   file = File.open("db/gossip.csv", "r")

  #   file.each_line do |line|
  #     fields = line.split(',')
  #     gossip = Gossip.new(fields[0], fields[1])
  #     all_gossips << gossip
  #   end

  #   return all_gossips
  # end

  def self.save_temp_gossip_before_delete(index_to_delete, all_gossips)
    deleted_gossip = all_gossips[index_to_delete.to_i - 1] # stocke l'élément
    return deleted_gossip
  end

  def self.delete_gossip_index(index_to_delete)
    i = index_to_delete.to_i - 1
    # all_gossips = all_gossips.delete_at(i) # supprime l'élément

    gossip_csv = CSV.read('db/gossip.csv')
    gossip_csv.delete(i)
    return gossip_csv
  end
end