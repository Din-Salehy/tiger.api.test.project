package data.generator;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.javafaker.Faker;

public class DataGenerator {
	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName() + faker.name().lastName() + "@gmail.com";
	}
	
	public static String getFirstName() {
		Faker faker = new Faker();
		return faker.name().firstName();
		
	}
	
	public static String getLastName() {
		Faker faker = new Faker();
		return faker.name().lastName();
	}

	public static String getPhoneNumber() {
		Faker faker = new Faker();
		return faker.phoneNumber().cellPhone();	
	}
	
	public static String getPhoneExtension() {
		Faker faker = new Faker();
		return faker.phoneNumber().extension();
	}
	
	public static String getDateOfBirth() {
		Faker faker = new Faker();
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		return format.format(date);
	}

	public static String getCountryCode() {
		Faker faker = new Faker();
		return faker.address().countryCode();
	}
	
	public static String getPostalCode() {
		Faker faker = new Faker();
		return faker.address().zipCode();
		
	}
	public static String getStateName() {
		Faker faker = new Faker();
		return faker.address().state();
	}

	public static String getStreetAddress() {
		Faker faker = new Faker();
		return faker.address().streetAddress();
	}

	public static String getBuildingNumber() {
		Faker faker = new Faker();
		return faker.address().buildingNumber();
	}
	public static String cityName() {
		Faker faker = new Faker();
		return faker.address().cityName();
	}
	public static String getFullAddress() {
		Faker faker = new Faker();
		return faker.address().fullAddress();
	}
}
