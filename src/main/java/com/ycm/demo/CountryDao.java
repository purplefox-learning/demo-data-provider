package com.ycm.demo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class CountryDao {

	private static final String getAllCountriesSql = "select distinct code, description from country order by code desc";
	private static final String getCountryByCodeSql = "select distinct code, description from country where code=? order by code";

	private final JdbcTemplate jdbcTemplate;

	@Autowired
	public CountryDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Country> getAllCountries() throws Exception {
		log.info("[Provider] CoutryDao is about to getAllCountries()...");
		List<Country> countryList = jdbcTemplate.query(getAllCountriesSql, new CountryRowMapper());
		return countryList;
	}

	public Country getCountry(String countryCode) throws Exception {
		log.info("[Provider] CoutryDao is about to getCountry()...");
		Country country = jdbcTemplate.queryForObject(getCountryByCodeSql, new CountryRowMapper(), countryCode);
		return country;
	}

	private static final class CountryRowMapper implements RowMapper<Country> {
		@Override
		public Country mapRow(ResultSet results, int arg1) throws SQLException {
			Country cty = new Country(results.getString("code"), results.getString("description"));
			return cty;
		}
	}
}
