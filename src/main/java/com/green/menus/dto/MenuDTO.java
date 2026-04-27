package com.green.menus.dto;

public class MenuDTO {
	// Field
	private String  menu_id;
	private String  menu_name;
	private int     menu_seq;
	
	// Constructor
	public MenuDTO() {}
	public MenuDTO(String menu_id, String menu_name, int menu_seq) {
		this.menu_id = menu_id;
		this.menu_name = menu_name;
		this.menu_seq = menu_seq;
	}
	 
	//Getter/Setter   menu_id -> get Menu_id () 
	               // menu_Id -> get Menu_Id ()
	// 칼럼이름과 동일한것을 가져가서 넣어주면 내가 등록한걸로 알아서 바꿔준다  ex) 현재는 return menu_id, getMenu_id 로
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_seq() {
		return menu_seq;
	}
	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}
	
	// toString
	@Override
	public String toString() {
		return "MenuDTO [menu_id=" + menu_id + ", menu_name=" + menu_name + ", menu_seq=" + menu_seq + "]";
	}	
}
