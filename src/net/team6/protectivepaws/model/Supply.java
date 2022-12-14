package net.team6.protectivepaws.model;

public class Supply {

	private Long id;
	private String type;
	private String animal;
	private Long amount;
	private String supply_name;
	
	protected Supply() {
		
	}
	
	public Supply (long id, String supply_name, String type, String animal, long amount) {
		super();
		this.id = id;
		this.supply_name = supply_name;
		this.type = type;
		this.animal = animal;
		this.amount = amount;
	}

	public Supply (String supply_name, String type, String animal, long amount){
		super();
		this.supply_name = supply_name;
		this.type = type;
		this.animal = animal;
		this.amount = amount;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getSupply_name() {
		return supply_name;
	}
	
	public void setSupply_name(String supply_name) {
		this.supply_name = supply_name;
	}

	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getAnimal() {
		return animal;
	}
	
	public void setAnimal(String animal) {
		this.animal = animal;
	}
	

	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
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
		Supply other = (Supply) obj;
		if (id != other.id)
			return false;
		return true;
	}
}
