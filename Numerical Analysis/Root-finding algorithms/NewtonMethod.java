package com.d3rty.methodsofcalculation;

import static com.d3rty.methodsofcalculation.Main.*;

public class NewtonMethod {
    String method = "Newton Method";
    double a = 0.3;
    double b = 0.9;
    double x = 0;
    int iteration = 0;

    public void findRoot() {
        if (findFunction(a) < 0) {
            while (findFunction(b) > accuracy) {
                x = b - findFunction(b) / findDerivativeOfFunction(b);
                b = x;
                iteration++;
            }
        }
        if (findFunction(a) > 0) {
            while (findFunction(a) > accuracy) {
                x = a - findFunction(a) / findDerivativeOfFunction(a);
                a = x;
                iteration++;
            }
        }

        printResult(method, iteration, x);
    }
}
