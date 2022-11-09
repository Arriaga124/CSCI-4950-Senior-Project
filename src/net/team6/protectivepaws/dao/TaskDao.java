package net.team6.protectivepaws.dao;

import java.sql.SQLException;
import java.util.List;

import net.team6.protectivepaws.model.Task;

public interface TaskDao {
	
	void insertTask(Task task) throws SQLException;
	
	boolean deleteTask(int id) throws SQLException;
	
	boolean updateTask(Task task) throws SQLException;
	
	List<Task> selectAllTasks();

}
