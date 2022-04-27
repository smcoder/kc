package com.mf.entity;

import javax.persistence.*;

/**
 * 商品实体
 * @author Administrator
 *
 */
@Entity
@Table(name="t_position")
public class Position {
	
	@Id
	@GeneratedValue
	private Integer id; // 编号
	
	@Column(length=50)
	private String code; // 商品编码
	
	@Column(length=50)
	private String name; // 商品名称
	
	@ManyToOne
	@JoinColumn(name="typeId")
	private GoodsType type; // 商品类别

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public GoodsType getType() {
		return type;
	}

	public void setType(GoodsType type) {
		this.type = type;
	}
}
