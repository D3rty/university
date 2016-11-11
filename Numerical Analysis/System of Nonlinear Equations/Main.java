package com.d3rty.numericalanalysis;

public class Main {

    public static void main(String[] args) {
        double precision = 0.001;
        double StartX = 2;
        double StartY = 3;

        System.out.println("");
        System.out.println("System of nonlinear equations:");
        System.out.println("y + cos(x - 1) = 0.8");
        System.out.println("x - cos(y) = 2");
        System.out.println("");

        System.out.println("Accuracy: " + precision);
        System.out.println("Initial values: (" + StartX + ", " + StartY + ")");
        System.out.println("");

        simpleIterationsSystem.doMethod(precision, StartX, StartY);
        System.out.println("");
        newtonSystem.doMethod(precision, StartX, StartY);
    }
}
