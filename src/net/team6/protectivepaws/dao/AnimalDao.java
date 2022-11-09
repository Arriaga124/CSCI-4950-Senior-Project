package net.team6.protectivepaws.dao;

import java.sql.SQLException;
import java.util.List;

import net.team6.protectivepaws.model.Animal;

public interface AnimalDao {

	void insertAnimal(Animal animal) throws SQLException;

	Animal selectAnimal(long animalId);

	List<Animal> selectAllBySpecies(String type);
	
	int selectAllSupplyBySpecies(String type);
	
	int selectAllCareBySpecies(String type);

	boolean deleteAnimal(int id) throws SQLException;

	boolean updateAnimal(Animal animal) throws SQLException;
	
	int countAnimals (String type);

}