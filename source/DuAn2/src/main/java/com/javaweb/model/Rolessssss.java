package com.javaweb.model;

import javax.persistence.*;


@Entity
@Table(name = "roles")
public class Rolessssss {
	@Id
	@GeneratedValue
	private Integer role_id;
	private String name;
	private Byte status;
	private String description;
	
	
	
	public Rolessssss() {
		super();
	}
	public Rolessssss(Integer role_id, String name, Byte status, String description) {
		super();
		this.role_id = role_id;
		this.name = name;
		this.status = status;
		this.description = description;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Byte getStatus() {
		return status;
	}
	public void setStatus(Byte status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
