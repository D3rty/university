package com.d3rty.numericalanalysis;

public class Main {
    public static void main(String... args) {
        int a = 0;
        int b = 6;
        int n = 60; //колво отрезков
        double h = (double)(b - a) / n;
        double[] X = new double[n + 1];
        double[] Y = new double[n + 1];

        for (int i = 0; i < n + 1; i++) {
            X[i] = a + i * h;
            Y[i] = 1 / (1 + Math.sqrt(X[i]));
            //Y[i] = 1;
        }

        double resRectLeft = new Integrals().rectLeft(Y, h);
        System.out.println("Интеграл по квадратуре прямоугольника по левому краю: " + resRectLeft);

        double resRectRight = new Integrals().rectRight(Y, h);
        System.out.println("Интеграл по квадратуре прямоугольника по правому краю: " + resRectRight);

        double resCentralLine = new Integrals().centralLine(X, h);
        System.out.println("Интеграл по квадратуре прямоугольника по средней линии: " + resCentralLine);

        double resTrapezium = new Integrals().trapezium(Y, h);
        System.out.println("Интеграл по квадратуре трапеции: " + resTrapezium);

        double resSimpson = new Integrals().simpson(Y, h);
        System.out.println("Интеграл по квадратуре Симпсона: " + resSimpson);

        double resThreeOfEight = new Integrals().threeOfEight(Y, h);
        System.out.println("Интеграл по квадратуре '3/8': " + resThreeOfEight);

        double resGauss = new Integrals().gauss(a, b);
        System.out.println("Интеграл по квадратуре Гаусса: " + resGauss);

    }
}
