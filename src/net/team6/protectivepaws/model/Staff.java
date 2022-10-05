package net.team6.protectivepaws.model;

public class Staff {

	private Long id;
	private String name;
	private String position;
	private Long time;
	private Long phone;
	
	
	protected Staff() {
		
	}
	
	public Staff (long id, String name, String position, long time, long phone) {
		super();
		this.id = id;
		this.name = name;
		this.position = position;
		this.time = time;
		this.phone = phone;
	}

	public Staff (String name, String position, long time, long phone){
		super();
		this.name = name;
		this.position = position;
		this.time = time;
		this.phone = phone;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Long getTime() {
		return time;
	}

	public void setTime(Long time) {
		this.time = time;
	}
	
	public Long getPhone() {
		return phone;
	}

	public void setPhone(Long phone) {
		this.phone = phone;
	}

	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Staff other = (Staff) obj;
		if (id != other.id)
			return false;
		return true;
	}
}
