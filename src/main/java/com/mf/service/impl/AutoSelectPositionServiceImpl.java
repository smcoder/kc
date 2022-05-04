package com.mf.service.impl;

import com.mf.alg.SlotMatchAlgorithm;
import com.mf.entity.Position;
import com.mf.entity.PurchaseListGoods;
import com.mf.repository.PurchaseListGoodsRepository;
import com.mf.service.AutoSelectPositionService;
import com.mf.service.PositionService;
import com.mf.vo.PositionSelect;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AutoSelectPositionServiceImpl implements AutoSelectPositionService {

    @Resource
    private PurchaseListGoodsRepository purchaseListGoodsRepository;

    @Resource
    private PositionService positionService;

    @Override
    public PositionSelect autoSelect(Integer goodsId) {
        List<PositionSelect> positionSelectList = SlotMatchAlgorithm.hunter(false);
        return iterator(positionSelectList);
    }

    PositionSelect iterator(List<PositionSelect> positionSelectList) {
        PositionSelect select = null;
        for (PositionSelect positionSelect : positionSelectList) {
            Position idPosition = positionService.findByIndex(positionSelect.getPositionId());
            positionSelect.setPositionId(idPosition.getId());
            PurchaseListGoods purchaseListGoods = purchaseListGoodsRepository.fetchCorrect(idPosition.getId(), positionSelect.getPositionIndex());
            if (null == purchaseListGoods) {
                select = positionSelect;
                break;
            }
        }
        if (null == select) {
            try {
                List<PositionSelect> retryList = SlotMatchAlgorithm.hunter(true);
                return iterator(retryList);
            } catch (RuntimeException e) {
                return null;
            }
        }
        return select;
    }
}
