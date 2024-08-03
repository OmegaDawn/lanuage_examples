use std::error::Error;
use std::fmt;

// Constants
const PI: f64 = std::f64::consts::PI;

// Custom error type
#[derive(Debug)]
struct ComplexFunctionError;

impl fmt::Display for ComplexFunctionError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "x must be non-negative")
    }
}

impl Error for ComplexFunctionError {}

// Function with loops, conditionals, and error handling
fn complex_function(x: f64) -> Result<f64, Box<dyn Error>> {
    if x < 0.0 {
        return Err(Box::new(ComplexFunctionError));
    }
    let mut result = 0.0;
    for i in 1..=10 {
        result += x.powi(i) / factorial(i) as f64;
        if result > 100.0 {
            break;
        }
    }
    Ok(result)
}

// Helper function to compute factorial
fn factorial(n: u32) -> u32 {
    (1..=n).product()
}

// Struct definition with a method
struct MathOperations {
    values: Vec<i32>,
}

impl MathOperations {
    fn compute_squares(&self) -> Vec<i32> {
        self.values.iter()
            .map(|&value| if value >= 0 { value * value } else { -1 })
            .collect()
    }
}

fn main() {
    // Date formatting
    let date_str = chrono::Local::now().format("%Y-%m-%d").to_string();
    println!("Hello, VS Code! Today is {}.", date_str);

    // Function call with error handling
    match complex_function(5.0) {
        Ok(result) => println!("Result of complex_function(5): {}", result),
        Err(e) => println!("Error: {}", e),
    }

    // Struct instantiation and method call
    let values = vec![1, -2, 3, 4];
    let math_ops = MathOperations { values };
    let squares = math_ops.compute_squares();
    println!("Squares: {:?}", squares);

    // Array comprehension using filtering and mapping
    let even_squares: Vec<i32> = math_ops.values.iter()
        .filter(|&&x| x % 2 == 0)
        .map(|&x| x * x)
        .collect();
    println!("Even squares: {:?}", even_squares);
}
