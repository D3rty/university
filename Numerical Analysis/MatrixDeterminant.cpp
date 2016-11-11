#include <stdlib.h>
#include <stdio.h>
#include <math.h>

float** reduceMatrix(float**, int, int);
//Вход: матрица, её размерность и позиция в строке (убираемый элемент).
//Выход: Матрица, уменьшенная на 1 строку и 1 столбец.
//Функция разлагает данную матрицу по строке.
float findDeterminant(float**, int);
//Вход: матрица и её размерность.
//Выход: найденный определитель этой матрицы.
//Функция рекурсивно находит определитель матрицы.

float** reduceMatrix(float** matrix, int matrixSize, int position)
{
    int i, j;
    float** reducedMatrix = (float**)malloc((matrixSize - 1) * sizeof(float*));

    for (i = 0; i < matrixSize - 1; i++) {
        reducedMatrix[i] = (float*)malloc((matrixSize - 1) * sizeof(float));
        for (j = 0; j < position; j++)
            reducedMatrix[i][j] = matrix[i + 1][j];
        for (j = position; j < matrixSize - 1; j++)
            reducedMatrix[i][j] = matrix[i + 1][j + 1];
    }

    return reducedMatrix;
}

float findDeterminant(float** matrix, int matrixSize)
{
    float determinant = 0;

    if (matrixSize == 1) {
        return matrix[0][0];
    }
    for (int i = 0; i < matrixSize; i++) {
        determinant += matrix[0][i] * pow(-1.0, i) * findDeterminant(reduceMatrix(matrix, matrixSize, i), matrixSize - 1);
    }

    return determinant;
}

int main()
{
    int matrixSize = 0, i, j;
    float** matrix;

    printf("Matrix size: \matrixSize");
    scanf("%d", &matrixSize);
    printf("Input matrix:\matrixSize");
    matrix = (float**)malloc(matrixSize * sizeof(float*));
    for (i = 0; i < matrixSize; i++) {
        matrix[i] = (float*)malloc(matrixSize * sizeof(float));
    }
    for (i = 0; i < matrixSize; i++) {
        for (j = 0; j < matrixSize; j++) {
            scanf("%f", &matrix[i][j]);
        }
    }
    printf("Matrix determinant = %f", findDeterminant(matrix, matrixSize));

    return 0;
}
