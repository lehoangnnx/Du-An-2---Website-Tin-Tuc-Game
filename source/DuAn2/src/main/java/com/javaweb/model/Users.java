package com.javaweb.model;
// Generated Nov 5, 2017 10:08:55 AM by Hibernate Tools 5.2.5.Final

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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Users generated by hbm2java
 */
@Entity
@Table(name = "users", catalog = "duan2_webapplication_tintucgame", uniqueConstraints = {
		@UniqueConstraint(columnNames = "email"), @UniqueConstraint(columnNames = "user_name") })
public class Users implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8086287136462929536L;
	private Integer userId;
	private String userName;
	private String password;
	private String email;
	private String firstName;
	private String lastName;
	private String status;
	private Date createdDate;
	private String phoneNumber;
	private byte isOnline;
	private String ip;
	private Date loggedInDate;
	private String avatar;
	private String description;
	private String forgotpassword;
	private Set<ArticleLikeForum> articleLikeForums = new HashSet<ArticleLikeForum>(0);
	private Set<Article> articles = new HashSet<Article>(0);
	private Set<ArticleLike> articleLikes = new HashSet<ArticleLike>(0);
	private Set<Comment> comments = new HashSet<Comment>(0);
	private Set<CommentLikeForum> commentLikeForums = new HashSet<CommentLikeForum>(0);
	private Set<CommentForum> commentForums = new HashSet<CommentForum>(0);
	private Set<GameReviews> gameReviewses = new HashSet<GameReviews>(0);
	private Set<CommentLikeForum> commentLikeForums_1 = new HashSet<CommentLikeForum>(0);
	private Set<Roles> roleses = new HashSet<Roles>(0);
	private Set<ArticleForum> articleForums = new HashSet<ArticleForum>(0);
	private Set<ArticleForum> articleForums_1 = new HashSet<ArticleForum>(0);
	private Set<GameReviews> gameReviewses_1 = new HashSet<GameReviews>(0);
	private Set<CommentForum> commentForums_1 = new HashSet<CommentForum>(0);
	private Set<CommentLike> commentLikes = new HashSet<CommentLike>(0);
	private Set<ArticleLikeForum> articleLikeForums_1 = new HashSet<ArticleLikeForum>(0);
	private Set<Article> articles_1 = new HashSet<Article>(0);
	private Set<ArticleLike> articleLikes_1 = new HashSet<ArticleLike>(0);
	private Set<Comment> comments_1 = new HashSet<Comment>(0);
	private Set<Roles> roleses_1 = new HashSet<Roles>(0);
	private Set<CommentLike> commentLikes_1 = new HashSet<CommentLike>(0);

	public Users() {
	}


	public Users(String userName, String password, String email, String status, Date createdDate, byte isOnline, Date loggedInDate) {
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.status = status;
		this.createdDate = createdDate;
		this.isOnline = isOnline;
		this.loggedInDate = loggedInDate;
	}
	public Users(String userName, String password, String email, String firstName, String lastName, String status, Date createdDate, String phoneNumber, byte isOnline, String ip, Date loggedInDate, String avatar, String description, String forgotpassword, Set<ArticleLikeForum> articleLikeForums, Set<Article> articles, Set<ArticleLike> articleLikes, Set<Comment> comments, Set<CommentLikeForum> commentLikeForums, Set<CommentForum> commentForums, Set<GameReviews> gameReviewses, Set<CommentLikeForum> commentLikeForums_1, Set<Roles> roleses, Set<ArticleForum> articleForums, Set<ArticleForum> articleForums_1, Set<GameReviews> gameReviewses_1, Set<CommentForum> commentForums_1, Set<CommentLike> commentLikes, Set<ArticleLikeForum> articleLikeForums_1, Set<Article> articles_1, Set<ArticleLike> articleLikes_1, Set<Comment> comments_1, Set<Roles> roleses_1, Set<CommentLike> commentLikes_1) {
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
		this.status = status;
		this.createdDate = createdDate;
		this.phoneNumber = phoneNumber;
		this.isOnline = isOnline;
		this.ip = ip;
		this.loggedInDate = loggedInDate;
		this.avatar = avatar;
		this.description = description;
		this.forgotpassword = forgotpassword;
		this.articleLikeForums = articleLikeForums;
		this.articles = articles;
		this.articleLikes = articleLikes;
		this.comments = comments;
		this.commentLikeForums = commentLikeForums;
		this.commentForums = commentForums;
		this.gameReviewses = gameReviewses;
		this.commentLikeForums_1 = commentLikeForums_1;
		this.roleses = roleses;
		this.articleForums = articleForums;
		this.articleForums_1 = articleForums_1;
		this.gameReviewses_1 = gameReviewses_1;
		this.commentForums_1 = commentForums_1;
		this.commentLikes = commentLikes;
		this.articleLikeForums_1 = articleLikeForums_1;
		this.articles_1 = articles_1;
		this.articleLikes_1 = articleLikes_1;
		this.comments_1 = comments_1;
		this.roleses_1 = roleses_1;
		this.commentLikes_1 = commentLikes_1;
	}

	@Id @GeneratedValue(strategy=IDENTITY)


	@Column(name="user_id", unique=true, nullable=false)
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	@Column(name="user_name", unique=true, nullable=false, length=50)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	@Column(name="password", nullable=false, length=70)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	@Column(name="email", unique=true, nullable=false)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	@Column(name="first_name")
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	@Column(name="last_name")
	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	@Column(name="status", nullable=false, length=8)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_date", nullable=false, length=19)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	@Column(name="phone_number", length=25)
	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	@Column(name="is_online", nullable=false)
	public byte getIsOnline() {
		return this.isOnline;
	}

	public void setIsOnline(byte isOnline) {
		this.isOnline = isOnline;
	}


	@Column(name="ip", length=50)
	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="logged_in_date", nullable=false, length=19)
	public Date getLoggedInDate() {
		return this.loggedInDate;
	}

	public void setLoggedInDate(Date loggedInDate) {
		this.loggedInDate = loggedInDate;
	}


	@Column(name="avatar", length=65535)
	public String getAvatar() {
		return this.avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}


	@Column(name="description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	@Column(name="forgotpassword", length=45)
	public String getForgotpassword() {
		return this.forgotpassword;
	}

	public void setForgotpassword(String forgotpassword) {
		this.forgotpassword = forgotpassword;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<ArticleLikeForum> getArticleLikeForums() {
		return this.articleLikeForums;
	}

	public void setArticleLikeForums(Set<ArticleLikeForum> articleLikeForums) {
		this.articleLikeForums = articleLikeForums;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<Article> getArticles() {
		return this.articles;
	}

	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<ArticleLike> getArticleLikes() {
		return this.articleLikes;
	}

	public void setArticleLikes(Set<ArticleLike> articleLikes) {
		this.articleLikes = articleLikes;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<CommentLikeForum> getCommentLikeForums() {
		return this.commentLikeForums;
	}

	public void setCommentLikeForums(Set<CommentLikeForum> commentLikeForums) {
		this.commentLikeForums = commentLikeForums;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<CommentForum> getCommentForums() {
		return this.commentForums;
	}

	public void setCommentForums(Set<CommentForum> commentForums) {
		this.commentForums = commentForums;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<GameReviews> getGameReviewses() {
		return this.gameReviewses;
	}

	public void setGameReviewses(Set<GameReviews> gameReviewses) {
		this.gameReviewses = gameReviewses;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<CommentLikeForum> getCommentLikeForums_1() {
		return this.commentLikeForums_1;
	}

	public void setCommentLikeForums_1(Set<CommentLikeForum> commentLikeForums_1) {
		this.commentLikeForums_1 = commentLikeForums_1;
	}

	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="users_roles", catalog="duan2_webapplication_tintucgame", joinColumns = {
			@JoinColumn(name="user_id", nullable=false, updatable=false) }, inverseJoinColumns = {
			@JoinColumn(name="role_id", nullable=false, updatable=false) })
	public Set<Roles> getRoleses() {
		return this.roleses;
	}

	public void setRoleses(Set<Roles> roleses) {
		this.roleses = roleses;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<ArticleForum> getArticleForums() {
		return this.articleForums;
	}

	public void setArticleForums(Set<ArticleForum> articleForums) {
		this.articleForums = articleForums;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<ArticleForum> getArticleForums_1() {
		return this.articleForums_1;
	}

	public void setArticleForums_1(Set<ArticleForum> articleForums_1) {
		this.articleForums_1 = articleForums_1;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<GameReviews> getGameReviewses_1() {
		return this.gameReviewses_1;
	}

	public void setGameReviewses_1(Set<GameReviews> gameReviewses_1) {
		this.gameReviewses_1 = gameReviewses_1;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<CommentForum> getCommentForums_1() {
		return this.commentForums_1;
	}

	public void setCommentForums_1(Set<CommentForum> commentForums_1) {
		this.commentForums_1 = commentForums_1;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<CommentLike> getCommentLikes() {
		return this.commentLikes;
	}

	public void setCommentLikes(Set<CommentLike> commentLikes) {
		this.commentLikes = commentLikes;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<ArticleLikeForum> getArticleLikeForums_1() {
		return this.articleLikeForums_1;
	}

	public void setArticleLikeForums_1(Set<ArticleLikeForum> articleLikeForums_1) {
		this.articleLikeForums_1 = articleLikeForums_1;
	}
	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<Article> getArticles_1() {
		return this.articles_1;
	}

	public void setArticles_1(Set<Article> articles_1) {
		this.articles_1 = articles_1;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<ArticleLike> getArticleLikes_1() {
		return this.articleLikes_1;
	}

	public void setArticleLikes_1(Set<ArticleLike> articleLikes_1) {
		this.articleLikes_1 = articleLikes_1;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<Comment> getComments_1() {
		return this.comments_1;
	}

	public void setComments_1(Set<Comment> comments_1) {
		this.comments_1 = comments_1;
	}

	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="users_roles", catalog="duan2_webapplication_tintucgame", joinColumns = {
			@JoinColumn(name="user_id", nullable=false, updatable=false) }, inverseJoinColumns = {
			@JoinColumn(name="role_id", nullable=false, updatable=false) })
	public Set<Roles> getRoleses_1() {
		return this.roleses_1;
	}

	public void setRoleses_1(Set<Roles> roleses_1) {
		this.roleses_1 = roleses_1;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public Set<CommentLike> getCommentLikes_1() {
		return this.commentLikes_1;
	}

	public void setCommentLikes_1(Set<CommentLike> commentLikes_1) {
		this.commentLikes_1 = commentLikes_1;
	}


}
