package com.mf.service;

import com.mf.entity.Position;
import org.springframework.data.domain.Sort.Direction;

import java.util.List;

/**
 * 货位Service接口
 * @author Administrator
 *
 */
public interface PositionService {

	Position findByIndex(int index);
	
	/**
	 * 根据条件分页查询货位信息
	 * @param position
	 * @param page
	 * @param pageSize
	 * @param direction
	 * @param properties
	 * @return
	 */
	public List<Position> list(Position position, Integer page, Integer pageSize, Direction direction, String...properties);
	
	/**
	 * 获取总记录数
	 * @param position
	 * @return
	 */
	public Long getCount(Position position);
	

	/**
	 * 根据id删除货位
	 * @param id
	 */
	public void delete(Integer id);
	
	/**
	 * 根据id查询实体
	 * @param id
	 * @return
	 */
	public Position findById(Integer id);
	
	/**
	 * 添加或者修改货位信息
	 * @param position
	 */
	public void save(Position position);
}
