package com.mf.service;

import com.mf.vo.PositionSelect;

import java.util.List;
import java.util.Map;

public interface AutoSelectPositionService {

    List<PositionSelect> autoSelect(Integer goodsId);
}
