package com.d3rty.numericalanalysis;

class Integrals {
    
    double rectLeft(double[] Y, double h) {
        double res = 0;
        for (int i = 0; i < Y.length - 1; i++) {
            res += Y[i];
        }

        return res * h;
    }

    double rectRight(double[] Y, double h) {
        double res = 0;
        for (int i = 1; i < Y.length; i++) {
            res += Y[i];
        }

        return res * h;
    }

    double centralLine(double[] X, double h) {
        double x;
        double[] Y = new double[X.length];
        double sum = 0;

        for (int i = 0; i < X.length - 1; i++) {
            x = (X[i] + X[i + 1]) / 2;
            Y[i] = 1 / (1 + Math.sqrt(x));
            //Y[i] = 1;
            sum += Y[i];
        }

        return sum * h;
    }

    double trapezium(double[] Y, double h) {
        double sum = Y[0] / 2 + Y[Y.length - 1] / 2;

        for (int i = 1; i < Y.length - 1; i++) {
            sum += Y[i];
        }

        return h * sum;
    }

    double simpson(double[] Y, double h) {
        double res = h / 3.;
        double sum = Y[0] + Y[Y.length - 1];

        for (int i = 1; i < Y.length - 1; i++) {
            if(i%2 == 0)
                sum += 2 * Y[i];
            else
                sum += 4 * Y[i];
        }

        return res * sum;
    }

    double threeOfEight(double[] Y, double h) {
        double res = 3. * h / 8.;
        double sum = Y[0] + Y[Y.length - 1];
        for (int i = 1; i < Y.length - 1; i++) {
            if (i % 3 == 0)
                sum += 2 * Y[i];
            else
                sum += 3 * Y[i];
        }

        return res * sum;
    }

    double gauss(double a, double b) {
        int l = 5;
        double[] A = new double[l];
        double[] t = new double[l];
        double[] X = new double[l];
        double[] Y = new double[l];
        double res = (b - a) / 2;
        double sum = 0;

        A[0] = 0.23692688;
        A[1] = 0.47862868;
        A[2] = 0.56888889;
        A[3] = A[1];
        A[4] = A[0];

        t[0] = -0.90617985;
        t[1] = -0.53846931;
        t[2] = 0;
        t[3] = -t[1];
        t[4] = -t[0];

        for (int i = 0; i < Y.length; i++) {
            X[i] = (b + a) / 2 + ((b - a) / 2) * t[i];
            Y[i] = 1 / (1 + Math.sqrt(X[i]));
            //Y[i] = 1;
            sum += A[i] * Y[i];
        }

        return res * sum;
    }
}
