class User < Struct.new(:id, :name)

  def self.random
    id = rand(names.length)
    find(id)
  end

  def self.find(id)
    new(id, names[id]) if names[id].present?
  end

  def self.names
    @names ||= File.read(Rails.root.join('db', 'names.txt')).split("\n")
  end

end