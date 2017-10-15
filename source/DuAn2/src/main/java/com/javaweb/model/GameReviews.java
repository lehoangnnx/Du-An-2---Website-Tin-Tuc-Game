package com.javaweb.model;
// Generated Oct 15, 2017 3:20:39 PM by Hibernate Tools 5.2.5.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * GameReviews generated by hbm2java
 */
@Entity
@Table(name = "game_reviews", catalog = "duan2_webapplication_tintucgame")
public class GameReviews implements java.io.Serializable {

	private int gameReviewId;
	private Games games;
	private Users users;
	private Date createDate;
	private double review;
	private byte status;
	private String description;

	public GameReviews() {
	}

	public GameReviews(int gameReviewId, Games games, Users users, Date createDate, double review, byte status) {
		this.gameReviewId = gameReviewId;
		this.games = games;
		this.users = users;
		this.createDate = createDate;
		this.review = review;
		this.status = status;
	}

	public GameReviews(int gameReviewId, Games games, Users users, Date createDate, double review, byte status,
			String description) {
		this.gameReviewId = gameReviewId;
		this.games = games;
		this.users = users;
		this.createDate = createDate;
		this.review = review;
		this.status = status;
		this.description = description;
	}

	@Id

	@Column(name = "game_review_id", unique = true, nullable = false)
	public int getGameReviewId() {
		return this.gameReviewId;
	}

	public void setGameReviewId(int gameReviewId) {
		this.gameReviewId = gameReviewId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "game_id", nullable = false)
	public Games getGames() {
		return this.games;
	}

	public void setGames(Games games) {
		this.games = games;
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

	@Column(name = "review", nullable = false, precision = 22, scale = 0)
	public double getReview() {
		return this.review;
	}

	public void setReview(double review) {
		this.review = review;
	}

	@Column(name = "status", nullable = false)
	public byte getStatus() {
		return this.status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
