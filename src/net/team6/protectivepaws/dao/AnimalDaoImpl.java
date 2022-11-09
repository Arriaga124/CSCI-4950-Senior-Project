package net.team6.protectivepaws.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


import net.team6.protectivepaws.model.Animal;
import net.team6.protectivepaws.utils.JDBCUtils;


public class AnimalDaoImpl implements AnimalDao {

	private static final String INSERT_ANIMAL_SQL = "INSERT INTO animals"
			+ "  (name, supplies_needed, care, species, breed, age, gender, color, declawed, location, intake_date, available, notes ) VALUES " + " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

	private static final String SELECT_ANIMAL_BY_ID = "select id,name,supplies_needed,care, species, breed, age, gender, color, declawed, location, intake_date, available, notes from animals where id =?";
	private static final String SELECT_ANIMAL_SUPPLY_BY_SPECIES = "select supplies_needed from animals where species = ?";
	private static final String SELECT_ALL_CARE_BY_SPECIES = "select care from animals where species = ?";
	private static final String SELECT_ALL_ANIMALS_BY_TYPE = "select * from animals where species = ?";
	private static final String DELETE_ANIMAL_BY_ID = "delete from animals where id = ?;";
	private static final String UPDATE_ANIMAL = "update animals set name = ?, supplies_needed = ?, care = ?, species = ?, breed = ?, age = ?, gender = ?, color = ?, declawed = ?, location = ?, intake_date = ?, available = ?, notes = ? where id = ?";

	public AnimalDaoImpl() {
	}

	@Override
	public void insertAnimal(Animal animal) throws SQLException {
		System.out.println(INSERT_ANIMAL_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ANIMAL_SQL)) {
			preparedStatement.setString(1, animal.getName());
			preparedStatement.setLong(2, animal.getSupplies_needed());
			preparedStatement.setLong(3, animal.getCare());
			preparedStatement.setString(4, animal.getSpecies());
			preparedStatement.setString(5, animal.getBreed());
			preparedStatement.setString(6, animal.getAge());
			preparedStatement.setString(7, animal.getGender());
			preparedStatement.setString(8, animal.getColor());
			preparedStatement.setString(9, animal.getDeclawed());
			preparedStatement.setString(10, animal.getLocation());
			preparedStatement.setDate(11, JDBCUtils.getSQLDate(animal.getIntake_date()));
			preparedStatement.setBoolean(12, animal.getAvailable());
			preparedStatement.setString(13, animal.getNotes());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
	}

	@Override
	public Animal selectAnimal(long animalId) {
		
		Animal animal = null;
		// attempts to establish a connection
		try (Connection connection = JDBCUtils.getConnection();
				// creates a new statement using the connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ANIMAL_BY_ID);) {
			preparedStatement.setLong(1, animalId);
			System.out.println(preparedStatement);
			// execute the query or update the query
			ResultSet rs = preparedStatement.executeQuery();

			// process the rs object
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				String species = rs.getString("species");
				String breed = rs.getString("breed");
				String age = rs.getString("age");
				String gender = rs.getString("gender");
				String color = rs.getString("color");
				String declawed = rs.getString("declawed");
				String location = rs.getString("location");
				LocalDate intake_date = rs.getDate("intake_date").toLocalDate();
				boolean available = rs.getBoolean("available");
				String notes = rs.getString("notes");
				animal = new Animal(id, name, supplies_needed, care, species, breed, age, gender, color, declawed, location, intake_date, available, notes);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return animal;
	}

	@Override
	public List<Animal> selectAllBySpecies(String type) {

		
		List<Animal> animals = new ArrayList<>();

		
		try (Connection connection = JDBCUtils.getConnection();

				
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ANIMALS_BY_TYPE);) {
			System.out.println(preparedStatement);
			preparedStatement.setString(1, type);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				Long supplies_needed = rs.getLong("supplies_needed");
				Long care = rs.getLong("care");
				String species = rs.getString("species");
				String breed = rs.getString("breed");
				String age = rs.getString("age");
				String gender = rs.getString("gender");
				String color = rs.getString("color");
				String declawed = rs.getString("declawed");
				String location = rs.getString("location");
				LocalDate intake_date = rs.getDate("intake_date").toLocalDate();
				boolean available = rs.getBoolean("available");
				String notes = rs.getString("notes");
				animals.add(new Animal(id, name, supplies_needed, care, species, breed, age, gender, color, declawed, location, intake_date, available, notes));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return animals;
	}
	
	
	public int selectAllSupplyBySpecies(String type) {

		int supplyNeedTotal = 0;
		try (Connection connection = JDBCUtils.getConnection();	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ANIMAL_SUPPLY_BY_SPECIES);) {
			preparedStatement.setString(1, type);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				supplyNeedTotal = (int)(rs.getLong("supplies_needed")+ supplyNeedTotal);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return supplyNeedTotal;
	}
	
	public int selectAllCareBySpecies(String type) {

		int animalCareNeedTotal = 0;
		try (Connection connection = JDBCUtils.getConnection();	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CARE_BY_SPECIES);) {
			preparedStatement.setString(1, type);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				animalCareNeedTotal = (int)(rs.getLong("care")+ animalCareNeedTotal);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return animalCareNeedTotal;
	}

	@Override
	public boolean deleteAnimal(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_ANIMAL_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateAnimal(Animal animal) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_ANIMAL);) {
			statement.setString(1, animal.getName());
			statement.setLong(2, animal.getSupplies_needed());
			statement.setLong(3, animal.getCare());
			statement.setString(4, animal.getSpecies());
			statement.setString(5, animal.getBreed());
			statement.setString(6, animal.getAge());
			statement.setString(7, animal.getGender());
			statement.setString(8, animal.getColor());
			statement.setString(9, animal.getDeclawed());
			statement.setString(10, animal.getLocation());
			statement.setDate(11, JDBCUtils.getSQLDate(animal.getIntake_date()));
			statement.setBoolean(12, animal.getAvailable());
			statement.setString(13, animal.getNotes());
			statement.setLong(14, animal.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	
	@Override
	public int countAnimals(String type){
		int count = 0;
		List<Animal> list = selectAllBySpecies(type);
		
		for (int i = 0; i < list.size(); i++) 
		{
		  count++;
		}

		return count;
		 
	}
}


