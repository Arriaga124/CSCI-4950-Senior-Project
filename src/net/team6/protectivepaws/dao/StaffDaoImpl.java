package net.team6.protectivepaws.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import net.team6.protectivepaws.model.Staff;
import net.team6.protectivepaws.utils.JDBCUtils;


public class StaffDaoImpl implements StaffDao {

	private static final String INSERT_STAFF_SQL = "INSERT INTO staff"
			+ "  (name, position, time, phone) VALUES " + " (?, ?, ?, ?);";

	private static final String SELECT_STAFF_BY_ID = "select id,name,position,time,phone from staff where id =?";
	private static final String SELECT_ALL_STAFF = "select * from staff";
	private static final String DELETE_STAFF_BY_ID = "delete from staff where id = ?;";
	private static final String UPDATE_STAFF = "update staff set name = ?, position = ?, time = ?, phone = ? where id = ?";

	public StaffDaoImpl() {
	}

	@Override
	public void insertStaff(Staff staff) throws SQLException {
		System.out.println(INSERT_STAFF_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STAFF_SQL)) {
			preparedStatement.setString(1, staff.getName());
			preparedStatement.setString(2, staff.getPosition());
			preparedStatement.setLong(3, staff.getTime());
			preparedStatement.setLong(4, staff.getPhone());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
	}

	@Override
	public Staff selectStaff(long staffId) {
		
		Staff staff = null;
		// attempts to establish a connection
		try (Connection connection = JDBCUtils.getConnection();
				// creates a new statement using the connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STAFF_BY_ID);) {
			preparedStatement.setLong(1, staffId);
			System.out.println(preparedStatement);
			// execute the query or update the query
			ResultSet rs = preparedStatement.executeQuery();

			// process the rs object
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				String position = rs.getString("position");
				Long time = rs.getLong("time");
				Long phone = rs.getLong("phone");
				staff = new Staff(id, name, position, time, phone);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return staff;
	}

	@Override
	public List<Staff> selectAllStaffs() {

		
		List<Staff> staff = new ArrayList<>();

		
		try (Connection connection = JDBCUtils.getConnection();

				
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STAFF);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				String position = rs.getString("position");
				Long time = rs.getLong("time");
				Long phone = rs.getLong("phone");
				staff.add(new Staff(id, name, position, time, phone));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return staff;
	}

	@Override
	public boolean deleteStaff(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_STAFF_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateStaff(Staff staff) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_STAFF);) {
			statement.setString(1, staff.getName());
			statement.setString(2, staff.getPosition());
			statement.setLong(3, staff.getTime());
			statement.setLong(4, staff.getPhone());
			statement.setLong(5, staff.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
}
