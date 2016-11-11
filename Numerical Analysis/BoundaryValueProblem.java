package com.d3rty.numericalanalysis;

import static java.lang.Math.abs;

public class BoundaryValueProblem {

    public static void main(String[] args) {

        int n = 10;
        double a = 0.5, b = 0.8;
        double h = abs(b - a) / n;
        double k1 = 2, k2 = -1, r1 = 1;
        double l1 = 1, l2 = 0, r2 = 3;
        double A, B, C, F;
        double x, y;

        double alpha[] = new double[n + 1];
        double betta[] = new double[n + 1];

        System.out.println("Equation:\ny'' + 0.6xy' - 2y = 1;");
        System.out.println("y(1.5) = 0.6; \n2y(1,8) - 0.8y'(1.8) = 1;");
        System.out.println("\n[" + a + ", " + b + "]\th = " + h + ";");

        int i = 2;
        alpha[1] = -k2 / (k1 * h - k2);
        betta[1] = h * r1 / (k1 * h - k2);

        for (x = a + h; x <= b; x = x + h) {
            A = 1 / (h * h) - p(x) / (2 * h);
            B = 2 / (h * h) - q(x);
            C = 1 / (h * h) + p(x) / (2 * h);
            F = f(x);
            alpha[i] = -C / (A * alpha[i - 1] - B);
            betta[i] = (F - A * betta[i - 1]) / (A * alpha[i - 1] - B);
            i++;
            //printAlphaBeta(i, alpha[i - 1], betta[i - 1]);
        }

        System.out.println();
        int nn = n;
        y = r2 / (l1 + l2 / h - l2 * alpha[nn] / h - l2 * betta[nn] / h);
        x = b;
        printXY(x, y);
        for (i = n - 1; i >= 0; i--) {
            x = x - h;
            y = alpha[i + 1] * y + betta[i + 1];
            printXY(x, y);
        }
    }

    /*
    [a, b]
    y'' + p(x)*y' +q(x)*y = f(x)
    k1*y(a) + k2*y'(a) = r1
    l1*y(b) + l2*y'(b) = r2
     */
    static double f(double x) {
        return x;
    }

    static double p(double x) {
        return 2*x*x;
    }

    static double q(double x) {
        return 1;
    }

    static void printXY(double x, double y) {
        System.out.println("x = " + x + ";\ty = " + y + ";");
    }


    static void printAlphaBeta(int i, double a, double b) {
        System.out.println("x = " + i + ";\t\talpha = " + a + ";\tbetta = " + b + ";");
    }
}

