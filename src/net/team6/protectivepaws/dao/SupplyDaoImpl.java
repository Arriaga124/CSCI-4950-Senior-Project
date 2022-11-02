package net.team6.protectivepaws.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import net.team6.protectivepaws.model.Supply;
import net.team6.protectivepaws.utils.JDBCUtils;


public class SupplyDaoImpl implements SupplyDao {

	private static final String INSERT_SUPPLY_SQL = "INSERT INTO supply"
			+ "  (supply_name, type, animal, amount) VALUES " + " (?, ?, ?, ?);";

	private static final String SELECT_SUPPLY_BY_ID = "select id,supply_name,type,animal,amount from supply where id =?";
	private static final String SELECT_SUPPLY_BY_ANIMAL = "select amount from supply where animal = ? and type = \"Food\"";
	private static final String SELECT_ALL_SUPPLY = "select * from supply";
	private static final String DELETE_SUPPLY_BY_ID = "delete from supply where id = ?;";
	private static final String UPDATE_SUPPLY = "update supply set supply_name = ?, type = ?, animal = ?, amount = ? where id = ?";

	public SupplyDaoImpl() {
	}

	@Override
	public void insertSupply(Supply supply) throws SQLException {
		System.out.println(INSERT_SUPPLY_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SUPPLY_SQL)) {
			preparedStatement.setString(1, supply.getSupply_name());
			preparedStatement.setString(2, supply.getType());
			preparedStatement.setString(3, supply.getAnimal());
			preparedStatement.setLong(4, supply.getAmount());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
	}

	@Override
	public Supply selectSupply(long supplyId) {
		
		Supply supply = null;
		// attempts to establish a connection
		try (Connection connection = JDBCUtils.getConnection();
				// creates a new statement using the connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SUPPLY_BY_ID);) {
			preparedStatement.setLong(1, supplyId);
			System.out.println(preparedStatement);
			// execute the query or update the query
			ResultSet rs = preparedStatement.executeQuery();

			// process the rs object
			while (rs.next()) {
				long id = rs.getLong("id");
				String supply_name = rs.getString("supply_name");
				String type = rs.getString("type");
				String animal = rs.getString("animal");
				Long amount = rs.getLong("amount");
				supply = new Supply(id, supply_name, type, animal, amount);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return supply;
	}

	@Override
	public List<Supply> selectAllSupplys() {

		
		List<Supply> supply = new ArrayList<>();

		
		try (Connection connection = JDBCUtils.getConnection();

				
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SUPPLY);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String supply_name = rs.getString("supply_name");
				String type = rs.getString("type");
				String animal = rs.getString("animal");
				Long amount = rs.getLong("amount");
				supply.add(new Supply(id, supply_name, type, animal, amount));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return supply;
	}

	@Override
	public boolean deleteSupply(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_SUPPLY_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateSupply(Supply supply) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_SUPPLY);) {
			statement.setString(1, supply.getSupply_name());
			statement.setString(2, supply.getType());
			statement.setString(3, supply.getAnimal());
			statement.setLong(4, supply.getAmount());
			statement.setLong(5, supply.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	
	
	public int selectAllSuppliesBySpecies(String type) {

		int animalSupplyTotal = 0;
		try (Connection connection = JDBCUtils.getConnection();	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SUPPLY_BY_ANIMAL);) {
			preparedStatement.setString(1, type);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				animalSupplyTotal = (int)(rs.getLong("amount")+ animalSupplyTotal);
				
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return animalSupplyTotal;
	}
	
	
}
