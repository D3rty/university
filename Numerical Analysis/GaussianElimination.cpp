#include "stdio.h"
#include "math.h"
#include "iostream"

#define N 10

using namespace std;

void inputMatrix(float A[N][N + 1], int n);

void outputMatrix(float A[N][N + 1], int n);

void doMatrixCalculation(float A[N][N + 1], int n, int k);

void checkRoot(float A[N][N + 1], float X[N], int n);

void rearrangeLines(float A[N][N + 1], int n, int k, int j_max);

float checkCondition(float A[N][N + 1], int n, int k, int j_max, int &Z);


int main() {
    float t, A[N][N + 1], X[N];
    int i, j, k, n, j_max, count = 0, Z = 0; //j - номер строки, i - номер столбца
    cout << "Matrix size:";
    cin >> n;
    cout << "System of linear equations: " << endl;

    inputMatrix(A, n);

    cout << "The initial matrix of coefficients: " << endl;
    outputMatrix(A, n);

    //Прямой ход
    for (k = 0; k < n; k++) {
        j_max = k;
        for (j = k; j < n; j++)
            if ((fabs(A[j_max][k])) < (fabs(A[j][k])))
                j_max = j;
        rearrangeLines(A, n, k, j_max);
        cout << "Matrix after execution " << k + 1 << " transformations: " << endl;
        outputMatrix(A, n);
        checkCondition(A, n, k, j_max, Z);
        doMatrixCalculation(A, n, k);
        if (Z == 0) {
            cout << "Matrix represented in triangular form: " << endl;
            outputMatrix(A, n);
        }
    }

    //Обратный ход
    if (Z == 0) {
        for (i = 0; i < n; i++)
            X[i] = A[i][n];
        for (i = n - 2; i >= 0; i--)
            //Далее выполняется нахождение корней
            for (j = i + 1; j < n; j++)
                X[i] = X[i] - X[j] * A[i][j];
        cout << "The roots of the system of linear equations: " << endl;
        for (i = 0; i < n; i++)
            cout << "X[" << i << "] = " << X[i] << endl;
        //checkRoot(A, X, n);
    }
    return 0;
}

void outputMatrix(float A[N][N + 1], int n) {
    for (int j = 0; j < n; j++) {
        for (int i = 0; i < n + 1; i++)
            printf("%7.3f\t", A[j][i]);
        printf("\n");
    }
}

void inputMatrix(float A[N][N + 1], int n) {
    for (int j = 0; j < n; j++) {
        for (int i = 0; i < n + 1; i++) {
            cout << "A[" << j << "][" << i << "] = ";
            cin >> A[j][i];
        }
        printf("\n");
    }
}

void checkRoot(float A[N][N + 1], float X[N], int n) {
    float s = 0, e = 0.0001;
    for (int j = 0; j < n; j++) {
        for (int i = 0; i < n + 1; i++) {
            s = s + A[j][i] * X[i];
        }
        if ((s - A[j][n]) <= e) {
            cout << endl;
            cout << "Root Х[" << j << "] = " << X[j] << " is true";
        } else {
            cout << endl;
            cout << "Root Х[" << j << "] = " << X[j] << " is true";
        }
    }
}

void doMatrixCalculation(float A[N][N + 1], int n, int k) {
    for (int j = n; j >= k; j--)
        //Далее происходит деление на коэффициент, стоящий на главной диагонали
        A[k][j] = A[k][j] / A[k][k];
    for (int i = k + 1; i < n; i++)
        for (int j = n; j >= k; j--)
            //Далее происходит вычитание из 2-го уравнения 1-го, помноженное на коэффициент
            A[i][j] = A[i][j] - A[i][k] * A[k][j];
}

float checkCondition(float A[N][N + 1], int n, int k, int j_max, int &Z) {
    int count;
    if (A[j_max][k] == 0) //если максимальный элемент нулевой
    {
        count = 0;
        for (int i = 0; i < n; i++) {
            if (A[k][i] == 0)
                count++;
            //Проверяем: если коэффициент равен 0 и свободный член уравненияравен 0
            if ((count == n) && (A[k][n + 1] == 0)) {
                cout << "The system of linear equations has many solutions" << endl;
                Z = 1;
                return 0;
            } else
                //Снова проверяем: если коэффициент равен 0 и свободный член не равен 0
            if ((count == n) && (A[k][n + 1] != 0)) {
                cout << "The system has no solutions" << endl;
                Z = 1;
                return 0;
            }
        }
    }
}

void rearrangeLines(float A[N][N + 1], int n, int k, int j_max) {
    float t;
    for (int i = 0; i < n + 1; i++) {
        t = A[k][i];
        A[k][i] = A[j_max][i];
        A[j_max][i] = t;
    }
}
