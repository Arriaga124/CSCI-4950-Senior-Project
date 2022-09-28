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

import net.team6.protectivepaws.dao.CatDao;
import net.team6.protectivepaws.dao.CatDaoImpl;
import net.team6.protectivepaws.model.Cat;

import net.team6.protectivepaws.dao.BirdDao;
import net.team6.protectivepaws.dao.BirdDaoImpl;
import net.team6.protectivepaws.model.Bird;

import net.team6.protectivepaws.dao.HorseDao;
import net.team6.protectivepaws.dao.HorseDaoImpl;
import net.team6.protectivepaws.model.Horse;

import net.team6.protectivepaws.dao.ReptileDao;
import net.team6.protectivepaws.dao.ReptileDaoImpl;
import net.team6.protectivepaws.model.Reptile;

import net.team6.protectivepaws.dao.OtherDao;
import net.team6.protectivepaws.dao.OtherDaoImpl;
import net.team6.protectivepaws.model.Other;


@WebServlet("/")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DogDao dogDAO;
	private CatDao catDAO;
	private BirdDao birdDAO;
	private ReptileDao reptileDAO;
	private HorseDao horseDAO;
	private OtherDao otherDAO;

	public void init() {
		dogDAO = new DogDaoImpl();
		catDAO = new CatDaoImpl();
		birdDAO = new BirdDaoImpl();
		reptileDAO = new ReptileDaoImpl();
		horseDAO = new HorseDaoImpl();
		otherDAO = new OtherDaoImpl();
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
			
			case "/list":
				listAnimals(request, response);
				break;
				
			//Dog//
			
			case "/newDog":
				showNewDogForm(request, response);
				break;
			case "/insertDog":
				insertDog(request, response);
				break;
			case "/deleteDog":
				deleteDog(request, response);
				break;
			case "/editDog":
				showDogEditForm(request, response);
				break;
			case "/updateDog":
				updateDog(request, response);
				break;
				
			//Cat//
				
			case "/newCat":
				showNewCatForm(request, response);
				break;
			case "/insertCat":
				insertCat(request, response);
				break;
			case "/deleteCat":
				deleteCat(request, response);
				break;
			case "/editCat":
				showCatEditForm(request, response);
				break;
			case "/updateCat":
				updateCat(request, response);
				break;
				
			//Bird//
				
			case "/newBird":
				showNewBirdForm(request, response);
				break;
			case "/insertBird":
				insertBird(request, response);
				break;
			case "/deleteBird":
				deleteBird(request, response);
				break;
			case "/editBird":
				showBirdEditForm(request, response);
				break;
			case "/updateBird":
				updateBird(request, response);
				break;
				
			//Reptile//
				
			case "/newReptile":
				showNewReptileForm(request, response);
				break;
			case "/insertReptile":
				insertReptile(request, response);
				break;
			case "/deleteReptile":
				deleteReptile(request, response);
				break;
			case "/editReptile":
				showReptileEditForm(request, response);
				break;
			case "/updateReptile":
				updateReptile(request, response);
				break;
				
			//Horse//
				
			case "/newHorse":
				showNewHorseForm(request, response);
				break;
			case "/insertHorse":
				insertHorse(request, response);
				break;
			case "/deleteHorse":
				deleteHorse(request, response);
				break;
			case "/editHorse":
				showHorseEditForm(request, response);
				break;
			case "/updateHorse":
				updateHorse(request, response);
				break;
				
			//Other//
				
			case "/newOther":
				showNewOtherForm(request, response);
				break;
			case "/insertOther":
				insertOther(request, response);
				break;
			case "/deleteOther":
				deleteOther(request, response);
				break;
			case "/editOther":
				showOtherEditForm(request, response);
				break;
			case "/updateOther":
				updateOther(request, response);
				break;
				
			//Staff//
				
			case "/staff_list":
				listStaff(request, response);
				break;
				
			//Supply//
			
			case "/supply_list":
				listSupplies(request, response);
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

	private void listAnimals(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Dog> listDog = dogDAO.selectAllDogs();
		request.setAttribute("listDog", listDog);
		List<Cat> listCat = catDAO.selectAllCats();
		request.setAttribute("listCat", listCat);
		List<Bird> listBird = birdDAO.selectAllBirds();
		request.setAttribute("listBird", listBird);
		List<Reptile> listReptile = reptileDAO.selectAllReptiles();
		request.setAttribute("listReptile", listReptile);
		List<Horse> listHorse = horseDAO.selectAllHorses();
		request.setAttribute("listHorse", listHorse);
		List<Other> listOther = otherDAO.selectAllOthers();
		request.setAttribute("listOther", listOther);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/animal-list.jsp");
		dispatcher.forward(request, response);
	}
	
	//Dog/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	private void showNewDogForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/dog-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showDogEditForm(HttpServletRequest request, HttpServletResponse response)
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
	
	
	//Cat/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private void showNewCatForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/cat-form.jsp");
		dispatcher.forward(request, response);
	}
	

	private void showCatEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Cat existingCat = catDAO.selectCat(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/cat-form.jsp");
		request.setAttribute("cat", existingCat);
		dispatcher.forward(request, response);

	}

	private void insertCat(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		String name = request.getParameter("name");
		int supplies_needed = Integer.parseInt(request.getParameter("supplies_needed"));
		int care = Integer.parseInt(request.getParameter("care"));
		Cat newCat = new Cat(name, supplies_needed, care);
		catDAO.insertCat(newCat);
		response.sendRedirect("list");
	}

	private void updateCat(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int supplies_needed = Integer.parseInt(request.getParameter("supplies_needed"));
		int care = Integer.parseInt(request.getParameter("care"));
		
		Cat updateCat = new Cat(id, name, supplies_needed, care);
		catDAO.updateCat(updateCat);
		
		response.sendRedirect("list");
	}

	private void deleteCat(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		catDAO.deleteCat(id);
		response.sendRedirect("list");
	}
	
	//Bird/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		private void showNewBirdForm(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			RequestDispatcher dispatcher = request.getRequestDispatcher("animal/bird-form.jsp");
			dispatcher.forward(request, response);
		}
		

		private void showBirdEditForm(HttpServletRequest request, HttpServletResponse response)
				throws SQLException, ServletException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			Bird existingBird = birdDAO.selectBird(id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("animal/bird-form.jsp");
			request.setAttribute("bird", existingBird);
			dispatcher.forward(request, response);

		}

		private void insertBird(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			
			String name = request.getParameter("name");
			int supplies_needed = Integer.parseInt(request.getParameter("supplies_needed"));
			int care = Integer.parseInt(request.getParameter("care"));
			Bird newBird = new Bird(name, supplies_needed, care);
			birdDAO.insertBird(newBird);
			response.sendRedirect("list");
		}

		private void updateBird(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			int supplies_needed = Integer.parseInt(request.getParameter("supplies_needed"));
			int care = Integer.parseInt(request.getParameter("care"));
			
			Bird updateBird = new Bird(id, name, supplies_needed, care);
			birdDAO.updateBird(updateBird);
			
			response.sendRedirect("list");
		}

		private void deleteBird(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			birdDAO.deleteBird(id);
			response.sendRedirect("list");
		}
		
		//Reptile/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		private void showNewReptileForm(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			RequestDispatcher dispatcher = request.getRequestDispatcher("animal/reptile-form.jsp");
			dispatcher.forward(request, response);
		}
		

		private void showReptileEditForm(HttpServletRequest request, HttpServletResponse response)
				throws SQLException, ServletException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			Reptile existingReptile = reptileDAO.selectReptile(id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("animal/reptile-form.jsp");
			request.setAttribute("reptile", existingReptile);
			dispatcher.forward(request, response);

		}

		private void insertReptile(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			
			String name = request.getParameter("name");
			int supplies_needed = Integer.parseInt(request.getParameter("supplies_needed"));
			int care = Integer.parseInt(request.getParameter("care"));
			Reptile newReptile = new Reptile(name, supplies_needed, care);
			reptileDAO.insertReptile(newReptile);
			response.sendRedirect("list");
		}

		private void updateReptile(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			int supplies_needed = Integer.parseInt(request.getParameter("supplies_needed"));
			int care = Integer.parseInt(request.getParameter("care"));
			
			Reptile updateReptile = new Reptile(id, name, supplies_needed, care);
			reptileDAO.updateReptile(updateReptile);
			
			response.sendRedirect("list");
		}

		private void deleteReptile(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			reptileDAO.deleteReptile(id);
			response.sendRedirect("list");
		}
		
		//Horse/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		private void showNewHorseForm(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			RequestDispatcher dispatcher = request.getRequestDispatcher("animal/horse-form.jsp");
			dispatcher.forward(request, response);
		}
		

		private void showHorseEditForm(HttpServletRequest request, HttpServletResponse response)
				throws SQLException, ServletException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			Horse existingHorse = horseDAO.selectHorse(id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("animal/horse-form.jsp");
			request.setAttribute("horse", existingHorse);
			dispatcher.forward(request, response);

		}

		private void insertHorse(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			
			String name = request.getParameter("name");
			int supplies_needed = Integer.parseInt(request.getParameter("supplies_needed"));
			int care = Integer.parseInt(request.getParameter("care"));
			Horse newHorse = new Horse(name, supplies_needed, care);
			horseDAO.insertHorse(newHorse);
			response.sendRedirect("list");
		}

		private void updateHorse(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			int supplies_needed = Integer.parseInt(request.getParameter("supplies_needed"));
			int care = Integer.parseInt(request.getParameter("care"));
			
			Horse updateHorse = new Horse(id, name, supplies_needed, care);
			horseDAO.updateHorse(updateHorse);
			
			response.sendRedirect("list");
		}

		private void deleteHorse(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			horseDAO.deleteHorse(id);
			response.sendRedirect("list");
		}
		
		//Other/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		private void showNewOtherForm(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			RequestDispatcher dispatcher = request.getRequestDispatcher("animal/other-form.jsp");
			dispatcher.forward(request, response);
		}
		

		private void showOtherEditForm(HttpServletRequest request, HttpServletResponse response)
				throws SQLException, ServletException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			Other existingOther = otherDAO.selectOther(id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("animal/other-form.jsp");
			request.setAttribute("other", existingOther);
			dispatcher.forward(request, response);

		}

		private void insertOther(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			
			String name = request.getParameter("name");
			int supplies_needed = Integer.parseInt(request.getParameter("supplies_needed"));
			int care = Integer.parseInt(request.getParameter("care"));
			Other newOther = new Other(name, supplies_needed, care);
			otherDAO.insertOther(newOther);
			response.sendRedirect("list");
		}

		private void updateOther(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			int supplies_needed = Integer.parseInt(request.getParameter("supplies_needed"));
			int care = Integer.parseInt(request.getParameter("care"));
			
			Other updateOther = new Other(id, name, supplies_needed, care);
			otherDAO.updateOther(updateOther);
			
			response.sendRedirect("list");
		}

		private void deleteOther(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			otherDAO.deleteOther(id);
			response.sendRedirect("list");
		}
	//Staff/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	private void listStaff(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		//List<Staff> listStaff = staffDAO.selectAllStaff();
		//request.setAttribute("listStaff", listStaff);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/staff-list.jsp");
		dispatcher.forward(request, response);
	}
	//Supply/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	private void listSupplies(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		//List<Staff> listStaff = staffDAO.selectAllStaff();
		//request.setAttribute("listStaff", listStaff);
		RequestDispatcher dispatcher = request.getRequestDispatcher("animal/supply-list.jsp");
		dispatcher.forward(request, response);
	}
	
}
