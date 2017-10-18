package com.javaweb.model;
// Generated Oct 18, 2017 12:22:20 PM by Hibernate Tools 5.2.5.Final

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

/**
 * ArticleCategoryForum generated by hbm2java
 */
@Entity
@Table(name = "article_category_forum", catalog = "duan2_webapplication_tintucgame")
public class ArticleCategoryForum implements java.io.Serializable {

	private Integer articleCategoryForumId;
	private Integer subArticleCategoryForumId;
	private String name;
	private String slug;
	private String status;
	private byte sortOrder;
	private String description;
	private Set<ArticleForum> articleForums = new HashSet<ArticleForum>(0);

	public ArticleCategoryForum() {
	}

	public ArticleCategoryForum(String name, String slug, String status, byte sortOrder) {
		this.name = name;
		this.slug = slug;
		this.status = status;
		this.sortOrder = sortOrder;
	}

	public ArticleCategoryForum(Integer subArticleCategoryForumId, String name, String slug, String status,
			byte sortOrder, String description, Set<ArticleForum> articleForums) {
		this.subArticleCategoryForumId = subArticleCategoryForumId;
		this.name = name;
		this.slug = slug;
		this.status = status;
		this.sortOrder = sortOrder;
		this.description = description;
		this.articleForums = articleForums;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "article_category_forum_id", unique = true, nullable = false)
	public Integer getArticleCategoryForumId() {
		return this.articleCategoryForumId;
	}

	public void setArticleCategoryForumId(Integer articleCategoryForumId) {
		this.articleCategoryForumId = articleCategoryForumId;
	}

	@Column(name = "sub_article_category_forum_id")
	public Integer getSubArticleCategoryForumId() {
		return this.subArticleCategoryForumId;
	}

	public void setSubArticleCategoryForumId(Integer subArticleCategoryForumId) {
		this.subArticleCategoryForumId = subArticleCategoryForumId;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "slug", nullable = false)
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

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "articleCategoryForums")
	public Set<ArticleForum> getArticleForums() {
		return this.articleForums;
	}

	public void setArticleForums(Set<ArticleForum> articleForums) {
		this.articleForums = articleForums;
	}

}
