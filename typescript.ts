interface Task {
    title: string;
    completed: boolean;
}

class TodoList {
    private tasks: Task[] = [];

    addTask(title: string): void {
        this.tasks.push({ title, completed: false });
        console.log(`Task added: ${title}`);
    }

    completeTask(title: string): void {
        const task = this.tasks.find(t => t.title === title);
        if (task) {
            task.completed = true;
            console.log(`Task completed: ${title}`);
        } else {
            console.log(`Task not found: ${title}`);
        }
    }

    listTasks(): void {
        console.log("To-Do List:");
        this.tasks.forEach(task => {
            console.log(`${task.title} - ${task.completed ? "Completed" : "Pending"}`);
        });
    }
}

// Main execution block
const todoList = new TodoList();
todoList.addTask("Learn TypeScript");
todoList.addTask("Build a TypeScript app");
todoList.listTasks();
todoList.completeTask("Learn TypeScript");
todoList.listTasks();
