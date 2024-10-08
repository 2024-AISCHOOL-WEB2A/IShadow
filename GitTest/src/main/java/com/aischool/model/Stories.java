package com.aischool.model;

public class Stories {
	
	private int idx;
	private String video;
	private String anser;
	private int next_story_idx;
	private String hint;
	private String storyName;
	private String storyImage;
	
	public Stories() {};
	
	public Stories(int idx, String video, String anser, int next_story_idx, String hint
			, String storyName, String storyImage) {
		this.idx = idx;
		this.video = video;
		this.anser = anser;
		this.next_story_idx = next_story_idx;
		this.hint = hint;
		this.storyName = storyName;
		this.storyImage = storyImage;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getVideo() {
		return video;
	}

	public void setViedo(String viedo) {
		this.video = viedo;
	}

	public String getAnser() {
		return anser;
	}

	public void setAnser(String anser) {
		this.anser = anser;
	}

	public int getNext_story_idx() {
		return next_story_idx;
	}

	public void setNext_story_idx(int next_story_idx) {
		this.next_story_idx = next_story_idx;
	}

	public String getHint() {
		return hint;
	}

	public void setHint(String hint) {
		this.hint = hint;
	}

	public String getStoryName() {
		return storyName;
	}

	public void setStoryName(String storyName) {
		this.storyName = storyName;
	}

	public String getStoryImage() {
		return storyImage;
	}

	public void setStoryImage(String storyImage) {
		this.storyImage = storyImage;
	}
	
}
