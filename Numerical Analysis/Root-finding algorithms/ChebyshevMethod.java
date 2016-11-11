package com.d3rty.methodsofcalculation;

import static com.d3rty.methodsofcalculation.Main.*;

public class ChebyshevMethod {
    String method = "Chebyshev Method";
    double a = 0.3;
    double b = 0.9;
    double x = b;
    int iteration = 0;

    public void findRoot() {
        while (findFunction(x) > accuracy) {
            x = x - findFunction(x) / findDerivativeOfFunction(x) - findSecondDerivativeOfFunction(x) *
                    findFunction(x) * findFunction(x) / (2 * findDerivativeOfFunction(x) *
                    findDerivativeOfFunction(x) * findDerivativeOfFunction(x));
            iteration++;
        }

        printResult(method, iteration, x);
    }

}
