package net.team6.protectivepaws.model;

public class Bird {

	private Long id;
	private String name;
	private Long supplies_needed;
	private Long care;
	
	
	protected Bird() {
		
	}
	
	public Bird (long id, String name, long supplies_needed, long care) {
		super();
		this.id = id;
		this.name = name;
		this.supplies_needed = supplies_needed;
		this.care = care;
	}

	public Bird (String name, long supplies_needed, long care){
		super();
		this.name = name;
		this.supplies_needed = supplies_needed;
		this.care = care;
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
	
	public Long getsupplies_needed() {
		return supplies_needed;
	}

	public void setsupplies_needed(Long supplies_needed) {
		this.supplies_needed = supplies_needed;
	}

	public Long getCare() {
		return care;
	}

	public void setCare(Long care) {
		this.care = care;
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
		Bird other = (Bird) obj;
		if (id != other.id)
			return false;
		return true;
	}
}
