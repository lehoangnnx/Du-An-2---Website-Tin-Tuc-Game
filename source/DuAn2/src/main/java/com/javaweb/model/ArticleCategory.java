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
 * ArticleCategory generated by hbm2java
 */
@Entity
@Table(name = "article_category", catalog = "duan2_webapplication_tintucgame", uniqueConstraints = {
		@UniqueConstraint(columnNames = "slug"), @UniqueConstraint(columnNames = "name") })
public class ArticleCategory implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3404932020097149044L;
	private Integer articleCategoryId;
	private Integer subArticleCategoryId;
	private String name;
	private String slug;
	private String status;
	private byte sortOrder;
	private String description;
	private Set<Article> articles = new HashSet<Article>(0);
	private Set<Article> articles_1 = new HashSet<Article>(0);

	public ArticleCategory() {
	}

	public ArticleCategory(String name, String slug, String status, byte sortOrder) {
		this.name = name;
		this.slug = slug;
		this.status = status;
		this.sortOrder = sortOrder;
	}

	public ArticleCategory(Integer subArticleCategoryId, String name, String slug, String status, byte sortOrder,
			String description, Set<Article> articles, Set<Article> articles_1) {
		this.subArticleCategoryId = subArticleCategoryId;
		this.name = name;
		this.slug = slug;
		this.status = status;
		this.sortOrder = sortOrder;
		this.description = description;
		this.articles = articles;
		this.articles_1 = articles_1;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "article_category_id", unique = true, nullable = false)
	public Integer getArticleCategoryId() {
		return this.articleCategoryId;
	}

	public void setArticleCategoryId(Integer articleCategoryId) {
		this.articleCategoryId = articleCategoryId;
	}

	@Column(name = "sub_article_category_id")
	public Integer getSubArticleCategoryId() {
		return this.subArticleCategoryId;
	}

	public void setSubArticleCategoryId(Integer subArticleCategoryId) {
		this.subArticleCategoryId = subArticleCategoryId;
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

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "articleCategories")
	public Set<Article> getArticles() {
		return this.articles;
	}

	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "articleCategories")
	public Set<Article> getArticles_1() {
		return this.articles_1;
	}

	public void setArticles_1(Set<Article> articles_1) {
		this.articles_1 = articles_1;
	}

}
