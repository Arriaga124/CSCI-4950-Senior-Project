package net.team6.protectivepaws.dao;

import java.sql.SQLException;
import java.util.List;

import net.team6.protectivepaws.model.Other;

public interface OtherDao {

	void insertOther(Other other) throws SQLException;

	Other selectOther(long OtherId);

	List<Other> selectAllOthers();
	
	int selectAllOthersSupply();
	
	int selectAllOthersCare();

	boolean deleteOther(int id) throws SQLException;

	boolean updateOther(Other other) throws SQLException;

}