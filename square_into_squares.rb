# Square into Squares. Protect trees! 
# Problem URL: http://www.codewars.com/kata/square-into-squares-protect-trees/ruby 
# Short desc: 
#   Given a positive integral number n, return a strictly increasing sequence
#   (list/array/string depending on the language) of numbers,
#   so that the sum of the squares is equal to n².
#   If there are multiple solutions (and there will be),
#   return the result with the largest possible values:
# Examples:
#   decompose 50 `shouldBe` Just [1,3,5,8,49]
#   decompose 4  `shouldBe` Nothing

def decompose(n)
  @solution = nil
  def dfs(nn, visited=[])
    @solution = visited if nn == 0
    return if @solution
    return nil if nn < 0
    (nn**0.5).to_i.downto(1).map{|x| x**2 }.each do |x|
      next if visited.include?(x)
      dfs(nn-x, visited + [x])
    end
  end
  dfs(n**2 - (n-1)**2)
  @solution.map { |x| (x**0.5).to_i}.sort + [n-1]  
end
