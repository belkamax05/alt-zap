package main

import (
	"fmt"

	"github.com/AlecAivazis/survey/v2"
)

func dialogTest() {
	var qs = []*survey.Question{
		{
			Name: "name",
			Prompt: &survey.Input{
				Message: "What is your name?",
			},
		},
		{
			Name: "age",
			Prompt: &survey.Input{
				Message: "What is your age?",
			},
		},
		{
			Name: "language",
			Prompt: &survey.Select{
				Message: "Choose a language:",
				Options: []string{"Go", "Python", "JavaScript", "C++", "Java", "Other"},
			},
		},
	}

	answers := struct {
		Name     string
		Age      string
		Language string
	}{}

	err := survey.Ask(qs, &answers)
	if err != nil {
		fmt.Println(err.Error())
		return
	}

	fmt.Printf("Hello, %s!\n", answers.Name)
	fmt.Printf("You are %s years old.\n", answers.Age)
	fmt.Printf("You like programming in %s.\n", answers.Language)
}
