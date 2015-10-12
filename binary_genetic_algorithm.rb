# Binary Genetic Algorithms 
# Problem URL: http://www.codewars.com/kata/binary-genetic-algorithms/ruby
# Short desc: Solve the equation without knowing it using genetic algorithm

class GeneticAlgorithm
  def generate length
    return rand(0..2**length)
  end
  
  def select population, fitnesses
    ret = []
    while ret.length != 2
      population.each do |x|
        break if ret.length == 2
        ret << x if fitnesses[x] > rand() 
      end
    end
    ret
  end
  
  def mutate chromosome, p
    length = chromosome.to_s(2).length
    pos = 1 << length - 1
    #print "\npos start: #{pos}\n"
    while pos > 1
      #print "\nchromosome: #{chromosome}\n"
      #print "\npos: #{pos}\n"
      chromosome ^=pos if rand() <= p
      pos >>= 1
    end
    return chromosome
  end
  
  def crossover chromosome1, chromosome2, length
    cutover = rand(1..length)
    s1 = chromosome1.to_s(2).rjust(length, '0')
    s2 = chromosome2.to_s(2).rjust(length, '0')
    [(s1[0..(cutover-1)] + s2[cutover..-1]).to_i(2),
     (s2[0..(cutover-1)] + s1[cutover..-1]).to_i(2)]  
  end
  
  def run fitness, length, p_c, p_m, iterations=200
    pop_size = 200
    population = (0..pop_size).map{ generate(length) }
    fitnesses = {}
    population.map { |x| fitnesses[x]=fitness.(x) }
    population = population.sort_by { |x| fitnesses[x] }.reverse
    (0..iterations).each do |iter|
      fitnesses = {}
      population.map { |x| fitnesses[x]=fitness.(x) }
      population = population.sort_by { |x| fitnesses[x] }.reverse
      return population[0] if fitnesses[population[0]] == 1
      new_population = []
      while new_population.length < population.length
        candidates = select(population, fitnesses)
        candidates.map! {|x| mutate(x, p_m)}
        candidates = crossover(*candidates, length) if rand() < p_c
        new_population += candidates
      end
      population = new_population
    end
    population[0]
  end
end
