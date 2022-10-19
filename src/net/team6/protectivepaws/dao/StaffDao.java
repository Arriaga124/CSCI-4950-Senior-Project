package net.team6.protectivepaws.dao;

import java.sql.SQLException;
import java.util.List;

import net.team6.protectivepaws.model.Staff;

public interface StaffDao {

	void insertStaff(Staff staff) throws SQLException;

	Staff selectStaff(long StaffId);

	List<Staff> selectAllStaffs();
	
	int selectAllCare();

	boolean deleteStaff(int id) throws SQLException;

	boolean updateStaff(Staff staff) throws SQLException;

}