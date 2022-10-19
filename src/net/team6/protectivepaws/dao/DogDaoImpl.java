package net.team6.protectivepaws.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import net.team6.protectivepaws.model.Dog;
import net.team6.protectivepaws.utils.JDBCUtils;


public class DogDaoImpl implements DogDao {

	private static final String INSERT_DOGS_SQL = "INSERT INTO dogs"
			+ "  (name, supplies_needed, care) VALUES " + " (?, ?, ?);";

	private static final String SELECT_DOG_BY_ID = "select id,name,supplies_needed,care from dogs where id =?";
	private static final String SELECT_ALL_DOGS_SUPPLY = "select supplies_needed from dogs";
	private static final String SELECT_ALL_DOGS_CARE = "select care from dogs";
	private static final String SELECT_ALL_DOGS = "select * from dogs";
	private static final String DELETE_DOG_BY_ID = "delete from dogs where id = ?;";
	private static final String UPDATE_DOG = "update dogs set name = ?, supplies_needed = ?, care = ? where id = ?";

	public DogDaoImpl() {
	}

	@Override
	public void insertDog(Dog dog) throws SQLException {
		System.out.println(INSERT_DOGS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DOGS_SQL)) {
			preparedStatement.setString(1, dog.getName());
			preparedStatement.setLong(2, dog.getsupplies_needed());
			preparedStatement.setLong(3, dog.getCare());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
	}

	@Override
	public Dog selectDog(long dogId) {
		
		Dog dog = null;
		// attempts to establish a connection
		try (Connection connection = JDBCUtils.getConnection();
				// creates a new statement using the connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DOG_BY_ID);) {
			preparedStatement.setLong(1, dogId);
			System.out.println(preparedStatement);
			// execute the query or update the query
			ResultSet rs = preparedStatement.executeQuery();

			// process the rs object
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				dog = new Dog(id, name, supplies_needed, care);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return dog;
	}

	@Override
	public List<Dog> selectAllDogs() {

		
		List<Dog> dogs = new ArrayList<>();

		
		try (Connection connection = JDBCUtils.getConnection();

				
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DOGS);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				dogs.add(new Dog(id, name, supplies_needed, care));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return dogs;
	}
	
	
	public int selectAllDogsSupply() {

		int dogSupplyNeedTotal = 0;
		try (Connection connection = JDBCUtils.getConnection();	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DOGS_SUPPLY);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				dogSupplyNeedTotal = (int)(rs.getLong("supplies_needed")+ dogSupplyNeedTotal);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return dogSupplyNeedTotal;
	}
	
	public int selectAllDogsCare() {

		int dogCareNeedTotal = 0;
		try (Connection connection = JDBCUtils.getConnection();	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DOGS_CARE);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				dogCareNeedTotal = (int)(rs.getLong("care")+ dogCareNeedTotal);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return dogCareNeedTotal;
	}

	@Override
	public boolean deleteDog(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_DOG_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateDog(Dog dog) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_DOG);) {
			statement.setString(1, dog.getName());
			statement.setLong(2, dog.getsupplies_needed());
			statement.setLong(3, dog.getCare());
			statement.setLong(4, dog.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
}
