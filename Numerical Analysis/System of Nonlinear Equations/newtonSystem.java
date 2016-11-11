package com.d3rty.numericalanalysis;


import static java.lang.Math.*;

public class newtonSystem {

    public static void doMethod(double precision, double startX, double startY) {
        System.out.println("Newton method");

        double newX = startX;
        double newY = startY;
        double oldX = 0;
        double oldY = 0;
        int iterations = 0;

        while ((abs(newX - oldX) > precision) && (abs(newY - oldY) > precision)) {
            oldX = newX;
            oldY = newY;
            double jacobian = findDerivativeOfFunction1ByX(oldX, oldY) * findDerivativeOfFunction2ByY(oldX, oldY) -
                    findDerivativeOfFunction1ByY(oldX, oldY) * findDerivativeOfFunction2ByX(oldX, oldY);
            double modificationH = (findDerivativeOfFunction1ByY(oldX, oldY) * findFunction2(oldX, oldY) -
                    findFunction1(oldX, oldY) * findDerivativeOfFunction2ByY(oldX, oldY)) / jacobian;
            double modificationL = (findFunction1(oldX, oldY) * findDerivativeOfFunction2ByX(oldX, oldY) -
                    findDerivativeOfFunction1ByX(oldX, oldY) * findFunction2(oldX, oldY)) / jacobian;
            newX = oldX + modificationH;
            newY = oldY + modificationL;

            iterations++;
        }

        System.out.println("Iterations: " + iterations);
        System.out.println("Solution: " + newX + ", " + newY);
    }


    public static double findFunction1(double x, double y) {
        return y + cos(x - 1) - 0.8;
    }

    public static double findDerivativeOfFunction1ByX(double x, double y) {
        return -sin(x - 1);
    }

    public static double findDerivativeOfFunction1ByY(double x, double y) {
        return 1;
    }

    public static double findFunction2(double x, double y) {
        return x - cos(y) - 2;
    }

    public static double findDerivativeOfFunction2ByX(double x, double y) {
        return 1;
    }

    public static double findDerivativeOfFunction2ByY(double x, double y) {
        return sin(y);
    }
}
