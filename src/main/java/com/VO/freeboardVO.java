package com.VO;

public class freeboardVO {
	
	private String post_id;
	private String title;
	private String writer;
	private String content;
	private String post_date;
	private int views;
	private int board_type;
	
	public freeboardVO(String post_id, String title, String writer, String content, String post_date, int views, int board_type) {
		super();
		this.post_id = post_id;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.post_date = post_date;
		this.views = views;
		this.board_type = board_type;
	}
	
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}	
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
}
