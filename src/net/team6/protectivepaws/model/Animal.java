package net.team6.protectivepaws.model;

import java.time.LocalDate;

public class Animal {

	private Long id;
	private String name;
	private Long supplies_needed;
	private Long care;
	private String species;
	private String breed;
	private String age;
	private String gender;
	private String color;
	private String declawed;
	private String location;
	private LocalDate intake_date;
	private boolean available;
	private String notes;
	
	
	protected Animal() {}
	

	public Animal(Long id, String name, Long supplies_needed, Long care, String species, String breed, String age,
			String gender, String color, String declawed, String location, LocalDate intake_date, boolean available,
			String notes) {
		super();
		this.id = id;
		this.name = name;
		this.supplies_needed = supplies_needed;
		this.care = care;
		this.species = species;
		this.breed = breed;
		this.age = age;
		this.gender = gender;
		this.color = color;
		this.declawed = declawed;
		this.location = location;
		this.intake_date = intake_date;
		this.available = available;
		this.notes = notes;
	}
	
	

	public Animal(String name, Long supplies_needed, Long care, String species, String breed, String age, String gender,
			String color, String declawed, String location, LocalDate intake_date, boolean available, String notes) {
		super();
		this.name = name;
		this.supplies_needed = supplies_needed;
		this.care = care;
		this.species = species;
		this.breed = breed;
		this.age = age;
		this.gender = gender;
		this.color = color;
		this.declawed = declawed;
		this.location = location;
		this.intake_date = intake_date;
		this.available = available;
		this.notes = notes;
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


	public Long getSupplies_needed() {
		return supplies_needed;
	}


	public void setSupplies_needed(Long supplies_needed) {
		this.supplies_needed = supplies_needed;
	}


	public Long getCare() {
		return care;
	}


	public void setCare(Long care) {
		this.care = care;
	}


	public String getSpecies() {
		return species;
	}


	public void setSpecies(String species) {
		this.species = species;
	}


	public String getBreed() {
		return breed;
	}


	public void setBreed(String breed) {
		this.breed = breed;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getDeclawed() {
		return declawed;
	}


	public void setDeclawed(String declawed) {
		this.declawed = declawed;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public LocalDate getIntake_date() {
		return intake_date;
	}


	public void setIntake_date(LocalDate intake_date) {
		this.intake_date = intake_date;
	}


	public boolean getAvailable() {
		return available;
	}


	public void setAvailable(boolean available) {
		this.available = available;
	}


	public String getNotes() {
		return notes;
	}


	public void setNotes(String notes) {
		this.notes = notes;
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
		Animal other = (Animal) obj;
		if (id != other.id)
			return false;
		return true;
	}
}
