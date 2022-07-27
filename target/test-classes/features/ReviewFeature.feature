@EndToEnd
Feature: Creating new Account

  Scenario: Creating new account, adding address, Adding phone Number and car to account
    Given url "https://tek-insurance-api.azurewebsites.net/"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def generatedToken = response.token
    And print generatedToken
    
    * def generator = Java.type ('data.generator.DataGenerator')
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def dob = generator.getDateOfBirth()
    And print email
    And print lastName
    And print firstName
    And print dob
    Given path "/api/accounts/add-primary-account"
    When request
    """
    {
  "email": "#(email)",
  "firstName": "#(firstName)",
  "lastName": "#(lastName)",
  "title": "Mr.",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "Software Tester",
  "dateOfBirth": "#(dob)",
  "new": true
}
    """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    * def generatedId = response.id
    And print generatedId
    And print response
    
    * def generator = Java.type ('data.generator.DataGenerator')
    * def buildingNumber = generator.getBuildingNumber()
    * def streetAddress = generator.getStreetAddress()
    * def cityName = generator.cityName()
    * def stateName = generator.getStateName()
    * def postalCode = generator.getPostalCode()
    * def countryCode = generator.getCountryCode()
    And print buildingNumber
    And print cityName
    And print stateName
    And print postalCode
    And print stateName
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId = generatedId
    And request
    """
    {
  "addressType": "Apartment",
  "buildingNumber": "#(buildingNumber)",
  "addressLine1": "#(streetAddress)",
  "city": "#(cityName)",
  "state": "#(stateName)",
  "postalCode": "#(postalCode)",
  "countryCode": "#(countryCode)",
  "current": true
}
    """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
    
    * def generator = Java.type ('data.generator.DataGenerator')
    * def phoneNumber = generator.getPhoneNumber()
    * def phoneExtension = generator.getPhoneExtension()
    And print phoneNumber
    And print phoneExtension
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = generatedId
    And request
    """
    {
  "phoneNumber": "#(phoneNumber)",
  "phoneExtension": "#(phoneExtension)",
  "phoneTime": "Day",
  "phoneType": "Home"
}
    """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
    
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = generatedId
    And request
    """
    {
  "make": "Toyota",
  "model": "Corolla",
  "year": "2021",
  "licensePlate": "abcd 706"
}
    """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
