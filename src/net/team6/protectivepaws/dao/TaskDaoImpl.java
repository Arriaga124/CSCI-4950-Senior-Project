package net.team6.protectivepaws.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import net.team6.protectivepaws.model.Task;
import net.team6.protectivepaws.utils.JDBCUtils;

public class TaskDaoImpl implements TaskDao {
	
	private static final String INSERT_TASK_SQL = "INSERT INTO tasks"
			+ "  (task, priority) VALUES " + " (?, ?);";
	private static final String DELETE_TASK_BY_ID = "delete from tasks where id = ?;";
	private static final String UPDATE_TASK = "update tasks set task = ?, priority = ? where id = ?";
	private static final String SELECT_ALL_TASKS = "select * from tasks";

	@Override
	public void insertTask(Task task) throws SQLException {
		System.out.println(INSERT_TASK_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TASK_SQL)) {
			preparedStatement.setString(1, task.getTask());
			preparedStatement.setString(2, task.getPriority());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		
	}

	@Override
	public boolean deleteTask(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_TASK_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateTask(Task task) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_TASK);) {
			statement.setString(1, task.getTask());
			statement.setString(2, task.getPriority());
			statement.setLong(3, task.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	
	@Override
	public List<Task> selectAllTasks() {

		
		List<Task> tasks = new ArrayList<>();

		
		try (Connection connection = JDBCUtils.getConnection();

				
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TASKS);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String task = rs.getString("task");
				String priority = rs.getString("priority");
				tasks.add(new Task(id, task, priority));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return tasks;
	}

}
