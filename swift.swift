import Foundation

// Define a class for Expense
class Expense {
    var name: String
    var amount: Double

    init(name: String, amount: Double) {
        self.name = name
        self.amount = amount
    }
}

// Define a class for ExpenseTracker
class ExpenseTracker {
    private var expenses: [Expense] = []

    func addExpense(name: String, amount: Double) {
        let expense = Expense(name: name, amount: amount)
        expenses.append(expense)
        print("Expense added: \(name) - $\(amount)")
    }

    func totalExpenses() -> Double {
        return expenses.reduce(0) { $0 + $1.amount }
    }

    func listExpenses() {
        print("Expense List:")
        for expense in expenses {
            print("\(expense.name) - $\(expense.amount)")
        }
    }
}

// Main execution block
let tracker = ExpenseTracker()
tracker.addExpense(name: "Coffee", amount: 3.50)
tracker.addExpense(name: "Lunch", amount: 12.00)
tracker.listExpenses()
print("Total Expenses: $\(tracker.totalExpenses())")
