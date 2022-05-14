package com.mf.alg;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.mf.entity.Goods;
import com.mf.vo.PositionSelect;

import java.util.ArrayList;
import java.util.List;

public class UnitTest {
    public static void main(String[] args) {
        List<Goods> goodsList = new ArrayList<>();
        for (int i = 0; i < 20; i++) {
            Goods goods = new Goods();
            goods.setInventoryQuantity(i);
            goodsList.add(goods);
        }
        SlotMatchAlgorithm.n = 10;
        SlotMatchAlgorithm slotMatchAlgorithm = new SlotMatchAlgorithm(10 + 1);
        SlotMatchAlgorithm.initMatrix(goodsList);
        SlotMatchAlgorithm.changeMatrix(2);
        List<PositionSelect> list = SlotMatchAlgorithm.hunter(false);
        if (null != list && list.size() > 0) {
            int value = list.stream().mapToInt(item -> item.getPositionIndex()).sum();
            int[][] json = SlotMatchAlgorithm.p;
            JSONArray jsonArray = convert(json);
            System.out.println(jsonArray);
        }
    }

    private static JSONArray convert(int[][] matrix) {
        int num = matrix.length;
        String value = "[";
        for (int n = 0; n < num; n++) {
            value += "{";
            for (int i = 0; i < matrix[n].length; i++) {
                value += "'" + i;
                value += "':";
                value += matrix[n][i] + ",";
            }
            value = value.substring(0, value.length() - 1);
            value += "},";
        }
        String refactor = value.substring(0, value.length() - 1);
        refactor += "]";
        return JSON.parseArray(refactor);
    }
}
