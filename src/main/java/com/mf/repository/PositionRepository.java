package com.mf.repository;

import com.mf.entity.Goods;
import com.mf.entity.Position;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 货位Repository接口
 *
 * @author Administrator
 */
public interface PositionRepository extends JpaRepository<Position, Integer>, JpaSpecificationExecutor<Position> {



    @Query(value = "select * from t_position where `index`=?1", nativeQuery = true)
    public Position findByIndex(int index);

    /**
     * 获取最大的货位编码
     *
     * @return
     */
    @Query(value = "SELECT MAX(CODE) FROM t_position", nativeQuery = true)
    public String getMaxPositionCode();

}
