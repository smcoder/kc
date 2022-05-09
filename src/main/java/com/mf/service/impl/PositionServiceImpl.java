package com.mf.service.impl;

import com.mf.entity.Position;
import com.mf.repository.PositionRepository;
import com.mf.service.PositionService;
import com.mf.util.StringUtil;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

@Service("positionService")
public class PositionServiceImpl implements PositionService {

    @Resource
    private PositionRepository positionRepository;


    @Override
    public Position findByIndex(int index) {
        return positionRepository.findByIndex(index);
    }


    @Override
    public List<Position> list(Position position, Integer page, Integer pageSize, Sort.Direction direction, String... properties) {
        Pageable pageable = new PageRequest(page - 1, pageSize);
        Page<Position> pageGoods = positionRepository.findAll(new Specification<Position>() {

            @Override
            public Predicate toPredicate(Root<Position> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Predicate predicate = cb.conjunction();
                if (position != null) {
                    if (StringUtil.isNotEmpty(position.getName())) {
                        predicate.getExpressions().add(cb.like(root.get("name"), "%" + position.getName() + "%"));
                    }
//                    if (StringUtil.isNotEmpty(position.getCodeOrName())) {
//                        predicate.getExpressions().add(cb.or(cb.like(root.get("code"), "%" + position.getCodeOrName() + "%"), cb.like(root.get("name"), "%" + goods.getCodeOrName() + "%")));
//                    }
                }
                return predicate;
            }
        }, pageable);
        return pageGoods.getContent();
    }

    @Override
    public Long getCount(Position position) {
        Long count = positionRepository.count(new Specification<Position>() {

            @Override
            public Predicate toPredicate(Root<Position> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Predicate predicate = cb.conjunction();
                if (position != null) {
                    if (StringUtil.isNotEmpty(position.getName())) {
                        predicate.getExpressions().add(cb.like(root.get("name"), "%" + position.getName() + "%"));
                    }
//                    if (StringUtil.isNotEmpty(goods.getCodeOrName())) {
//                        predicate.getExpressions().add(cb.or(cb.like(root.get("code"), "%" + goods.getCodeOrName() + "%"), cb.like(root.get("name"), "%" + goods.getCodeOrName() + "%")));
//                    }
                }
                return predicate;
            }

        });
        return count;
    }

    @Override
    public void delete(Integer id) {
        positionRepository.delete(id);
    }

    @Override
    public Position findById(Integer id) {
        return positionRepository.findOne(id);
    }

    @Override
    public void save(Position position) {
        positionRepository.save(position);
    }
}
