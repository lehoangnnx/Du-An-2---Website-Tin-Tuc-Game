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
 * CommentLike generated by hbm2java
 */
@Entity
@Table(name = "comment_like", catalog = "duan2_webapplication_tintucgame")
public class CommentLike implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7592034478554382296L;
	private Integer commentLikeId;
	private Comment comment;
	private Users users;
	private Date createDate;
	private String description;

	public CommentLike() {
	}

	public CommentLike(Comment comment, Users users, Date createDate) {
		this.comment = comment;
		this.users = users;
		this.createDate = createDate;
	}

	public CommentLike(Comment comment, Users users, Date createDate, String description) {
		this.comment = comment;
		this.users = users;
		this.createDate = createDate;
		this.description = description;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "comment_like_id", unique = true, nullable = false)
	public Integer getCommentLikeId() {
		return this.commentLikeId;
	}

	public void setCommentLikeId(Integer commentLikeId) {
		this.commentLikeId = commentLikeId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "comment_id", nullable = false)
	public Comment getComment() {
		return this.comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
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
