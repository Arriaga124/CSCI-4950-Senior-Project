package net.team6.protectivepaws.web;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.team6.protectivepaws.dao.AnimalDao;
import net.team6.protectivepaws.dao.AnimalDaoImpl;
import net.team6.protectivepaws.model.Animal;

import net.team6.protectivepaws.dao.StaffDao;
import net.team6.protectivepaws.dao.StaffDaoImpl;
import net.team6.protectivepaws.model.Staff;

import net.team6.protectivepaws.dao.SupplyDao;
import net.team6.protectivepaws.dao.SupplyDaoImpl;
import net.team6.protectivepaws.model.Supply;

import net.team6.protectivepaws.dao.TaskDao;
import net.team6.protectivepaws.dao.TaskDaoImpl;
import net.team6.protectivepaws.model.Task;

import net.team6.protectivepaws.dao.UserDao;
import net.team6.protectivepaws.model.User;


@WebServlet("/")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AnimalDao animalDAO;
	private StaffDao staffDAO;
	private SupplyDao supplyDAO;
	private TaskDao taskDAO;
	private UserDao userDAO;


	public void init() {
		animalDAO = new AnimalDaoImpl();
		staffDAO = new StaffDaoImpl();
		supplyDAO = new SupplyDaoImpl();
		taskDAO = new TaskDaoImpl();
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
			//All//
			
			case "/home":
				showHome(request, response);
				break;
			case "/list":
				listAnimals(request, response);
				break;
				
			case "/check":
				doCheck(request, response);
				break;
				
			case "/valid":
				showValid(request, response);
				break;
				
			case "/notvalid":
				showInvalid(request, response);
				break;
				
			//Task//
				
			case "/insertTask":
				insertTask(request, response);
				break;
			case "/deleteTask":
				deleteTask(request, response);
				break;
		
			//Animal//
			
			case "/newAnimal":
				showNewAnimalForm(request, response);
				break;
			case "/insertAnimal":
				insertAnimal(request, response);
				break;
			case "/deleteAnimal":
				deleteAnimal(request, response);
				break;
			case "/editAnimal":
				showAnimalEditForm(request, response);
				break;
			case "/updateAnimal":
				updateAnimal(request, response);
				break;
							
			//Staff//
				
			case "/staff-list":
				listStaff(request, response);
				break;
			case "/newStaff":
				showNewStaffForm(request, response);
				break;
			case "/insertStaff":
				insertStaff(request, response);
				break;
			case "/deleteStaff":
				deleteStaff(request, response);
				break;
			case "/editStaff":
				showStaffEditForm(request, response);
				break;
			case "/updateStaff":
				updateStaff(request, response);
				break;
				
			//Supply//
			
			case "/supply-list":
				listSupplies(request, response);
				break;
			case "/newSupply":
				showNewSupplyForm(request, response);
				break;
			case "/insertSupply":
				insertSupply(request, response);
				break;
			case "/deleteSupply":
				deleteSupply(request, response);
				break;
			case "/editSupply":
				showSupplyEditForm(request, response);
				break;
			case "/updateSupply":
				updateSupply(request, response);
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
	
/////////Home & Task///////////////////////////////////////////////////////////////////////////////////
	private void deleteTask(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		taskDAO.deleteTask(id);
		response.sendRedirect("home");	
	}

	private void insertTask(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String task = request.getParameter("task");
		String priority = request.getParameter("priority");
		Task newTask = new Task(task, priority);
		taskDAO.insertTask(newTask);
		response.sendRedirect("home");	
	}

	private void showHome(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException{	
		String[] species = {"Dog", "Cat", "Bird", "Reptile", "Horse", "Other"};
		Map<String, Integer> speciesCount = new HashMap<String, Integer>();
		
		for (String str : species) 
		{ speciesCount.put(str, animalDAO.countAnimals(str)); }			
		System.out.println(speciesCount);
		request.setAttribute("speciesCount",speciesCount);
		listTasks(request,response);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/home.jsp");
		dispatcher.forward(request,response);	
	}
	
	private void listTasks(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException{		
		List<Task> listTasks = taskDAO.selectAllTasks();
		request.setAttribute("listTasks", listTasks);
	}
////////////////////////////////////////////////////////////////////////////////////////////////////
	private void listAnimals(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Animal> listDog = animalDAO.selectAllBySpecies("Dog");
		request.setAttribute("listDog", listDog);
		List<Animal> listCat = animalDAO.selectAllBySpecies("Cat");
		request.setAttribute("listCat", listCat);
		List<Animal> listBird = animalDAO.selectAllBySpecies("Bird");
		request.setAttribute("listBird", listBird);
		List<Animal> listReptile = animalDAO.selectAllBySpecies("Reptile");
		request.setAttribute("listReptile", listReptile);
		List<Animal> listHorse = animalDAO.selectAllBySpecies("Horse");
		request.setAttribute("listHorse", listHorse);
		List<Animal> listOther = animalDAO.selectAllBySpecies("Other");
		request.setAttribute("listOther", listOther);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/animal-list.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showValid(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/valid.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showInvalid(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/animal-list.jsp");
		dispatcher.forward(request, response);
	}
	
	
	private void doCheck(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		int dogSupplyNeedTotal = animalDAO.selectAllSupplyBySpecies("Dog");
		request.setAttribute("dogSupplyNeedTotal", dogSupplyNeedTotal);
		int dogSupplyTotal = supplyDAO.selectAllSuppliesBySpecies("Dog");
		request.setAttribute("dogSupplyTotal", dogSupplyTotal);
		int dogCareNeedTotal = animalDAO.selectAllCareBySpecies("Dog");
		//request.setAttribute("dogCareNeedTotal", dogCareNeedTotal);
		
		int catSupplyNeedTotal = animalDAO.selectAllSupplyBySpecies("Cat");
		request.setAttribute("catSupplyNeedTotal", catSupplyNeedTotal);
		int catSupplyTotal = supplyDAO.selectAllSuppliesBySpecies("Cat");
		request.setAttribute("catSupplyTotal", catSupplyTotal);
		int catCareNeedTotal = animalDAO.selectAllCareBySpecies("Cat");
		//request.setAttribute("catCareNeedTotal", catCareNeedTotal);
		
		int birdSupplyNeedTotal = animalDAO.selectAllSupplyBySpecies("Bird");
		request.setAttribute("birdSupplyNeedTotal", birdSupplyNeedTotal);
		int birdSupplyTotal = supplyDAO.selectAllSuppliesBySpecies("Bird");
		request.setAttribute("birdSupplyTotal", birdSupplyTotal);
		int birdCareNeedTotal = animalDAO.selectAllCareBySpecies("Bird");
		//request.setAttribute("birdCareNeedTotal", birdCareNeedTotal);
		
		int horseSupplyNeedTotal = animalDAO.selectAllSupplyBySpecies("Horse");
		request.setAttribute("horseSupplyNeedTotal", horseSupplyNeedTotal);
		int horseSupplyTotal = supplyDAO.selectAllSuppliesBySpecies("Horse");
		request.setAttribute("horseSupplyTotal", horseSupplyTotal);
		int horseCareNeedTotal = animalDAO.selectAllCareBySpecies("Horse");
		//request.setAttribute("dogCareNeedTotal", dogCareNeedTotal);
		
		int reptileSupplyNeedTotal = animalDAO.selectAllSupplyBySpecies("Reptile");
		request.setAttribute("reptileSupplyNeedTotal", reptileSupplyNeedTotal);
		int reptileSupplyTotal = supplyDAO.selectAllSuppliesBySpecies("Horse");
		request.setAttribute("reptileSupplyTotal", reptileSupplyTotal);
		int reptileCareNeedTotal = animalDAO.selectAllCareBySpecies("Horse");
		//request.setAttribute("dogCareNeedTotal", dogCareNeedTotal);
		
		int otherSupplyNeedTotal = animalDAO.selectAllSupplyBySpecies("Other");
		request.setAttribute("otherSupplyNeedTotal", otherSupplyNeedTotal);
		int otherSupplyTotal = supplyDAO.selectAllSuppliesBySpecies("Other");
		request.setAttribute("otherSupplyTotal", otherSupplyTotal);
		int otherCareNeedTotal = animalDAO.selectAllCareBySpecies("Other");
		//request.setAttribute("dogCareNeedTotal", dogCareNeedTotal);
		
		int careTotal = staffDAO.selectAllCare();
		request.setAttribute("careTotal", careTotal);
		
		int careNeedTotal = otherCareNeedTotal + reptileCareNeedTotal + horseCareNeedTotal + birdCareNeedTotal + catCareNeedTotal + dogCareNeedTotal;
		request.setAttribute("careNeedTotal", careNeedTotal);
		
		Boolean dogValidity;
		Boolean catValidity;
		Boolean birdValidity;
		Boolean reptileValidity;
		Boolean horseValidity;
		Boolean otherValidity;
		
		if (dogSupplyTotal >= dogSupplyNeedTotal) {
			dogValidity= true;
			request.setAttribute("dogValidity", dogValidity);
		}
		if (dogSupplyTotal < dogSupplyNeedTotal) {
			dogValidity= false;
			request.setAttribute("dogValidity", dogValidity);
		}
		
		if (catSupplyTotal >= catSupplyNeedTotal) {
			catValidity= true;
			request.setAttribute("catValidity", catValidity);
			
		}
		if (catSupplyTotal < catSupplyNeedTotal) {
			catValidity= false;
			request.setAttribute("catValidity", catValidity);
		}
		
		if (birdSupplyTotal >= birdSupplyNeedTotal) {
			birdValidity= true;
			request.setAttribute("birdValidity", birdValidity);
		}
		if (birdSupplyTotal < birdSupplyNeedTotal) {
			birdValidity= false;
			request.setAttribute("birdValidity", birdValidity);
		}
		
		if (reptileSupplyTotal >= reptileSupplyNeedTotal) {
			reptileValidity= true;
			request.setAttribute("reptileValidity", reptileValidity);
		}
		if (reptileSupplyTotal < reptileSupplyNeedTotal) {
			reptileValidity= false;
			request.setAttribute("reptileValidity", reptileValidity);
		}
		
		if (horseSupplyTotal >= horseSupplyNeedTotal) {
			horseValidity= true;
			request.setAttribute("horseValidity", horseValidity);
		}
		if (horseSupplyTotal < horseSupplyNeedTotal) {
			horseValidity= false;
			request.setAttribute("horseValidity", horseValidity);
		}
		
		if (otherSupplyTotal >= otherSupplyNeedTotal) {
			otherValidity= true;
			request.setAttribute("otherValidity", otherValidity);
		}
		if (otherSupplyTotal < otherSupplyNeedTotal) {
			otherValidity= false;
			request.setAttribute("otherValidity", otherValidity);
		}
		
		Boolean careValidity;
		
		if (careTotal >= careNeedTotal) {
			careValidity= true;
			request.setAttribute("careValidity", careValidity);
		}
		if (careTotal < careNeedTotal) {
			careValidity= false;
			request.setAttribute("careValidity", careValidity);
		}
		HttpSession session = request.getSession();
		String temp = ""+java.time.LocalDate.now();
		session.setAttribute("checkedDate", temp);
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/valid.jsp");
		dispatcher.forward(request, response);
		
	}
	
	//Animal/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	private void showNewAnimalForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/animal-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showAnimalEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Animal existingAnimal = animalDAO.selectAnimal(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/animal-form.jsp");
		request.setAttribute("animal", existingAnimal);
		dispatcher.forward(request, response);

	}

	private void insertAnimal(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		String name = request.getParameter("name");
		long supplies_needed = Long.parseLong(request.getParameter("supplies_needed"));
		long care = Long.parseLong(request.getParameter("care"));
		String species = request.getParameter("species");
		String breed = request.getParameter("breed");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String color = request.getParameter("color");
		String declawed = request.getParameter("declawed");
		String location = request.getParameter("location");
		LocalDate intake_date = LocalDate.parse(request.getParameter("intake_date"));
		boolean available = Boolean.valueOf(request.getParameter("available"));
		String notes = request.getParameter("notes");
		
		Animal newDog = new Animal(name, supplies_needed, care, species, breed, age, gender, color, declawed, location, intake_date, available, notes);
		animalDAO.insertAnimal(newDog);
		response.sendRedirect("list");
	}

	private void updateAnimal(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		Long id = Long.parseLong(request.getParameter("id"));
		String name = request.getParameter("name");
		long supplies_needed = Long.parseLong(request.getParameter("supplies_needed"));
		long care = Long.parseLong(request.getParameter("care"));
		String species = request.getParameter("species");
		String breed = request.getParameter("breed");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String color = request.getParameter("color");
		String declawed = request.getParameter("declawed");
		String location = request.getParameter("location");
		LocalDate intake_date = LocalDate.parse(request.getParameter("intake_date"));
		boolean available = Boolean.valueOf(request.getParameter("available"));
		String notes = request.getParameter("notes");
		
		Animal updateAnimal = new Animal(id, name, supplies_needed, care, species, breed, age, gender, color, declawed, location, intake_date, available, notes);
		animalDAO.updateAnimal(updateAnimal);
		
		response.sendRedirect("list");
	}

	private void deleteAnimal(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		animalDAO.deleteAnimal(id);
		response.sendRedirect("list");
	}
	
	
	//Staff/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
	private void listStaff(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Staff> listStaff = staffDAO.selectAllStaffs();
		request.setAttribute("listStaff", listStaff);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/staff-list.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showNewStaffForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/staff-form.jsp");
		dispatcher.forward(request, response);
	}
	

	private void showStaffEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Staff existingStaff = staffDAO.selectStaff(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/staff-form.jsp");
		request.setAttribute("staff", existingStaff);
		dispatcher.forward(request, response);

	}

	private void insertStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		String name = request.getParameter("name");
		String position = request.getParameter("position");
		int time = Integer.parseInt(request.getParameter("time"));
		String phone = request.getParameter("phone");
		Staff newStaff = new Staff(name, position, time, phone);
		staffDAO.insertStaff(newStaff);
		response.sendRedirect("staff-list");
	}

	private void updateStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String position = request.getParameter("position");
		int time = Integer.parseInt(request.getParameter("time"));
		String phone = request.getParameter("phone");
		
		Staff updateStaff = new Staff(id, name, position, time, phone);
		staffDAO.updateStaff(updateStaff);
		
		response.sendRedirect("staff-list");
	}

	private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		staffDAO.deleteStaff(id);
		response.sendRedirect("staff-list");
	}
	//Supply/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private void listSupplies(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Supply> listSupply = supplyDAO.selectAllSupplys();
		request.setAttribute("listSupply", listSupply);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/supply-list.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showNewSupplyForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/supply-form.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showSupplyEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Supply existingSupply = supplyDAO.selectSupply(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/supply-form.jsp");
		request.setAttribute("supply", existingSupply);
		dispatcher.forward(request, response);
	}

	private void insertSupply(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		String supply_name = request.getParameter("supply_name");
		String type = request.getParameter("type");
		String animal = request.getParameter("animal");
		int amount = Integer.parseInt(request.getParameter("amount"));
		Supply newSupply = new Supply(supply_name, type, animal, amount);
		supplyDAO.insertSupply(newSupply);
		response.sendRedirect("supply-list");
	}

	private void updateSupply(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String supply_name = request.getParameter("supply_name");
		String type = request.getParameter("type");
		String animal = request.getParameter("animal");
		int amount = Integer.parseInt(request.getParameter("amount"));
		Supply updateSupply = new Supply(id, supply_name, type, animal, amount);
		supplyDAO.updateSupply(updateSupply);
		response.sendRedirect("supply-list");
		
		
	}

	private void deleteSupply(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		supplyDAO.deleteSupply(id);
		response.sendRedirect("supply-list");
	}
}
