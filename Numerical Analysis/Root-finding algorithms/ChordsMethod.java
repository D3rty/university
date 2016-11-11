package com.d3rty.methodsofcalculation;


import static com.d3rty.methodsofcalculation.Main.*;
import static java.lang.Math.abs;

public class ChordsMethod {
    String method = "Chord Method";
    double a = 0.3;
    double b = 0.9;
    double l = accuracy + 1;
    double x = 0;
    int iteration = 0;

    public void findRoot() {
        while (l > accuracy) {
            if (findFunction(a) > 0) {
                x = b;
                b = x - findFunction(x) * (x - a) / findFunction(x) - findFunction(a);
                l = abs(b - x);
            }
            if (findFunction(a) < 0) {
                x = a;
                a = x - findFunction(x) * (x - b) / findFunction(x) - findFunction(b);
                l = abs(a - x);
            }
            iteration++;
        }

        printResult(method, iteration, x);
    }

}
