package net.team6.protectivepaws.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import net.team6.protectivepaws.model.Cat;
import net.team6.protectivepaws.utils.JDBCUtils;


public class CatDaoImpl implements CatDao {

	private static final String INSERT_CATS_SQL = "INSERT INTO cats"+"  (name, supplies_needed, care) VALUES " + " (?, ?, ?);";
	private static final String SELECT_ALL_CATS_SUPPLY = "select supplies_needed from cats";
	private static final String SELECT_ALL_CATS_CARE = "select care from cats";
	private static final String SELECT_CAT_BY_ID = "select id,name,supplies_needed,care from cats where id =?";
	private static final String SELECT_ALL_CATS = "select * from cats";
	private static final String DELETE_CAT_BY_ID = "delete from cats where id = ?;";
	private static final String UPDATE_CAT = "update cats set name = ?, supplies_needed = ?, care = ? where id = ?";

	public CatDaoImpl() {
	}

	@Override
	public void insertCat(Cat cat) throws SQLException {
		System.out.println(INSERT_CATS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CATS_SQL)) {
			preparedStatement.setString(1, cat.getName());
			preparedStatement.setLong(2, cat.getsupplies_needed());
			preparedStatement.setLong(3, cat.getCare());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
	}

	@Override
	public Cat selectCat(long catId) {
		
		Cat cat = null;
		// attempts to establish a connection
		try (Connection connection = JDBCUtils.getConnection();
				// creates a new statement using the connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CAT_BY_ID);) {
			preparedStatement.setLong(1, catId);
			System.out.println(preparedStatement);
			// execute the query or update the query
			ResultSet rs = preparedStatement.executeQuery();

			// process the rs object
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				cat = new Cat(id, name, supplies_needed, care);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return cat;
	}

	@Override
	public List<Cat> selectAllCats() {

		
		List<Cat> cats = new ArrayList<>();

		
		try (Connection connection = JDBCUtils.getConnection();

				
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATS);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				cats.add(new Cat(id, name, supplies_needed, care));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return cats;
	}
	
	public int selectAllCatsSupply() {

		int catSupplyNeedTotal = 0;
		try (Connection connection = JDBCUtils.getConnection();	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATS_SUPPLY);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				catSupplyNeedTotal = (int)(rs.getLong("supplies_needed")+ catSupplyNeedTotal);
				//dogsSupply.add(new Dog(supplies_needed));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return catSupplyNeedTotal;
	}

	public int selectAllCatsCare() {

		int catCareNeedTotal = 0;
		try (Connection connection = JDBCUtils.getConnection();	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATS_CARE);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				catCareNeedTotal = (int)(rs.getLong("care")+ catCareNeedTotal);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return catCareNeedTotal;
	}
	
	@Override
	public boolean deleteCat(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_CAT_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateCat(Cat cat) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_CAT);) {
			statement.setString(1, cat.getName());
			statement.setLong(2, cat.getsupplies_needed());
			statement.setLong(3, cat.getCare());
			statement.setLong(4, cat.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
}
