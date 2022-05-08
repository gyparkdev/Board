package org.zerock.domain;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
//		System.out.println("==============================");
//		System.out.println("getTypeArr....................");
		return type == null? new String[] {}: type.split("");
	}
	
}
