#include <iostream>
#include <vector>
#include <cmath>
#include <stdexcept>
#include <ctime>

// Constants
const double PI = 3.141592653589793;

// Function with loops, conditionals, and exception handling
double complexFunction(double x) {
    if (x < 0) throw std::invalid_argument("x must be non-negative");
    double result = 0;
    for (int i = 1; i <= 10; ++i) {
        result += std::pow(x, i) / std::tgamma(i + 1);  // std::tgamma(n+1) is factorial of n
        if (result > 100) break;
    }
    return result;
}

// Class definition with a method using multiple constructs
class MathOperations {
public:
    MathOperations(const std::vector<int>& values) : values(values) {}
    std::vector<int> computeSquares() {
        std::vector<int> squares;
        for (int value : values) {
            squares.push_back(value >= 0 ? value * value : -1);
        }
        return squares;
    }
private:
    std::vector<int> values;
};

int main() {
    // Date formatting
    std::time_t now = std::time(0);
    std::tm* ltm = std::localtime(&now);
    std::cout << "Hello, VS Code! Today is "
              << 1900 + ltm->tm_year << "-"
              << 1 + ltm->tm_mon << "-"
              << ltm->tm_mday << std::endl;

    // Function call with exception handling
    try {
        double result = complexFunction(5);
        std::cout << "Result of complexFunction(5): " << result << std::endl;
    } catch (const std::invalid_argument& e) {
        std::cout << "Error: " << e.what() << std::
