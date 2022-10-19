package net.team6.protectivepaws.dao;

import java.sql.SQLException;
import java.util.List;

import net.team6.protectivepaws.model.Cat;

public interface CatDao {

	void insertCat(Cat cat) throws SQLException;

	Cat selectCat(long CatId);

	List<Cat> selectAllCats();
	
	int selectAllCatsSupply();
	
	int selectAllCatsCare();

	boolean deleteCat(int id) throws SQLException;

	boolean updateCat(Cat cat) throws SQLException;

}