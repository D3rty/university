package com.d3rty.methodsofcalculation;

import static com.d3rty.methodsofcalculation.Main.*;
import static java.lang.Math.abs;

public class Dichotomy {
    String method = "Dichotomy";
    double a = 0.3;
    double b = 0.9;
    double c = (a + b) / 2;
    double x = 0;
    int iteration = 0;

    public void findRoot() {
        while (abs(b - c) > accuracy) {
            if (findFunction(a) * findFunction(c) <= 0) {
                x = c;
                b = c;
                c = (a + b) / 2;
            }
            if (findFunction(b) * findFunction(c) <= 0) {
                x = c;
                a = c;
                c = (a + b) / 2;
            }
            iteration++;
        }
        printResult(method, iteration, x);
    }

}
