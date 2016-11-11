package com.d3rty.numericalanalysis;


import static java.lang.Math.abs;
import static java.lang.Math.cos;

public class simpleIterationsSystem {

    public static void doMethod(double precision, double startX, double startY) {
        System.out.println("Simple Iterations Method");

        double oldX = startX;
        double oldY = startY;
        double newX = 0;
        double newY = 0;
        int iterations = 0;

        while (iterations < 1000000) {
            newY = findFunction1(oldX, oldY);
            newX = findFunction2(oldX, oldY);
            if ((abs(newX - oldX) < precision) && (abs(newY - oldY) < precision)) {
                break;
            }
            oldX = newX;
            oldY = newY;
            iterations++;
        }

        System.out.println("Iterations: " + iterations);
        System.out.println("Solution: " + newX + ", " + newY);
    }


    public static double findFunction1(double x, double y) {
        return 0.8 - cos(x - 1);
    }

    public static double findFunction2(double x, double y) {
        return 2 + cos(y);
    }
}
