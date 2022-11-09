package net.team6.protectivepaws.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import net.team6.protectivepaws.model.LoginBean;
import net.team6.protectivepaws.utils.JDBCUtils;

public class LoginDao {

	public boolean validate(LoginBean loginBean, HttpSession session) throws ClassNotFoundException {
		boolean status = false;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from users where username = ? and password = ? ")) {
			preparedStatement.setString(1, loginBean.getUsername());
			preparedStatement.setString(2, loginBean.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
			
			if(status)
				session.setAttribute("name", rs.getString("first_name"));

		} catch (SQLException e) {
			JDBCUtils.printSQLException(e);
		}
		return status;
	}
}
