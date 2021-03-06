package com.javaweb.model;
// Generated Nov 5, 2017 10:08:55 AM by Hibernate Tools 5.2.5.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Roles generated by hbm2java
 */
@Entity
@Table(name = "roles", catalog = "duan2_webapplication_tintucgame", uniqueConstraints = @UniqueConstraint(columnNames = "name"))
public class Roles implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4195292939272303445L;
	private Integer roleId;
	private String name;
	private String status;
	private String description;
	private Set<Users> userses = new HashSet<Users>(0);
	private Set<Users> userses_1 = new HashSet<Users>(0);

	public Roles() {
	}

	public Roles(String name, String status) {
		this.name = name;
		this.status = status;
	}

	public Roles(String name, String status, String description, Set<Users> userses, Set<Users> userses_1) {
		this.name = name;
		this.status = status;
		this.description = description;
		this.userses = userses;
		this.userses_1 = userses_1;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "role_id", unique = true, nullable = false)
	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Column(name = "name", unique = true, nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "status", nullable = false, length = 8)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "roleses")
	public Set<Users> getUserses() {
		return this.userses;
	}

	public void setUserses(Set<Users> userses) {
		this.userses = userses;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "roleses")
	public Set<Users> getUserses_1() {
		return this.userses_1;
	}

	public void setUserses_1(Set<Users> userses_1) {
		this.userses_1 = userses_1;
	}

}
