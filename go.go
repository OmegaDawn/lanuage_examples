package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// Function to count word occurrences in a file
func countWords(filename string) (map[string]int, error) {
	wordCount := make(map[string]int)
	file, err := os.Open(filename)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		words := strings.Fields(line)
		for _, word := range words {
			word = strings.ToLower(word)
			wordCount[word]++
		}
	}
	if err := scanner.Err(); err != nil {
		return nil, err
	}

	return wordCount, nil
}

// Function to write word count results to a file
func writeResults(filename string, wordCount map[string]int) error {
	file, err := os.Create(filename)
	if err != nil {
		return err
	}
	defer file.Close()

	writer := bufio.NewWriter(file)
	for word, count := range wordCount {
		_, err := fmt.Fprintf(writer, "%s: %d\n", word, count)
		if err != nil {
			return err
		}
	}
	return writer.Flush()
}

func main() {
	if len(os.Args) < 3 {
		fmt.Println("Usage: go run main.go <inputfile> <outputfile>")
		return
	}

	inputFile := os.Args[1]
	outputFile := os.Args[2]

	wordCount, err := countWords(inputFile)
	if err != nil {
		fmt.Printf("Error reading file: %v\n", err)
		return
	}

	err = writeResults(outputFile, wordCount)
	if err != nil {
		fmt.Printf("Error writing file: %v\n", err)
		return
	}

	fmt.Println("Word count results have been written to", outputFile)
}
