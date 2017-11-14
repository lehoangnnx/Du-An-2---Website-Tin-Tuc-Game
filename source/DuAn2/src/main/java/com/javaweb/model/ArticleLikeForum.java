package com.javaweb.model;
// Generated Nov 5, 2017 10:08:55 AM by Hibernate Tools 5.2.5.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ArticleLikeForum generated by hbm2java
 */
@Entity
@Table(name = "article_like_forum", catalog = "duan2_webapplication_tintucgame")
public class ArticleLikeForum implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7585177548411943809L;
	private Integer articleLikeForumId;
	private ArticleForum articleForum;
	private Users users;
	private Date createDate;
	private String description;

	public ArticleLikeForum() {
	}

	public ArticleLikeForum(ArticleForum articleForum, Users users, Date createDate) {
		this.articleForum = articleForum;
		this.users = users;
		this.createDate = createDate;
	}

	public ArticleLikeForum(ArticleForum articleForum, Users users, Date createDate, String description) {
		this.articleForum = articleForum;
		this.users = users;
		this.createDate = createDate;
		this.description = description;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "article_like_forum_id", unique = true, nullable = false)
	public Integer getArticleLikeForumId() {
		return this.articleLikeForumId;
	}

	public void setArticleLikeForumId(Integer articleLikeForumId) {
		this.articleLikeForumId = articleLikeForumId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "article_forum_id", nullable = false)
	public ArticleForum getArticleForum() {
		return this.articleForum;
	}

	public void setArticleForum(ArticleForum articleForum) {
		this.articleForum = articleForum;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date", nullable = false, length = 19)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
