package net.team6.protectivepaws.dao;

import java.sql.SQLException;
import java.util.List;

import net.team6.protectivepaws.model.Bird;

public interface BirdDao {

	void insertBird(Bird bird) throws SQLException;

	Bird selectBird(long BirdId);

	List<Bird> selectAllBirds();

	boolean deleteBird(int id) throws SQLException;

	boolean updateBird(Bird bird) throws SQLException;

}