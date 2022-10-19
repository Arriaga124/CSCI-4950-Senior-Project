package net.team6.protectivepaws.dao;

import java.sql.SQLException;
import java.util.List;

import net.team6.protectivepaws.model.Dog;

public interface DogDao {

	void insertDog(Dog dog) throws SQLException;

	Dog selectDog(long dogId);

	List<Dog> selectAllDogs();
	
	int selectAllDogsSupply();
	
	int selectAllDogsCare();

	boolean deleteDog(int id) throws SQLException;

	boolean updateDog(Dog dog) throws SQLException;

}