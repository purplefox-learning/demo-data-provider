package com.ycm.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@RestController
public class CountryController {

	private final CountryDao dao;

	@Autowired
	public CountryController(CountryDao dao) {
		this.dao = dao;
	}

	@GetMapping(value = "/countries", produces = APPLICATION_JSON_VALUE)
	public List<Country> getCountries() throws Exception {
		List<Country> countryList = dao.getAllCountries();
		return countryList;
	}

	@GetMapping(value = "/countries/{countryCode}", produces = APPLICATION_JSON_VALUE)
	public Country getCountryByCode(@PathVariable("countryCode") String countryCode) throws Exception {
		Country country = dao.getCountry(countryCode);
		return country;
	}
}
