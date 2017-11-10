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

/**
 * Games generated by hbm2java
 */
@Entity
@Table(name = "games", catalog = "duan2_webapplication_tintucgame", uniqueConstraints = {
		@UniqueConstraint(columnNames = "name"), @UniqueConstraint(columnNames = "slug") })
public class Games implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4682167895841921756L;
	private Integer gameId;
	private String name;
	private String slug;
	private String images;
	private String developers;
	private String publishers;
	private String writers;
	private String composers;
	private String engine;
	private String platforms;
	private Date releases;
	private String info;
	private String status;
	private String description;
	private Set<GameReviews> gameReviewses = new HashSet<GameReviews>(0);
	private Set<GameReviews> gameReviewses_1 = new HashSet<GameReviews>(0);
	private Set<GameCategory> gameCategories = new HashSet<GameCategory>(0);
	private Set<GameCategory> gameCategories_1 = new HashSet<GameCategory>(0);

	public Games() {
	}


	public Games(String name, String slug, String images, String publishers, Date releases, String status) {
		this.name = name;
		this.slug = slug;
		this.images = images;
		this.publishers = publishers;
		this.releases = releases;
		this.status = status;
	}
	public Games(String name, String slug, String images, String developers, String publishers, String writers, String composers, String engine, String platforms, Date releases, String info, String status, String description, Set<GameReviews> gameReviewses, Set<GameReviews> gameReviewses_1, Set<GameCategory> gameCategories, Set<GameCategory> gameCategories_1) {
		this.name = name;
		this.slug = slug;
		this.images = images;
		this.developers = developers;
		this.publishers = publishers;
		this.writers = writers;
		this.composers = composers;
		this.engine = engine;
		this.platforms = platforms;
		this.releases = releases;
		this.info = info;
		this.status = status;
		this.description = description;
		this.gameReviewses = gameReviewses;
		this.gameReviewses_1 = gameReviewses_1;
		this.gameCategories = gameCategories;
		this.gameCategories_1 = gameCategories_1;
	}

	@Id @GeneratedValue(strategy=IDENTITY)


	@Column(name="game_id", unique=true, nullable=false)
	public Integer getGameId() {
		return this.gameId;
	}

	public void setGameId(Integer gameId) {
		this.gameId = gameId;
	}


	@Column(name="name", unique=true, nullable=false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}


	@Column(name="slug", unique=true, nullable=false)
	public String getSlug() {
		return this.slug;
	}

	public void setSlug(String slug) {
		this.slug = slug;
	}


	@Column(name="images", nullable=false, length=65535)
	public String getImages() {
		return this.images;
	}

	public void setImages(String images) {
		this.images = images;
	}


	@Column(name="developers", length=1000)
	public String getDevelopers() {
		return this.developers;
	}

	public void setDevelopers(String developers) {
		this.developers = developers;
	}


	@Column(name="publishers", nullable=false, length=1000)
	public String getPublishers() {
		return this.publishers;
	}

	public void setPublishers(String publishers) {
		this.publishers = publishers;
	}


	@Column(name="writers", length=1000)
	public String getWriters() {
		return this.writers;
	}

	public void setWriters(String writers) {
		this.writers = writers;
	}


	@Column(name="composers", length=1000)
	public String getComposers() {
		return this.composers;
	}

	public void setComposers(String composers) {
		this.composers = composers;
	}


	@Column(name="engine", length=1000)
	public String getEngine() {
		return this.engine;
	}

	public void setEngine(String engine) {
		this.engine = engine;
	}


	@Column(name="platforms", length=1000)
	public String getPlatforms() {
		return this.platforms;
	}

	public void setPlatforms(String platforms) {
		this.platforms = platforms;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="releases", nullable=false, length=19)
	public Date getReleases() {
		return this.releases;
	}

	public void setReleases(Date releases) {
		this.releases = releases;
	}


	@Column(name="info", length=1000)
	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}


	@Column(name="status", nullable=false, length=8)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	@Column(name="description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="games")
	public Set<GameReviews> getGameReviewses() {
		return this.gameReviewses;
	}

	public void setGameReviewses(Set<GameReviews> gameReviewses) {
		this.gameReviewses = gameReviewses;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="games")
	public Set<GameReviews> getGameReviewses_1() {
		return this.gameReviewses_1;
	}

	public void setGameReviewses_1(Set<GameReviews> gameReviewses_1) {
		this.gameReviewses_1 = gameReviewses_1;
	}

	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="games_games_category", catalog="duan2_webapplication_tintucgame", joinColumns = {
			@JoinColumn(name="game_id", nullable=false, updatable=false) }, inverseJoinColumns = {
			@JoinColumn(name="game_category_id", nullable=false, updatable=false) })
	public Set<GameCategory> getGameCategories() {
		return this.gameCategories;
	}

	public void setGameCategories(Set<GameCategory> gameCategories) {
		this.gameCategories = gameCategories;
	}

	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="games_games_category", catalog="duan2_webapplication_tintucgame", joinColumns = {
			@JoinColumn(name="game_id", nullable=false, updatable=false) }, inverseJoinColumns = {
			@JoinColumn(name="game_category_id", nullable=false, updatable=false) })
	public Set<GameCategory> getGameCategories_1() {
		return this.gameCategories_1;
	}

	public void setGameCategories_1(Set<GameCategory> gameCategories_1) {
		this.gameCategories_1 = gameCategories_1;
	}



}
