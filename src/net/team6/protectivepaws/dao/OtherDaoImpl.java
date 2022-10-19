package net.team6.protectivepaws.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import net.team6.protectivepaws.model.Other;
import net.team6.protectivepaws.utils.JDBCUtils;


public class OtherDaoImpl implements OtherDao {

	private static final String INSERT_OTHERS_SQL = "INSERT INTO others"+"  (name, supplies_needed, care) VALUES " + " (?, ?, ?);";
	private static final String SELECT_ALL_OTHERS_SUPPLY = "select supplies_needed from others";
	private static final String SELECT_ALL_OTHERS_CARE = "select care from others";
	private static final String SELECT_OTHER_BY_ID = "select id,name,supplies_needed,care from others where id =?";
	private static final String SELECT_ALL_OTHERS = "select * from others";
	private static final String DELETE_OTHER_BY_ID = "delete from others where id = ?;";
	private static final String UPDATE_OTHER = "update others set name = ?, supplies_needed = ?, care = ? where id = ?";

	public OtherDaoImpl() {
	}

	@Override
	public void insertOther(Other other) throws SQLException {
		System.out.println(INSERT_OTHERS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_OTHERS_SQL)) {
			preparedStatement.setString(1, other.getName());
			preparedStatement.setLong(2, other.getsupplies_needed());
			preparedStatement.setLong(3, other.getCare());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
	}

	@Override
	public Other selectOther(long otherId) {
		
		Other other = null;
		// attempts to establish a connection
		try (Connection connection = JDBCUtils.getConnection();
				// creates a new statement using the connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_OTHER_BY_ID);) {
			preparedStatement.setLong(1, otherId);
			System.out.println(preparedStatement);
			// execute the query or update the query
			ResultSet rs = preparedStatement.executeQuery();

			// process the rs object
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				other = new Other(id, name, supplies_needed, care);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return other;
	}

	@Override
	public List<Other> selectAllOthers() {

		
		List<Other> others = new ArrayList<>();

		
		try (Connection connection = JDBCUtils.getConnection();

				
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_OTHERS);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				others.add(new Other(id, name, supplies_needed, care));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return others;
	}
	
	public int selectAllOthersSupply() {

		int otherSupplyNeedTotal = 0;
		try (Connection connection = JDBCUtils.getConnection();	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_OTHERS_SUPPLY);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				otherSupplyNeedTotal = (int)(rs.getLong("supplies_needed")+ otherSupplyNeedTotal);
				//dogsSupply.add(new Dog(supplies_needed));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return otherSupplyNeedTotal;
	}
	
	public int selectAllOthersCare() {

		int otherCareNeedTotal = 0;
		try (Connection connection = JDBCUtils.getConnection();	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_OTHERS_CARE);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				otherCareNeedTotal = (int)(rs.getLong("care")+ otherCareNeedTotal);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return otherCareNeedTotal;
	}

	@Override
	public boolean deleteOther(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_OTHER_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateOther(Other other) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_OTHER);) {
			statement.setString(1, other.getName());
			statement.setLong(2, other.getsupplies_needed());
			statement.setLong(3, other.getCare());
			statement.setLong(4, other.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
}
