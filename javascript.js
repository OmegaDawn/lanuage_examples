// Constants
const PI = Math.PI;

// Function with loops, conditionals, and error handling
function complexFunction(x) {
    if (x < 0) throw new Error("x must be non-negative");
    let result = 0;
    for (let i = 1; i <= 10; i++) {
        result += Math.pow(x, i) / factorial(i);
        if (result > 100) break;
    }
    return result;
}

// Helper function to compute factorial
function factorial(n) {
    if (n === 0) return 1;
    let fact = 1;
    for (let i = 1; i <= n; i++) {
        fact *= i;
    }
    return fact;
}

// Class definition with a method using multiple constructs
class MathOperations {
    constructor(values) {
        this.values = values;
    }

    computeSquares() {
        return this.values.map(value => value >= 0 ? value * value : -1);
    }
}

function main() {
    // Date formatting
    const now = new Date();
    const dateStr = now.toISOString().split('T')[0];
    console.log(`Hello, VS Code! Today is ${dateStr}.`);

    // Function call with exception handling
    try {
        const result = complexFunction(5);
        console.log(`Result of complexFunction(5): ${result}`);
    } catch (e) {
        console.error(`Error: ${e.message}`);
    }

    // Class instantiation and method call
    const values = [1, -2, 3, 4];
    const mathOps = new MathOperations(values);
    const squares = mathOps.computeSquares();
    console.log(`Squares: ${squares.join(' ')}`);

    // Array comprehension using map and filter
    const evenSquares = values.filter(x => x % 2 === 0).map(x => x * x);
    console.log(`Even squares: ${evenSquares.join(' ')}`);
}

// Run the main function
main();
