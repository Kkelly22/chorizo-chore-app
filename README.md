# README

Welcome to Choreizo!

Choreizo is a Rails Application that connects chores with prizes in an attempt to "spice up your chores".
This app currently maintains chores, the households they belong to, the users they are assigned to, as well as the points awarded for completion chores. However, the idea of redeeming these points for prizes is not yet implemented.  Possibly linking a "cashout" functionality that could transfer money or coupons will be implemented eventually...

Choreizo Specs:

* Ruby version: 2.3.3 (x86_64-darwin14)

* Rails version: 5.2.0

* System dependencies - See Gemfile for the Ruby Gems this application utilizes

* Database creation - The database has 5 main tables - User, Chore, Household, Completion (the "completion of a chore", or a "task"), and a Household_User which allows Users to have many households, and households to have many users.

* Database initialization- run bundle install, and rake db:migrate to get this app initialized and up and running.  Run 'rails s' to start up the local host, and visit your local host to enjoy Choreizo.


How to Use:

Sign up for Choreizo.  Once you have a username/password/email created, you can log in and out of Choreizo.
You can then start building your chore system by first adding a household, and then adding chores under that household.  You can create as many households as you'd like, and add as many chores under each household as needed.  You can then start assigning chores to users, whether it be yourself or another household dweller.  

Any user you assign a chore to must exist in the Choreizo database to be able to receive the chore.  Once another user has joined Choreizo, they can search through 'All Households' and 'Join' the household you've set up.  This will allow them to see all chores listed under each household they belong to, accept/complete the chores, and earn points!


This application has been licensed under the MIT open source license.  More detail can be found at https://opensource.org/licenses/MIT.