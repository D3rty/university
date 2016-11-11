package com.d3rty.methodsofcalculation;

import static com.d3rty.methodsofcalculation.Main.*;
import static java.lang.Math.abs;

public class SimpleIterationsMethod {
    String method = "Simple Iterations Method";
    double a = 0.3;
    double b = 0.9;
    double x = b;
    boolean noSolution;
    int iteration = 0;

    public void findRoot() {
        while (abs(a - x) > accuracy) {
            if (abs(findDerivativeOfEquivalentFunction(x)) > 1) {
                System.out.println("No solution");
                a = x;
                noSolution = true;
            } else {
                a = x;
                x = findEquivalentFunction(x);
                iteration++;
            }
        }
        if (!noSolution) {
            printResult(method, iteration, x);
        }
    }
}
