package com.mf.alg;

public class SlotMatchAlgorithm {
    int[][] position;
    int[] matched;
    int length;
    boolean[] accessed;

    public SlotMatchAlgorithm(int[][] position) {
        this.position = position;
        length = this.position.length;
        accessed = new boolean[length];

        matched = new int[length];
        for (int i = 0; i < length; i++) {
            matched[i] = -1;
            accessed[i] = false;
        }
    }

    public boolean findAugmentPath(int value) {
        for (int i = 0; i < length; i++) {
            if (position[value][i] == 1) {
                if (!accessed[i]) {
                    accessed[i] = true;
                    if (matched[i] == -1 || findAugmentPath(matched[i])) {
                        matched[value] = i;
                        matched[i] = value;
                        return true;
                    }
                }
            }
        }
        return false;
    }

    void search() {
        for (int i = 0; i < length; i++) {
            if (matched[i] == -1) {
                clearAccessed();
                findAugmentPath(i);
            }
        }
    }

    void clearAccessed() {
        for (int i = 0; i < length; i++) {
            accessed[i] = false;
        }
    }

    public static void main(String[] args) {
        int[][] temp = {{0, 0, 0, 0, 1, 0, 1, 0},
                {0, 0, 0, 0, 1, 0, 0, 0},
                {0, 0, 0, 0, 1, 1, 0, 0},
                {0, 0, 0, 0, 0, 0, 1, 1},
                {1, 1, 1, 0, 0, 0, 0, 0},
                {0, 0, 1, 0, 0, 0, 0, 0},
                {1, 0, 0, 1, 0, 0, 0, 0},
                {0, 0, 0, 1, 0, 0, 0, 0}};
        new SlotMatchAlgorithm(temp).search();
    }
}
