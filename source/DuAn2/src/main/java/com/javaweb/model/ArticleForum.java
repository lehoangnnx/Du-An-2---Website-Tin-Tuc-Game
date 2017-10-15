package com.javaweb.model;
// Generated Oct 15, 2017 3:20:39 PM by Hibernate Tools 5.2.5.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ArticleForum generated by hbm2java
 */
@Entity
@Table(name = "article_forum", catalog = "duan2_webapplication_tintucgame")
public class ArticleForum implements java.io.Serializable {

	private Integer articleForumId;
	private ArticleCategoryForum articleCategoryForum;
	private Users users;
	private String title;
	private String slug;
	private String mainContent;
	private String status;
	private long views;
	private String createdDate;
	private Date modifiedDate;
	private Integer modifiedUserId;
	private Date activateDate;
	private Integer activateUserId;
	private Date showDate;
	private String allowComment;
	private Byte isHot;
	private String linkSource;
	private Set<ArticleLikeForum> articleLikeForums = new HashSet<ArticleLikeForum>(0);
	private Set<CommentForum> commentForums = new HashSet<CommentForum>(0);

	public ArticleForum() {
	}

	public ArticleForum(ArticleCategoryForum articleCategoryForum, Users users, String title, String slug,
			String mainContent, String status, long views, String createdDate) {
		this.articleCategoryForum = articleCategoryForum;
		this.users = users;
		this.title = title;
		this.slug = slug;
		this.mainContent = mainContent;
		this.status = status;
		this.views = views;
		this.createdDate = createdDate;
	}

	public ArticleForum(ArticleCategoryForum articleCategoryForum, Users users, String title, String slug,
			String mainContent, String status, long views, String createdDate, Date modifiedDate,
			Integer modifiedUserId, Date activateDate, Integer activateUserId, Date showDate, String allowComment,
			Byte isHot, String linkSource, Set<ArticleLikeForum> articleLikeForums, Set<CommentForum> commentForums) {
		this.articleCategoryForum = articleCategoryForum;
		this.users = users;
		this.title = title;
		this.slug = slug;
		this.mainContent = mainContent;
		this.status = status;
		this.views = views;
		this.createdDate = createdDate;
		this.modifiedDate = modifiedDate;
		this.modifiedUserId = modifiedUserId;
		this.activateDate = activateDate;
		this.activateUserId = activateUserId;
		this.showDate = showDate;
		this.allowComment = allowComment;
		this.isHot = isHot;
		this.linkSource = linkSource;
		this.articleLikeForums = articleLikeForums;
		this.commentForums = commentForums;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "article_forum_id", unique = true, nullable = false)
	public Integer getArticleForumId() {
		return this.articleForumId;
	}

	public void setArticleForumId(Integer articleForumId) {
		this.articleForumId = articleForumId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "article_category_forum_id", nullable = false)
	public ArticleCategoryForum getArticleCategoryForum() {
		return this.articleCategoryForum;
	}

	public void setArticleCategoryForum(ArticleCategoryForum articleCategoryForum) {
		this.articleCategoryForum = articleCategoryForum;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_user_id", nullable = false)
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Column(name = "title", nullable = false)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "slug", nullable = false)
	public String getSlug() {
		return this.slug;
	}

	public void setSlug(String slug) {
		this.slug = slug;
	}

	@Column(name = "main_content", nullable = false, length = 65535)
	public String getMainContent() {
		return this.mainContent;
	}

	public void setMainContent(String mainContent) {
		this.mainContent = mainContent;
	}

	@Column(name = "status", nullable = false, length = 8)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "views", nullable = false)
	public long getViews() {
		return this.views;
	}

	public void setViews(long views) {
		this.views = views;
	}

	@Column(name = "created_date", nullable = false, length = 45)
	public String getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "modified_date", length = 19)
	public Date getModifiedDate() {
		return this.modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@Column(name = "modified_user_id")
	public Integer getModifiedUserId() {
		return this.modifiedUserId;
	}

	public void setModifiedUserId(Integer modifiedUserId) {
		this.modifiedUserId = modifiedUserId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "activate_date", length = 19)
	public Date getActivateDate() {
		return this.activateDate;
	}

	public void setActivateDate(Date activateDate) {
		this.activateDate = activateDate;
	}

	@Column(name = "activate_user_id")
	public Integer getActivateUserId() {
		return this.activateUserId;
	}

	public void setActivateUserId(Integer activateUserId) {
		this.activateUserId = activateUserId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "show_date", length = 19)
	public Date getShowDate() {
		return this.showDate;
	}

	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}

	@Column(name = "allow_comment", length = 6)
	public String getAllowComment() {
		return this.allowComment;
	}

	public void setAllowComment(String allowComment) {
		this.allowComment = allowComment;
	}

	@Column(name = "is_hot")
	public Byte getIsHot() {
		return this.isHot;
	}

	public void setIsHot(Byte isHot) {
		this.isHot = isHot;
	}

	@Column(name = "link_source", length = 65535)
	public String getLinkSource() {
		return this.linkSource;
	}

	public void setLinkSource(String linkSource) {
		this.linkSource = linkSource;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "articleForum")
	public Set<ArticleLikeForum> getArticleLikeForums() {
		return this.articleLikeForums;
	}

	public void setArticleLikeForums(Set<ArticleLikeForum> articleLikeForums) {
		this.articleLikeForums = articleLikeForums;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "articleForum")
	public Set<CommentForum> getCommentForums() {
		return this.commentForums;
	}

	public void setCommentForums(Set<CommentForum> commentForums) {
		this.commentForums = commentForums;
	}

}
