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


    /**
     * 查询某个类别下的所有货位
     *
     * @param typeId
     * @return
     */
    @Query(value = "select * from t_position where type_id=?1", nativeQuery = true)
    public List<Position> findByTypeId(int typeId);


    @Query(value = "select * from t_position where index=?1", nativeQuery = true)
    public Position findByIndex(int index);

    /**
     * 获取最大的货位编码
     *
     * @return
     */
    @Query(value = "SELECT MAX(CODE) FROM t_position", nativeQuery = true)
    public String getMaxPositionCode();

    /**
     * 查询库存报警商品，实际库存小于库存下限的商品
     *
     * @return
     */
    @Query(value = "SELECT * FROM t_position WHERE inventory_quantity<min_num", nativeQuery = true)
    public List<Position> listAlarm();
}
