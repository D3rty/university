package com.d3rty.numericalanalysis;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Locale;
import java.util.Scanner;

import static java.lang.Math.abs;

public class SeidelMethod {
    public static void main(String[] args) {
        int iteration = 0;
        Scanner scanner = new Scanner(System.in);
        scanner.useLocale(new Locale("Russian"));

        PrintWriter printWriter = new PrintWriter(System.out);

        int size;
        System.out.println("Size: ");
        size = scanner.nextInt();

        double[][] matrix = new double[size][size + 1];

        // Матрица будет иметь размер (size) x (size + 1),
        // c учетом столбца свободных членов
        System.out.println("Input matrix: ");
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size + 1; j++) {
                matrix[i][j] = scanner.nextDouble();
            }
        }

        for (int i = 0; i < matrix.length; i++) {
            System.out.println(Arrays.toString(matrix[i]));
        }

        // Проверка на сходимость
        double diagonal = 0;
        for (int i = 0; i < size; i++) {
            diagonal += abs(matrix[i][i]);
        }

        float sum = 0;
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                if (i != j) {
                    sum += abs(matrix[i][j]);
                }
                if (diagonal < sum) {
                    System.out.println("The matrix does not satisfy the condition of convergence"); System.exit(0);
                }
            }
        }

        double eps;
        System.out.println("Precision: ");
        eps = scanner.nextDouble();

        // Введем вектор значений неизвестных на предыдущей итерации,
        // размер которого равен числу строк в матрице, т.е. size,
        // причем согласно методу изначально заполняем его нулями
        double[] previousVariableValues = new double[size];
        for (int i = 0; i < size; i++) {
            previousVariableValues[i] = 0.0;
        }

        // Будем выполнять итерационный процесс до тех пор,
        // пока не будет достигнута необходимая точность
        while (true) {
            // Введем вектор значений неизвестных на текущем шаге
            double[] currentVariableValues = new double[size];

            // Посчитаем значения неизвестных на текущей итерации
            // в соответствии с теоретическими формулами
            for (int i = 0; i < size; i++) {
                // Инициализируем i-ую неизвестную значением
                // свободного члена i-ой строки матрицы
                currentVariableValues[i] = matrix[i][size];

                // Вычитаем сумму по всем отличным от i-ой неизвестным
                for (int j = 0; j < size; j++) {
                    // При j < i можем использовать уже посчитанные
                    // на этой итерации значения неизвестных
                    if (j < i) {
                        currentVariableValues[i] -= matrix[i][j] * currentVariableValues[j];
                    }

                    // При j > i используем значения с прошлой итерации
                    if (j > i) {
                        currentVariableValues[i] -= matrix[i][j] * previousVariableValues[j];
                    }
                }

                // Делим на коэффициент при i-ой неизвестной
                currentVariableValues[i] /= matrix[i][i];
            }

            // Посчитаем текущую погрешность относительно предыдущей итерации
            double error = 0.0;

            for (int i = 0; i < size; i++) {
                error += abs(currentVariableValues[i] - previousVariableValues[i]);

                iteration++;
            }

            // Если необходимая точность достигнута, то завершаем процесс
            if (error < eps) {
                break;
            }

            // Переходим к следующей итерации, так
            // что текущие значения неизвестных
            // становятся значениями на предыдущей итерации
            previousVariableValues = currentVariableValues;
        }

        // Выводим найденные значения неизвестных
        System.out.println("Iteration: " + iteration);
        System.out.println("Roots: ");
        for (int i = 0; i < size; i++) {
            printWriter.print(previousVariableValues[i] + " ");
        }

        // После выполнения программы необходимо закрыть
        // потоки ввода и вывода
        scanner.close();
        printWriter.close();

    }

}