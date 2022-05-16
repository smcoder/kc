package com.mf.alg;

import java.util.ArrayList;
import java.util.List;

public class Algothm {
    int[][] s;
    int[][] p;
    int[][] a;
    int n;
    double[] ti;
    boolean[] rowcheck;
    boolean[] colcheck;

    int total = 0;

    public Algothm(int value, List<Integer> quantityList) {

        initMatric(value, quantityList);

        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
                p[i][j] = s[i][j];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++)
                System.out.print(s[i][j] + "  ");
            System.out.println();
        }
    }

    public void realCalculate() {
        for (int i = 0; i < n; i++) {
            int min = p[i][0];
            for (int j = 1; j < n; j++)
                if (min > p[i][j]) min = p[i][j];
            for (int j = 0; j < n; j++)
                p[i][j] -= min;
        }


        for (int j = 0; j < n; j++) {
            int min = p[0][j];
            for (int i = 1; i < n; i++) {
                if (min > p[i][j]) min = p[i][j];
            }
            for (int i = 0; i < n; i++)
                p[i][j] -= min;
        }

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++)
                System.out.print(p[i][j] + "  ");
            System.out.println();
        }

        while (true) {
            for (int i = 0; i < n; i++)
                for (int j = 0; j < n; j++)
                    a[i][j] = p[i][j];

            hunter();
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++)
                    System.out.print(a[i][j] + "  ");
                System.out.println();
            }


            if (countsign() == n) break;

            drawline();
            for (int i = 0; i < n; i++) {
                System.out.print(rowcheck[i] + " ");
            }
            System.out.println();
            for (int i = 0; i < n; i++) {
                System.out.print(colcheck[i] + " ");
            }

            addzero();
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++)
                    System.out.print(p[i][j] + "  ");
                System.out.println();
            }

        }
        //将所有画圈0改成1，其他元素改成0
        for(int i = 0 ; i < n ; i++)
            for(int j = 0 ; j < n ; j++) {
                if(a[i][j] == -1) {
                    total+= s[i][j];
                    s[i][j] = 1;
                }
                else
                    s[i][j] = 0;
            }
        System.out.println("最终矩阵:");
        for(int i=0; i < n;i++) {
            for(int j=0;j < n; j++)
                System.out.print(s[i][j]+"  ");
            System.out.println();
        }
        System.out.println("计算和为：" + total);


        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++) {
                if (a[i][j] == -1) s[i][j] = 1;
                else s[i][j] = 0;
            }
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++)
                System.out.print(s[i][j] + "  ");
            System.out.println();
        }
    }

    public void initMatric(int value, List<Integer> quantityList) {
        n = value;

        s = new int[n][n];
        p = new int[n][n];
        a = new int[n][n];
        rowcheck = new boolean[n];
        colcheck = new boolean[n];

        int[] row = new int[n];
        for (int i = 0; i < n; i++)
            row[i] = quantityList.get(i);
        System.out.println();

        coefficient();

        recommend(row);
    }

    public void coefficient() {
        ti = new double[n];
        for (int i = 0; i < n; i++) {
            double px = i % 3.0 + 1;
            double py = Math.round(i / 3 + 1);
            double para = Math.sqrt(px * px + py * py);
            ti[i] = para / 2.0;
        }
        System.out.println("");
    }

    public void recommend(int row[]) {
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
                s[i][j] = (int) (ti[i] * row[j]);
    }

    public void hunter() {

        while (true) {

            int flag = 0;
            for (int i = 0; i < n; i++) {
                if (countrow(i) == 1) {
                    flag = 1;
                    for (int j = 0; j < n; j++)
                        if (a[i][j] == 0) {
                            a[i][j] = -1;
                            for (int k = 0; k < n; k++)
                                if (a[k][j] == 0) a[k][j] = -2;
                        }
                }
            }


            for (int j = 0; j < n; j++) {
                if (countcol(j) == 1) {
                    flag = 1;
                    for (int i = 0; i < n; i++) {
                        if (a[i][j] == 0) {
                            a[i][j] = -1;
                            for (int k = 0; k < n; k++)
                                if (a[i][k] == 0) a[i][k] = -2;
                        }
                    }
                }
            }

            if (flag == 0) {
                int[] r0 = new int[n];
                int[] c0 = new int[n];
                for (int i = 0; i < n; i++)
                    r0[i] = countrow(i);

                for (int j = 0; j < n; j++)
                    c0[j] = countcol(j);

                int f0 = 0;
                for (int i = 0; i < n; i++)
                    if (r0[i] != 0) f0 = 1;

                if (f0 == 0) {
                    break;
                }

                int min = Integer.MAX_VALUE;
                int minrow = 0;
                for (int i = 0; i < n; i++) {
                    if (r0[i] == 0) continue;
                    if (r0[i] < min) {
                        min = r0[i];
                        minrow = i;
                    }
                }


                min = Integer.MAX_VALUE;
                int mincol = 0;
                for (int j = 0; j < n; j++)
                    if (a[minrow][j] == 0 && c0[j] < min) {
                        mincol = j;
                        min = c0[j];
                    }
                a[minrow][mincol] = -1;
                //ªÆµÙ¡–÷–µƒ0
                for (int i = 0; i < n; i++)
                    if (a[i][mincol] == 0) a[i][mincol] = -2;
                for (int j = 0; j < n; j++)
                    if (a[minrow][j] == 0) {
                        a[minrow][j] = -2;
                    }

            }

        }

    }

    public void drawline() {

        for (int i = 0; i < n; i++) {
            rowcheck[i] = false;
            colcheck[i] = false;
        }

        for (int i = 0; i < n; i++) {
            rowcheck[i] = true;
            for (int j = 0; j < n; j++) {
                if (a[i][j] == -1) {
                    rowcheck[i] = false;
                    break;
                }
            }
        }


        while (true) {

            boolean flag = false;


            for (int i = 0; i < n; i++) {
                if (rowcheck[i]) {
                    for (int j = 0; j < n; j++) {
                        if (a[i][j] == -2) if (colcheck[j] == false) {
                            colcheck[j] = true;
                            flag = true;
                        }
                    }
                }
            }

            for (int j = 0; j < n; j++) {
                if (colcheck[j]) {
                    for (int i = 0; i < n; i++)
                        if (a[i][j] == -1) if (rowcheck[i] == false) {
                            rowcheck[i] = true;
                            flag = true;
                        }
                }
            }


            if (flag == false) {
                break;
            }
        }


    }

    public void addzero() {

        int min = Integer.MAX_VALUE;
        for (int i = 0; i < n; i++) {
            if (rowcheck[i]) {
                for (int j = 0; j < n; j++) {
                    if (!colcheck[j]) {
                        if (p[i][j] < min) min = p[i][j];
                    }
                }
            }
        }
        System.out.println("◊Ó–°÷µŒ™£∫");
        System.out.println(min);

        for (int i = 0; i < n; i++)
            if (rowcheck[i]) {
                for (int j = 0; j < n; j++) {
                    p[i][j] -= min;
                }
            }
        for (int j = 0; j < n; j++) {
            if (colcheck[j]) {
                for (int i = 0; i < n; i++)
                    p[i][j] += min;
            }
        }
    }


    public int countsign() {
        int num = 0;
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
                if (a[i][j] == -1) num++;
        return num;
    }


    public int countrow(int x) {
        int num = 0;
        for (int j = 0; j < n; j++) {
            if (a[x][j] == 0) num++;
        }
        return num;
    }

    public int countcol(int y) {
        int num = 0;
        for (int i = 0; i < n; i++) {
            if (a[i][y] == 0) num++;
        }
        return num;
    }

    public static void main(String args[]) {
        List<Integer> valueList = new ArrayList<>();
        valueList.add(2735);
        valueList.add(1650);
        valueList.add(1000);
        valueList.add(400);
        Algothm object = new Algothm(4, valueList);

        System.out.println("----------");
        int[][] matrix = object.s;
    }

    public int[][] calculate() {
//        Algothm object = new Algothm(matrix, valueList);
        realCalculate();
        return s;
    }

    public int sum() {
        return total;
    }

    public int[][] initMatrix() {
//        Algothm object = new Algothm(matrix, valueList);
        return s;
    }
}
