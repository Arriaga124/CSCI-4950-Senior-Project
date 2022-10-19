package net.team6.protectivepaws.dao;

import java.sql.SQLException;
import java.util.List;

import net.team6.protectivepaws.model.Horse;

public interface HorseDao {

	void insertHorse(Horse horse) throws SQLException;

	Horse selectHorse(long HorseId);

	List<Horse> selectAllHorses();
	
	int selectAllHorsesSupply();
	
	int selectAllHorsesCare();

	boolean deleteHorse(int id) throws SQLException;

	boolean updateHorse(Horse horse) throws SQLException;

}