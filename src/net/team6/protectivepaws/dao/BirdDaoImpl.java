package net.team6.protectivepaws.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import net.team6.protectivepaws.model.Bird;
import net.team6.protectivepaws.utils.JDBCUtils;


public class BirdDaoImpl implements BirdDao {

	private static final String INSERT_BIRDS_SQL = "INSERT INTO birds"
			+ "  (name, supplies_needed, care) VALUES " + " (?, ?, ?);";

	private static final String SELECT_BIRD_BY_ID = "select id,name,supplies_needed,care from birds where id =?";
	private static final String SELECT_ALL_BIRDS = "select * from birds";
	private static final String DELETE_BIRD_BY_ID = "delete from birds where id = ?;";
	private static final String UPDATE_BIRD = "update birds set name = ?, supplies_needed = ?, care = ? where id = ?";

	public BirdDaoImpl() {
	}

	@Override
	public void insertBird(Bird bird) throws SQLException {
		System.out.println(INSERT_BIRDS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BIRDS_SQL)) {
			preparedStatement.setString(1, bird.getName());
			preparedStatement.setLong(2, bird.getsupplies_needed());
			preparedStatement.setLong(3, bird.getCare());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
	}

	@Override
	public Bird selectBird(long birdId) {
		
		Bird bird = null;
		// attempts to establish a connection
		try (Connection connection = JDBCUtils.getConnection();
				// creates a new statement using the connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BIRD_BY_ID);) {
			preparedStatement.setLong(1, birdId);
			System.out.println(preparedStatement);
			// execute the query or update the query
			ResultSet rs = preparedStatement.executeQuery();

			// process the rs object
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				bird = new Bird(id, name, supplies_needed, care);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return bird;
	}

	@Override
	public List<Bird> selectAllBirds() {

		
		List<Bird> birds = new ArrayList<>();

		
		try (Connection connection = JDBCUtils.getConnection();

				
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BIRDS);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				birds.add(new Bird(id, name, supplies_needed, care));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return birds;
	}

	@Override
	public boolean deleteBird(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_BIRD_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateBird(Bird bird) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_BIRD);) {
			statement.setString(1, bird.getName());
			statement.setLong(2, bird.getsupplies_needed());
			statement.setLong(3, bird.getCare());
			statement.setLong(4, bird.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
}
