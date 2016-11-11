package com.d3rty.methodsofcalculation;

import static com.d3rty.methodsofcalculation.Main.*;

public class ModifiedNewtonMethod {
    String method = "Modified Newton Method";
    double a = 0.3;
    double b = 0.9;
    double x = 0;
    double x0;
    int iteration = 0;

    public void findRoot() {
        if (findFunction(a) < 0) {
            x0 = b;
            while (findFunction(b) > accuracy) {
                x = b - findFunction(b) / findDerivativeOfFunction(x0);
                b = x;
                iteration++;
            }
        }

        if (findFunction(a) > 0) {
            x0 = a;
            while (findFunction(a) > accuracy) {
                x = a - findFunction(a) / findDerivativeOfFunction(x0);
                a = x;
                iteration++;
            }
        }

        printResult(method, iteration, x);
    }
}
