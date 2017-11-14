package com.javaweb.model;
// Generated Nov 5, 2017 10:08:55 AM by Hibernate Tools 5.2.5.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Pages generated by hbm2java
 */
@Entity
@Table(name = "pages", catalog = "duan2_webapplication_tintucgame", uniqueConstraints = @UniqueConstraint(columnNames = "slug"))
public class Pages implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1614534883358579350L;
	private Integer pageId;
	private String name;
	private String slug;
	private String content;
	private String status;
	private String description;

	public Pages() {
	}

	public Pages(String name, String slug, String content, String status) {
		this.name = name;
		this.slug = slug;
		this.content = content;
		this.status = status;
	}

	public Pages(String name, String slug, String content, String status, String description) {
		this.name = name;
		this.slug = slug;
		this.content = content;
		this.status = status;
		this.description = description;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "page_id", unique = true, nullable = false)
	public Integer getPageId() {
		return this.pageId;
	}

	public void setPageId(Integer pageId) {
		this.pageId = pageId;
	}

	@Column(name = "name", nullable = false)
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

	@Column(name = "content", nullable = false, length = 65535)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "status", nullable = false, length = 8)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "description", length = 45)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
