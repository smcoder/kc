package com.mf.vo;

import com.alibaba.fastjson.JSONArray;
import lombok.Data;

import java.util.List;

@Data
public class MatrixTableVO {
    private JSONArray jsonArray;

    private List<String> list;
}
