using System;

class Program
{
    // Method to convert Celsius to Fahrenheit
    static double CelsiusToFahrenheit(double celsius)
    {
        return (celsius * 9 / 5) + 32;
    }

    // Method to convert Fahrenheit to Celsius
    static double FahrenheitToCelsius(double fahrenheit)
    {
        return (fahrenheit - 32) * 5 / 9;
    }

    static void Main(string[] args)
    {
        Console.WriteLine("Temperature Conversion Utility");
        Console.WriteLine("1. Celsius to Fahrenheit");
        Console.WriteLine("2. Fahrenheit to Celsius");
        Console.Write("Choose an option (1 or 2): ");

        var option = Console.ReadLine();

        double temp, result;

        switch (option)
        {
            case "1":
                Console.Write("Enter temperature in Celsius: ");
                if (double.TryParse(Console.ReadLine(), out temp))
                {
                    result = CelsiusToFahrenheit(temp);
                    Console.WriteLine($"{temp}°C is {result}°F");
                }
                else
                {
                    Console.WriteLine("Invalid input.");
                }
                break;

            case "2":
                Console.Write("Enter temperature in Fahrenheit: ");
                if (double.TryParse(Console.ReadLine(), out temp))
                {
                    result = FahrenheitToCelsius(temp);
                    Console.WriteLine($"{temp}°F is {result}°C");
                }
                else
                {
                    Console.WriteLine("Invalid input.");
                }
                break;

            default:
                Console.WriteLine("Invalid option.");
                break;
        }
    }
}
