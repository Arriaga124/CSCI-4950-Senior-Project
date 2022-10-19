package net.team6.protectivepaws.dao;

import java.sql.SQLException;
import java.util.List;

import net.team6.protectivepaws.model.Reptile;

public interface ReptileDao {

	void insertReptile(Reptile reptile) throws SQLException;

	Reptile selectReptile(long ReptileId);

	List<Reptile> selectAllReptiles();
	
	int selectAllReptilesSupply();
	
	int selectAllReptilesCare();

	boolean deleteReptile(int id) throws SQLException;

	boolean updateReptile(Reptile reptile) throws SQLException;

}