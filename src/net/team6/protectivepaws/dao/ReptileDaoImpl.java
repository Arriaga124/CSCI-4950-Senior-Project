package net.team6.protectivepaws.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import net.team6.protectivepaws.model.Reptile;
import net.team6.protectivepaws.utils.JDBCUtils;


public class ReptileDaoImpl implements ReptileDao {

	private static final String INSERT_REPTILES_SQL = "INSERT INTO reptiles"
			+ "  (name, supplies_needed, care) VALUES " + " (?, ?, ?);";

	private static final String SELECT_REPTILE_BY_ID = "select id,name,supplies_needed,care from reptiles where id =?";
	private static final String SELECT_ALL_REPTILES = "select * from reptiles";
	private static final String DELETE_REPTILE_BY_ID = "delete from reptiles where id = ?;";
	private static final String UPDATE_REPTILE = "update reptiles set name = ?, supplies_needed = ?, care = ? where id = ?";

	public ReptileDaoImpl() {
	}

	@Override
	public void insertReptile(Reptile reptile) throws SQLException {
		System.out.println(INSERT_REPTILES_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_REPTILES_SQL)) {
			preparedStatement.setString(1, reptile.getName());
			preparedStatement.setLong(2, reptile.getsupplies_needed());
			preparedStatement.setLong(3, reptile.getCare());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
	}

	@Override
	public Reptile selectReptile(long reptileId) {
		
		Reptile reptile = null;
		// attempts to establish a connection
		try (Connection connection = JDBCUtils.getConnection();
				// creates a new statement using the connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPTILE_BY_ID);) {
			preparedStatement.setLong(1, reptileId);
			System.out.println(preparedStatement);
			// execute the query or update the query
			ResultSet rs = preparedStatement.executeQuery();

			// process the rs object
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				reptile = new Reptile (id, name, supplies_needed, care);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return reptile;
	}

	@Override
	public List<Reptile> selectAllReptiles() {

		
		List<Reptile> reptiles = new ArrayList<>();

		
		try (Connection connection = JDBCUtils.getConnection();

				
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_REPTILES);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				reptiles.add(new Reptile(id, name, supplies_needed, care));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return reptiles;
	}

	@Override
	public boolean deleteReptile(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_REPTILE_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateReptile(Reptile reptile) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_REPTILE);) {
			statement.setString(1, reptile.getName());
			statement.setLong(2, reptile.getsupplies_needed());
			statement.setLong(3, reptile.getCare());
			statement.setLong(4, reptile.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
}
