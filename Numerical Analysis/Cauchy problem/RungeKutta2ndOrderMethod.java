package com.d3rty.numericalanalysis;

import static com.d3rty.numericalanalysis.Main.findDerivative;

public class RungeKutta2ndOrderMethod {

    public static void doMethod() {

        System.out.print("\nRungeKutta2ndOrderMethod");

        double a = 0;
        double b = 1;
        double h = 0.1;
        double n = (b - a) / h;
        double X[] = new double[(int) n + 1];
        double Y1[] = new double[(int) n + 1];
        double Y2[] = new double[(int) n + 1];
        double Y3[] = new double[(int) n + 1];
        double Y4[] = new double[(int) n + 1];
        double Y[] = new double[(int) n + 1];
        //calculate
        X[0] = a;
        Y[0] = 0;
        for (int i = 1; i <= n; i++) {
            X[i] = a + i * h;
            Y1[i] = h * findDerivative(X[i - 1], Y[i - 1]);
            Y2[i] = h * findDerivative(X[i - 1] + h, Y[i - 1] + Y1[i]);
            Y[i] = Y[i - 1] + (Y1[i] + Y2[i]) / 2;
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
