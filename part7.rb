class CartesianProduct
  include Enumerable
  # YOUR CODE HERE
  def initialize(a, b)
    @a = a
    @b = b
  end
    
  attr_accessor :a
  attr_accessor :b

  def each
    @a.each do |i|
      @b.each do |j|
        yield [i,j]
      end
    end
  end
end


c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
