package com.d3rty.numericalanalysis;


import static java.lang.Math.exp;

public class Main {

    public static void main(String[] args) {

        eulerMethod.doMethod();
        RungeKutta2ndOrderMethod.doMethod();
        RungeKutta4ndOrderMethod.doMethod();
        adamsMethod.doMethod();
    }

    static double findDerivative(double x, double y) {
        return exp(x) - exp(-1 * x);
    }

    static double findFunction(double x) {
        return exp(-x) + exp(x) - 2;
    }

}
