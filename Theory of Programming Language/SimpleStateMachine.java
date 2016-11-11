package com.d3rty.langtheory;

import java.util.Scanner;

public class SimpleStateMachine {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        char currentState = 'H';
        System.out.print("Enter the string: ");
        String input = scanner.next();

        for (int i = 0; i < input.length(); i++) {
            switch (currentState) {
                case 'H': {
                    switch (input.charAt(i)) {
                        case 'a': {
                            currentState = 'A';
                            break;
                        }
                        case 'b': {
                            currentState = 'B';
                            break;
                        }
                        default: {
                            currentState = 'E';
                            break;
                        }
                    }
                    break;
                }
                case 'A': {
                    switch (input.charAt(i)) {
                        case 'b': {
                            currentState = 'C';
                            break;
                        }
                        default: {
                            currentState = 'E';
                            break;
                        }
                    }
                    break;
                }
                case 'B': {
                    switch (input.charAt(i)) {
                        case 'a': {
                            currentState = 'C';
                            break;
                        }
                        default: {
                            currentState = 'E';
                            break;
                        }
                    }
                    break;
                }
                case 'C': {
                    switch (input.charAt(i)) {
                        case '#': {
                            currentState = 'S';
                            break;
                        }
                        case 'b': {
                            currentState = 'B';
                            break;
                        }
                        case 'a': {
                            currentState = 'A';
                            break;
                        }
                        default: {
                            currentState = 'E';
                            break;
                        }
                    }
                    break;
                }
                case 'S': {
                    switch (input.charAt(i)) {
                        case '#': {
                            currentState = 'S';
                            break;
                        }
                        default: {
                            currentState = 'E';
                            break;
                        }
                    }
                    break;
                }
            }

        }

        System.out.print("Current state is " + "'" + currentState + "'" + "\n");

        if (currentState == 'E') {
            System.out.print("Something wrong");
        }

    }
}
