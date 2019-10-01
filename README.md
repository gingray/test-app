# README

As scheduled, I'm sending you the recruitment task.

Stack: Ruby on Rails

Time: 24 hours

We'd like to ask you to write a simple application that displays the exchange rates (EUR, USD) in Poland. Use the NBP API (http://api.nbp.pl/).

Please do as much as you can and take as much time as you need within those 24 hours. The elements you won't have the time to complete will be discussed during the next stage of the recruitment.

1. Download and save data from the current day. The script should run automatically once a day (model Day has many Currencies)

2. Create a simple API for the panel that will allow you to browse through the data stored in the database using filters (e.g. From a specific date to a specific date) and return the average price for a specified range

3. Protect API against unauthorized access and excessive traffic

4. If there are no results in the database for a specific day set in the filters, the results should be downloaded in the background from API

5. Write error handling for API queries that return errors (e.g. 93 days back)

6. Create API tests and simple documentation

7. Apply a machine learning mechanism which, on the basis of historical data, will be able to generate values for future dates

8. An additional advantage will be the availability of online applications

Send us your answer as a zip/bitbucket :)

Good luck!

