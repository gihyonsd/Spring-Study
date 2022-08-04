package com.spring.yacamping.domain;

public class MemberVO {
	private int user_num;
	private String id;
    private String password;
    private String name;
    private String nickname;
    private String phone;
    private String birth;
	private String email;
    private String address;
    private String gender;

    
    public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	// getter, setter
    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	// 생성자
    public MemberVO() {

    }

    // to String
    @Override
    public String toString() {
        return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname + ", phone=" + phone + ", birth= " + birth + ", email=" + email + ", address=" + address + ", gender=" + gender+"]";
    }

} 