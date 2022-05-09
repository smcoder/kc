package com.mf.config;

import com.mf.alg.SlotMatchAlgorithm;
import com.mf.entity.Goods;
import com.mf.entity.GoodsType;
import com.mf.entity.Position;
import com.mf.repository.GoodsRepository;
import com.mf.repository.PositionRepository;
import jdk.nashorn.internal.objects.annotations.Constructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;

@Configuration
public class WareDataInit {
    @Resource
    private GoodsRepository goodsRepository;

    @Resource
    private PositionRepository positionRepository;

    @PostConstruct
    public void init() {
//        List<Goods> goodsList = goodsRepository.findAll();
//        SlotMatchAlgorithm.n = goodsList.size();
//        SlotMatchAlgorithm.initMatrix(goodsList);
//        for (int i = 1; i <= 100; i++) {
//            for (int j = 1; j <= goodsList.size(); j++) {
//                Position position = new Position();
//                position.setCode(i + "-" + j);
//                position.setName(i + "-" + j);
//                position.setPindex(j);
//                position.setTotal(100);
//                positionRepository.save(position);
//            }
//        }
    }
}
