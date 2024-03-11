# README

This project follows the instructions for The Odin Project's Flight booker assignment, at https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker 

------------------ 

**Project Instructions:**

------------------  

We’ll be creating a one-way flight booker. You’ll get lots of practice populating and building dropdown menus, radio buttons, and nested submissions. Let the fun begin!

This project will require you to seed your database, so use your db/seeds.rb file to write the code necessary to populate Airports and Flights. One trick for toy apps like this (don’t do it for production!) is to make your seeds file ::delete_all items from each table in your database and then completely repopulate them. That way, when you create a new model or change how you want your sample data set up, you can just update the seeds.rb file and rerun $ rake db:seed.

**Setup**
1) Think through the data architecture required to bring this to life.  
2) Create a new Rails app, e.g. odin-flight-booker, and a new Git repo  
3) Modify the README to explain what you’re doing and link back to the project here.  


**Screen 1: search**  

For the first screen, you will be creating 4 dropdown menus that will allow users to search for available flights - departure airport, arrival airport, date, and number of passengers. This requires relatively vanilla forms that happen to be prepopulated with collections of data. Working with dates will cover a bit of new ground for you.

1) Create an Airport model (which basically just needs an airport code like “SFO” or “NYC”) and use the db/seeds.rb file to create several airports.
2) Create a Flight model (with the departure and arrival airport ids, start datetime and flight duration).
3) Set up associations so you can ask Flight.first.departure_airport, Flight.first.arrival_airport and get back Airport objects. Same for Airport.first.departing_flights and Airport.first.arriving_flights, which should return a list of Flight objects.
4) Seed your database with flights.
5) You will search and view results in the same page. Set up your FlightsController and routes to make the Index page (/flights) the root route.
6) Create your search form on the /flights index page to submit using a GET (not POST) request back to the same URL.
7) Add the four dropdown menus – a list of departure airports, arrival airports, number of passengers (1-4), and a date dropdown for the flight date. The date dropdown should only include dates that have existing flights. Don’t worry about restricting the contents of the airport dropdowns – you’d normally use JavaScript – so just allow the user to select any airport. 

**Screen 2: pick a flight**  

Once search results are returned, the user just needs to choose from among the available flights.

1) Once the user has submitted the form, your controller should detect the additional query parameters (e.g. from /flights?departure_code=SFO&arrival_code=NYC&date=20131215&num_tickets=2) and should pull the flights which match that criteria from your database through smart querying model methods.
2) Send those flights back to your app/views/flights/index.html.erb view. Make it so that the view will display the results below (if present).
3) Don’t get rid of the search dropdowns – keep the search form active at the top so the user can try running a new search.
4) The search results will need to be in their own form – this time for selecting which of the flights the user would like to choose. Each returned flight should render with a radio button next to it. The user will select which flight to submit and move onto the next step. The form should submit to the #new action of the BookingsController you’re about to create using another GET method. You’ll need to include a hidden field that contains the number of passengers.

**Screen 3: passenger information**  

Once the user has submitted their chosen flight, it’s time to take their booking information. You’ll need a form to submit the Booking and also create a Passenger object for each passenger who needs a ticket. Don’t worry about creating a separate “Ticket” object, we’ll assume the airline will issue those once the booking is verified.

1) Create and migrate the Booking model.
2) Create and migrate the Passenger model (just keep the information simple – name and email only).
3) Set up associations between Bookings, Passengers, and Flights.
4) Create a BookingsController and appropriate routes.
5) Set up your #new action, which should have received the flight ID and passenger number parameters, and use it to help render a form for a new booking which displays the currently chosen date, airports, flight ID and a set of fields to enter personal information for each passenger. You’ll want to create a new blank Passenger object in your controller for each passenger, and then use #fields_for in the view to set up the sub-forms.
6) Try submitting the form and check out the parameters in your server.
7) You’ll need your #create action to create a new Booking (linking it to the appropriate Flight) but it will also need to accept the nested attributes for each of the Passenger objects and create a new Passenger from them. Be mindful of allowing the nested parameters as well.
8) Go to the Booking model and implement the #accepts_nested_attributes_for method. See the Rails API for examples and this SO post for another.
9) Once your form is successfully submitted, render the booking’s #show page which displays the booking information (flight and passenger information).
10) Make sure your ticketing flow is working properly. Good work!

