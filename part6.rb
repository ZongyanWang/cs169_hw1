class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
  if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      super
    end
  end
 
end

class String
  # YOUR CODE HERE
  def palindrome?
    self.gsub(/([^a-z])/i, "").downcase == self.gsub(/([^a-z])/i, "").downcase.reverse
  end
end

module Enumerable
  # YOUR CODE HEREo    
  def palindrome?
    self.to_a.reverse == self.to_a
  end
end



1.dollar.in(:dollar)
10.rupees.in(:rupees)
5.dollars.in(:euros)
10.euros.in(:rupees)

"foo".palindrome?
"Madam, I'm Adam!".palindrome?
"A man, a plan, a canal -- Panama".palindrome?

[1,2,3,2,1].palindrome?
[12,2,3,2,12].palindrome?
["java","ruby","c##","ruby","java"].palindrome?
[ [1,2,3],[3,4],[1,2,3] ].palindrome?
[ [1,2,3],[3,4],[3,2,1] ].palindrome?
{ "a"=>["a", "b", "c"], "b"=>["b", "c"], "a"=>["a", "b", "c"]}.palindrome?
