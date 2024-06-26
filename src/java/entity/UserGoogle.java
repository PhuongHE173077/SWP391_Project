package entity;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author TUF F15
 */
public class UserGoogle {

    
	private String id;

	private String email;

	private String given_name;
        
	private String family_name;      
        
        private String phone;
        
        private String address;
                
	private String picture;
        

	public UserGoogle() {
	}

    public UserGoogle(String id, String email, String given_name, String family_name, String dob, String phone, String address, String picture, int role_id) {
        this.id = id;
        this.email = email;
        this.given_name = given_name;
        this.family_name = family_name;
        this.phone = phone;
        this.address = address;
        this.picture = picture;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGiven_name() {
        return given_name;
    }

    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }

    public String getFamily_name() {
        return family_name;
    }

    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

	
    

    

}
