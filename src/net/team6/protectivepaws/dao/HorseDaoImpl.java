package net.team6.protectivepaws.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import net.team6.protectivepaws.model.Horse;
import net.team6.protectivepaws.utils.JDBCUtils;


public class HorseDaoImpl implements HorseDao {

	private static final String INSERT_HORSES_SQL = "INSERT INTO horses"+"  (name, supplies_needed, care) VALUES " + " (?, ?, ?);";
	private static final String SELECT_ALL_HORSES_SUPPLY = "select supplies_needed from horses";
	private static final String SELECT_ALL_HORSES_CARE = "select care from horses";
	private static final String SELECT_HORSE_BY_ID = "select id,name,supplies_needed,care from horses where id =?";
	private static final String SELECT_ALL_HORSES = "select * from horses";
	private static final String DELETE_HORSE_BY_ID = "delete from horses where id = ?;";
	private static final String UPDATE_HORSE = "update horses set name = ?, supplies_needed = ?, care = ? where id = ?";

	public HorseDaoImpl() {
	}

	@Override
	public void insertHorse(Horse horse) throws SQLException {
		System.out.println(INSERT_HORSES_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_HORSES_SQL)) {
			preparedStatement.setString(1, horse.getName());
			preparedStatement.setLong(2, horse.getsupplies_needed());
			preparedStatement.setLong(3, horse.getCare());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
	}

	@Override
	public Horse selectHorse(long horseId) {
		
		Horse horse = null;
		// attempts to establish a connection
		try (Connection connection = JDBCUtils.getConnection();
				// creates a new statement using the connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HORSE_BY_ID);) {
			preparedStatement.setLong(1, horseId);
			System.out.println(preparedStatement);
			// execute the query or update the query
			ResultSet rs = preparedStatement.executeQuery();

			// process the rs object
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				horse = new Horse(id, name, supplies_needed, care);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return horse;
	}

	@Override
	public List<Horse> selectAllHorses() {

		
		List<Horse> horses = new ArrayList<>();

		
		try (Connection connection = JDBCUtils.getConnection();

				
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_HORSES);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				horses.add(new Horse(id, name, supplies_needed, care));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return horses;
	}

	public int selectAllHorsesSupply() {

		int horseSupplyNeedTotal = 0;
		try (Connection connection = JDBCUtils.getConnection();	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_HORSES_SUPPLY);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				horseSupplyNeedTotal = (int)(rs.getLong("supplies_needed")+ horseSupplyNeedTotal);
				//dogsSupply.add(new Dog(supplies_needed));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return horseSupplyNeedTotal;
	}
	
	public int selectAllHorsesCare() {

		int horseCareNeedTotal = 0;
		try (Connection connection = JDBCUtils.getConnection();	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_HORSES_CARE);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				horseCareNeedTotal = (int)(rs.getLong("care")+ horseCareNeedTotal);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return horseCareNeedTotal;
	}
	
	@Override
	public boolean deleteHorse(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_HORSE_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateHorse(Horse horse) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_HORSE);) {
			statement.setString(1, horse.getName());
			statement.setLong(2, horse.getsupplies_needed());
			statement.setLong(3, horse.getCare());
			statement.setLong(4, horse.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
}
