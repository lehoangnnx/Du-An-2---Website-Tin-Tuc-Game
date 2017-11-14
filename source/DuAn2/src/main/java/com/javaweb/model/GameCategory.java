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
 * GameCategory generated by hbm2java
 */
@Entity
@Table(name = "game_category", catalog = "duan2_webapplication_tintucgame", uniqueConstraints = {
		@UniqueConstraint(columnNames = "slug"), @UniqueConstraint(columnNames = "name") })
public class GameCategory implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 848425073679093438L;
	private Integer gameCategoryId;
	private Integer subGameCategoryId;
	private String name;
	private String slug;
	private String status;
	private byte sortOrder;
	private String description;
	private Set<Games> gameses = new HashSet<Games>(0);
	private Set<Games> gameses_1 = new HashSet<Games>(0);

	public GameCategory() {
	}

	public GameCategory(String name, String slug, String status, byte sortOrder) {
		this.name = name;
		this.slug = slug;
		this.status = status;
		this.sortOrder = sortOrder;
	}

	public GameCategory(Integer subGameCategoryId, String name, String slug, String status, byte sortOrder,
			String description, Set<Games> gameses, Set<Games> gameses_1) {
		this.subGameCategoryId = subGameCategoryId;
		this.name = name;
		this.slug = slug;
		this.status = status;
		this.sortOrder = sortOrder;
		this.description = description;
		this.gameses = gameses;
		this.gameses_1 = gameses_1;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "game_category_id", unique = true, nullable = false)
	public Integer getGameCategoryId() {
		return this.gameCategoryId;
	}

	public void setGameCategoryId(Integer gameCategoryId) {
		this.gameCategoryId = gameCategoryId;
	}

	@Column(name = "sub_game_category_id")
	public Integer getSubGameCategoryId() {
		return this.subGameCategoryId;
	}

	public void setSubGameCategoryId(Integer subGameCategoryId) {
		this.subGameCategoryId = subGameCategoryId;
	}

	@Column(name = "name", unique = true, nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "slug", unique = true, nullable = false)
	public String getSlug() {
		return this.slug;
	}

	public void setSlug(String slug) {
		this.slug = slug;
	}

	@Column(name = "status", nullable = false, length = 8)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "sort_order", nullable = false)
	public byte getSortOrder() {
		return this.sortOrder;
	}

	public void setSortOrder(byte sortOrder) {
		this.sortOrder = sortOrder;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "gameCategories")
	public Set<Games> getGameses() {
		return this.gameses;
	}

	public void setGameses(Set<Games> gameses) {
		this.gameses = gameses;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "gameCategories")
	public Set<Games> getGameses_1() {
		return this.gameses_1;
	}

	public void setGameses_1(Set<Games> gameses_1) {
		this.gameses_1 = gameses_1;
	}

}
