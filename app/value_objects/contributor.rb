class Contributor
  attr_reader :id, :name, :total

  def initialize(attributes)
    @id    = attributes['author']['id']
    @name  = attributes['author']['login']
    @total = attributes['total'].to_i
  end

  def <=>(other)
    total <=> other.total
  end
end