-------------------------  

This project uses Ruby version 3.1.2p20 
To set up the database it is necessary to use 'rails db:seed' so that there are flights and airports to choose from.

--------------------------

**Author notes by Peter Hawes:**  

Setting up associations went more smoothly than in my previous Rails projects. However, the need to specify foreign key: 'flight_id' in the Bookings model caught me out, causing a nasty bug for a while insofar as the #create method in the Bookings controller was failing to make the Booking. Just as I was about to ask for help on the Odin Discord, I had the inspiration to change 'create' to the bang method 'create!' so that an error message was forced. This revealed that the flight_id was not recognised, and it still wasn't easy to find the problem. Debugging in Rails is still tricky, but I am getting better at knowing where to look in the many files.

--------------------------

**Update: Adding Stimulus for Booking form:**

In early March 2024 I followed the instructions at https://www.theodinproject.com/lessons/ruby-on-rails-stimulus:

Project: Go back to your Flight Booker project and improve it:  

1)  Add a controller that allows the user to add another passenger by clicking on an “Add passenger” button, which adds another set of fields to enter the passenger details (hint: have a look at the template HTML tag)  

2)  Allow to remove existing passengers by clicking a “Remove” button, which removes the one set of passenger fields (make sure submissions to the server still works as expected)  

3)  Prevent removing the last set of passenger details.

-----------------------------

I found myself a bit rusty with Javascript but enjoyed this challenge. One subtlety that troubled me was that each Remove button for an individual set of passenger forms has its own controller, each with their own controller variables, but there is only ONE Add passenger button, so its controller variables will remain consistent. What surprised me is that if the attributes for name and email fields become non-sequential because a form field is removed in between (e.g. we remove passenger 2 of 3), the form still happily submits and the Booking object is created without a problem.

-----------------------------

**Update: Adding the PassengerMailer and letter_opener:**

Later in March 2024 I followed the instructions at https://www.theodinproject.com/lessons/ruby-on-rails-sending-confirmation-emails:

Assignment:  

You’ll be dusting off your Flight Booker project and having it send out a “You have booked your ticket” confirmation email to all Passengers when they are created as part of the booking process. Make sure to send out one email to each Passenger in the Booking, not just one for the whole Booking. (Alternatively, you can use one of your other projects, as long as it has users registering.)  

1)  Locate and load up the project file.  
2)  Do some pushups and jumping jacks. You’ve been spending a bit too much time at the computer lately.
3)  Generate your new mailer with $ rails generate mailer PassengerMailer.
4)  Install the letter_opener gem to open your emails in the browser instead of sending them in the development environment.  
5)  Follow through the steps listed in the Rails Guide to create the action to send the confirmation email.  
6)  Build both an .html.erb and .text.erb version of your ticket confirmation email.  
7)  Test that the email sends by creating a new flight booking (letter_opener should open it in the browser for you if you’ve set it up properly).  
8)  Try out one other trick – call the mailer directly from the Rails Console using something like:  
PassengerMailer.confirmation_email(Passenger.first).deliver_now!
9)  Extra Credit: Deploy it to a hosting provider and try it out. There will be a bit of additional setup to get something an email provider like SendGrid working and sending emails in production for you.
(One heads up: in order to use an email provider you will probably have to give your credit card information, they do this to deter spammers. You don’t have to pay for the service, but you do have to give your information.)  

---------------------------------

I also fixed the bug that when the Booking form was modified by adding or removing passenger fields and then submitted with information missing, the page reloaded with the original number of passengers the first time, but not subsequent times. I added a hidden field to the form, number_of_fields for the number of passengers, whose value is updated by the add_passenger Stimulus controller every time a passenger form is added or removed. This also affects the permitted params in the Bookings controller --- by making a copy of the params before using only the previous params to make the Booking, I was able to avoid modifying the Booking model to have number_of_fields as an attribute. I chose not to deploy using Sendgrid, because according to their Terms I would need to include a genuine postal address for my Company (?) in every email sent by the app.