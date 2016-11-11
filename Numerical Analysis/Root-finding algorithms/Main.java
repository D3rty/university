package com.d3rty.methodsofcalculation;

import static java.lang.Math.*;

public class Main {

    static String function = "sqrt(x) - cos(0.387 * x) = 0";
    static double accuracy = 0.000000001;

    public static void main(String[] args) {
        System.out.println("Function: " + function);
        System.out.println("Accuracy: " + accuracy);
        System.out.println("");

        Dichotomy method1 = new Dichotomy();
        method1.findRoot();
        System.out.println("");

        ChordsMethod method2 = new ChordsMethod();
        method2.findRoot();
        System.out.println("");

        NewtonMethod method3 = new NewtonMethod();
        method3.findRoot();
        System.out.println("");

        ModifiedNewtonMethod method4 = new ModifiedNewtonMethod();
        method4.findRoot();
        System.out.println("");

        ChebyshevMethod method5 = new ChebyshevMethod();
        method5.findRoot();
        System.out.println("");

        SimpleIterationsMethod method6 = new SimpleIterationsMethod();
        method6.findRoot();
        System.out.println("");
    }

    public static void printResult(String name, int iteration, double root) {
        System.out.println("Method: " + name);
        System.out.println("Number of iterations: " + iteration);
        System.out.println("Point: " + root);
    }

    public static double findFunction(double x) {
        return sqrt(x) - cos(0.387 * x);
    }

    public static double findDerivativeOfFunction(double x) {
        return 0.387 * sin(0.387 * x) + 1 / (2 * sqrt(x));
    }

    public static double findSecondDerivativeOfFunction(double x) {
        return -1 / (4 * pow(x, (3 / 2))) + 0.149769 * cos(0.387 * x);
    }

    public static double findEquivalentFunction(double x) {
        return pow(cos(0.387 * x), 2);
    }

    public static double findDerivativeOfEquivalentFunction(double x) {
        return -0.387 * sin(0.774 * x);
    }
}
