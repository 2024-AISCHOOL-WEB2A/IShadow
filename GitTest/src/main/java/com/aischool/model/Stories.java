package com.aischool.model;

public class Stories {
	
	private int idx;
	private String viedo;
	private String anser;
	private int next_story_idx;
	private String hint;
	
	public Stories() {};
	
	public Stories(int idx, String viedo, String anser, int next_story_idx, String hint) {
		super();
		this.idx = idx;
		this.viedo = viedo;
		this.anser = anser;
		this.next_story_idx = next_story_idx;
		this.hint = hint;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getViedo() {
		return viedo;
	}

	public void setViedo(String viedo) {
		this.viedo = viedo;
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
	
}
