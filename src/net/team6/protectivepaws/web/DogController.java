package net.team6.protectivepaws.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.team6.protectivepaws.dao.DogDao;
import net.team6.protectivepaws.dao.DogDaoImpl;
import net.team6.protectivepaws.model.Dog;



@WebServlet("/")
public class DogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DogDao dogDAO;

	public void init() {
		dogDAO = new DogDaoImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertDog(request, response);
				break;
			case "/delete":
				deleteDog(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateDog(request, response);
				break;
			case "/list":
				listDog(request, response);
				break;
			default:
				RequestDispatcher dispatcher = request.getRequestDispatcher("login/login.jsp");
				dispatcher.forward(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listDog(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Dog> listDog = dogDAO.selectAllDogs();
		request.setAttribute("listDog", listDog);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/animal-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/dog-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Dog existingDog = dogDAO.selectDog(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/dog-form.jsp");
		request.setAttribute("dog", existingDog);
		dispatcher.forward(request, response);

	}

	private void insertDog(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		String name = request.getParameter("name");
		int supplies_needed = Integer.parseInt(request.getParameter("supplies_needed"));
		int care = Integer.parseInt(request.getParameter("care"));
		

		
		
		Dog newDog = new Dog(name, supplies_needed, care);
		dogDAO.insertDog(newDog);
		response.sendRedirect("list");
	}

	private void updateDog(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int supplies_needed = Integer.parseInt(request.getParameter("supplies_needed"));
		int care = Integer.parseInt(request.getParameter("care"));
		
		Dog updateDog = new Dog(id, name, supplies_needed, care);
		dogDAO.updateDog(updateDog);
		
		response.sendRedirect("list");
	}

	private void deleteDog(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		dogDAO.deleteDog(id);
		response.sendRedirect("list");
	}
}
