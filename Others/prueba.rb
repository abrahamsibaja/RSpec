class Animal

  attr_reader :description

  def desc description
    @description = description
  end

end

gato = Animal.new
gato.desc("Animal Peludo")
puts gato.description
