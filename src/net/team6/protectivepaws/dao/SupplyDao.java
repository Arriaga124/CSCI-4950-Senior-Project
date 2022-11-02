package net.team6.protectivepaws.dao;

import java.sql.SQLException;
import java.util.List;

import net.team6.protectivepaws.model.Supply;

public interface SupplyDao {

	void insertSupply(Supply supply) throws SQLException;

	Supply selectSupply(long SupplyId);

	int selectAllSuppliesBySpecies(String type);
	
	boolean deleteSupply(int id) throws SQLException;

	boolean updateSupply(Supply supply) throws SQLException;
	
	List<Supply> selectAllSupplys();

}