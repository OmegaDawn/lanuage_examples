// Mock API endpoint for demonstration
const WEATHER_API_URL = "https://api.example.com/weather";

// Function to fetch weather data
async function fetchWeather(city) {
    try {
        const response = await fetch(`${WEATHER_API_URL}?city=${encodeURIComponent(city)}`);
        if (!response.ok) {
            throw new Error("Network response was not ok");
        }
        const data = await response.json();
        return data;
    } catch (error) {
        console.error("Failed to fetch weather data:", error);
        return null;
    }
}

// Function to display weather information
function displayWeather(data) {
    if (data) {
        console.log(`Weather in ${data.city}: ${data.temperature}°C`);
        console.log(`Condition: ${data.condition}`);
    } else {
        console.log("No weather data available.");
    }
}

// Function to process weather data and provide advice
function provideWeatherAdvice(data) {
    if (!data) return;

    const advice = data.temperature > 30
        ? "It's very hot today. Stay hydrated!"
        : data.temperature < 0
        ? "It's freezing outside. Dress warmly!"
        : "The weather seems mild. Have a nice day!";

    console.log(`Advice: ${advice}`);
}

// Main function to run the weather utility
async function main(city) {
    console.log(`Fetching weather data for ${city}...`);
    const weatherData = await fetchWeather(city);
    displayWeather(weatherData);
    provideWeatherAdvice(weatherData);
}

// Run the utility with a sample city
main("New York");
