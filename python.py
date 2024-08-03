# Import statements
import math
from datetime import datetime as dt

# Constants
PI = math.pi

# Function with loops, conditionals, and error handling
def complex_function(x: float) -> float:
    """Complex function with multiple constructs"""
    if x < 0:
        raise ValueError("x must be non-negative")
    result = 0
    for i in range(1, 11):
        result += (x ** i) / math.factorial(i)
        if result > 100:
            break
    return result

# Class definition with method using multiple constructs
class MathOperations:
    def __init__(self, values):
        self.values = values

    def compute_squares(self):
        squares = []
        for value in self.values:
            if value >= 0:
                squares.append(value ** 2)
            else:
                squares.append(None)
        return squares

# Main execution block
if __name__ == "__main__":
    # String formatting and date
    print(f"Hello, VS Code! Today is {dt.now():%Y-%m-%d}.")

    # Function call with error handling
    try:
        result = complex_function(5)
        print(f"Result of complex_function(5): {result}")
    except ValueError as e:
        print(f"Error: {e}")

    # Class instantiation and method call
    math_ops = MathOperations([1, -2, 3, 4])
    squares = math_ops.compute_squares()
    print(f"Squares: {squares}")

    # List comprehension
    even_squares = [x ** 2 for x in range(10) if x % 2 == 0]
    print(f"Even squares: {even_squares}")
