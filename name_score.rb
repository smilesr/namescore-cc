class NameScore

  def initialize
    @arr = []
    @alpha = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    @name_value = {}
  end

  def read_file
    file = File.open("p022_names.txt", "r")
   
    file.read.split(",").each do |word|
      @arr << word.gsub!(/\A"|"\Z/, '')
    end
    
    file.close
  end

  def alphabetize
    @arr.sort!
  end

  def name_value
    total = 0
    @arr.each do |name|
      name.downcase.split("").each do |x|
      
        tally = @alpha.find_index(x)+1
        total += tally
      end
      @name_value[name] = total
      total = 0
    end
  end

  def name_score
    score = 0
    total_score = 0
    @arr.each do |name|
      score = @name_value[name] * (@arr.find_index(name) + 1)
      total_score += score
    end
    total_score
  end

end

run1 = NameScore.new
run1.read_file
run1.alphabetize
run1.name_value
sum = run1.name_score
puts sum