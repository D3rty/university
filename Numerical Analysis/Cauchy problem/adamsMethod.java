package com.d3rty.numericalanalysis;

import static com.d3rty.numericalanalysis.Main.findDerivative;
import static com.d3rty.numericalanalysis.Main.findFunction;

public class adamsMethod {

    public static void doMethod() {

        System.out.print("\nadamsMethod");

        double a = 0;
        double b = 1;
        double h = 0.1;
        double n = (b - a) / h;
        double X[] = new double[(int) n + 1];
        double Y1[] = new double[(int) n + 1];
        double Yp[] = new double[(int) n + 1];
        double Fp[] = new double[(int) n + 1];
        double Y[] = new double[(int) n + 1];
        //calculate
        X[0] = a;
        Y[0] = 0;

        for (int i = 1; i <= 3; i++) {
            X[i] = a + i * h;
            Y1[i] = Y[i - 1] + h * findDerivative(X[i - 1], Y[i - 1]);
            Y[i] = Y[i - 1] + h * (findDerivative(X[i - 1], Y[i - 1]) + findDerivative(X[i], Y1[i])) / 2.0;
        }

        for (int i = 4; i <= n; i++) {
            X[i] = a + i * h;
            // Yp[i+1] = Y[i]+ h*(55*F(X[i],Y[i])-59*F(X[i-1],Y[i-1])+37*F(X[i-2],Y[i-2])-9*F(X[i-3],Y[i-3]))/24;
            // Fp[i+1] = F(X[i+1],Yp[i+1]);
            Y[i] = Y[i - 1] + h * (9.0 * findDerivative(X[i], Y[i]) + 19.0 *
                    findDerivative(X[i - 1], Y[i - 1]) - 5.0 * findDerivative(X[i - 2], Y[i - 2]) +
                    findDerivative(X[i - 3], Y[i - 3])) / 24.0;
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
