package threeblog.entity;

import java.sql.Date;

public class Article {
    
	private int id;
	private int click_num;
	private String title;
	private String introduction;
	private String text;
	private String pic;
	private int author_id;
	private String author;
	private Date publishdate;
	private String lable;
	private String allpic;
	private int liked;
	private int collected;
	private int comment_num;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getCollected() {
		return collected;
	}
	public void setCollected(int collected) {
		this.collected = collected;
	}
	public int getLiked() {
		return liked;
	}
	public void setLiked(int liked) {
		this.liked = liked;
	}
	public String getAllpic() {
		return allpic;
	}
	public void setAllpic(String allpic) {
		this.allpic = allpic;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getClick_num() {
		return click_num;
	}
	public void setClick_num(int click_num) {
		this.click_num = click_num;
	}
	public String getLable() {
		return lable;
	}
	public void setLable(String biaoqian) {
		this.lable = biaoqian;
	}
	public Date getPublishdate() {
		return publishdate;
	}
	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	
	
}
