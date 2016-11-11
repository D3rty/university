package com.d3rty.numericalanalysis;

import static com.d3rty.numericalanalysis.Main.findDerivative;
import static com.d3rty.numericalanalysis.Main.findFunction;

public class eulerMethod {

    public static void doMethod() {

        System.out.println("\neulerMethod");

        double a = 0;
        double b = 1;
        double h = 0.1;
        double n = (b - a) / h;
        double X[] = new double[(int) n + 1];
        double Y1[] = new double[(int) n + 1];
        double Y[] = new double[(int) n + 1];
        double trueY[] = new double[(int) n + 1];
        int counter = 0;
        //calculate
        X[0] = a;
        Y[0] = 0;
        for (int i = 1; i <= n; i++) {
            X[i] = a + i * h;
            Y1[i] = Y[i - 1] + h * findDerivative(X[i - 1], Y[i - 1]);
            Y[i] = Y[i - 1] + h * (findDerivative(X[i - 1], Y[i - 1]) + findDerivative(X[i], Y1[i])) / 2.0;
        }
        for (double i = 0, j=0; i <= 1; i+=0.1, j++) {
            trueY[(int) j] = findFunction(i);
            System.out.println("trueY[" + j + "]=" + findFunction(i));
        }
        //print results
//        for (int i = 0; i <= n; i++) {
//            System.out.println("X[" + i + "]=" + X[i]);
//        }
        System.out.println("");
        for (int i = 0; i <= n; i++) {
            System.out.println("Y[" + i + "]=" + Y[i]);
        }

    }

}
