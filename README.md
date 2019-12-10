# README

1. Dependencies

	* should have postgresql as database
	* Rails 5.2.4
	* ruby 2.4

2. setup

	* rails db:setup
	* EDITOR=vim rails credentials:edit
	* add below line and save
	  host: 'localhost:3000'
	* to start rails server
	  rails s

3. data dependencies

	* visit - http://localhost:3000
	* give input as
		https://stackoverflow.com/questions/1826727/how-do-i-parse-json-with-ruby-on-rails
	* then click on SHORTEN button
	* copy and paste the shorten url in browser
	* By defult url will expire in 30 days, if you want to change then 
	* rails c
	* Url.last.update(expiry_date:  Date.today-1)
	* now if you go to the shorten url that will give you 404
	* http://localhost:3000/stats - will give you brief about url

