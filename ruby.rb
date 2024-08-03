# Constants
PI = Math::PI

# Function with loops, conditionals, and exception handling
def complex_function(x)
  raise ArgumentError, 'x must be non-negative' if x < 0
  result = 0
  (1..10).each do |i|
    result += (x**i) / factorial(i)
    break if result > 100
  end
  result
end

# Helper function to compute factorial
def factorial(n)
  return 1 if n == 0
  (1..n).inject(:*)
end

# Class definition with a method using multiple constructs
class MathOperations
  def initialize(values)
    @values = values
  end

  def compute_squares
    @values.map { |value| value >= 0 ? value**2 : -1 }
  end
end

# Main execution block
if __FILE__ == $PROGRAM_NAME
  # Date formatting
  puts "Hello, VS Code! Today is #{Time.now.strftime('%Y-%m-%d')}."

  # Function call with exception handling
  begin
    result = complex_function(5)
    puts "Result of complex_function(5): #{result}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  # Class instantiation and method call
  values = [1, -2, 3, 4]
  math_ops = MathOperations.new(values)
  squares = math_ops.compute_squares
  puts "Squares: #{squares.join(' ')}"

  # Array comprehension using map and select
  even_squares = values.select { |x| x.even? }.map { |x| x**2 }
  puts "Even squares: #{even_squares.join(' ')}"
end
