Specs:

 [X] Using Ruby on Rails for the project
 		-Used rails generators and ruby language to build this app
 [X] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
 		-A user has many households, and a household has many users.
 		-A user has many chores (thru completions), and a chore has many users (thru completions).  The completion join table has the user submittable attribute of "due date" which can only apply to the task itself, not the chore.
 		-A house also has many chores.
 		-This setup allows for a user to belong to many different dwellings, and have chores under those different dwellings.  A user can create a chore (which is more permanent) and assign the chore as a "task" or "chore completion" (which is temporary).  When the user completes a "chore completion" the "completed" boolean attribute will flip to true.
 [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
 		-A chore completion belongs to a chore and a user.
 		-A chore belongs to a house.
 [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
 		-A user has many chores (thru completions), and a chore has many users (thru completions).  The completion join table has the user submittable attribute of "due date" which can only apply to the task itself, not the chore.
 		-A house also has many chores.
 [X] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
 		-A user has many chores (thru completions), and a chore has many users (thru completions).  The completion join table has the user submittable attribute of "due date" which can only apply to the task itself, not the chore.
 		-A house also has many chores.
 [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
 		-When creating a profile, the username, email, or password cannot be blank.  The username and email must be blank, and the password must be valid.
 		-When creating a household, the household name cannot be blank.  The user will need this to click and edit/delete later on.
 		-When creating a chore, the chore description cannot be blank.  The user will need this to click and edit/delete later on.
 [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
 		-"find_or_create_by_omniauth" is a User class level method that uses the querying method "where" to find the first user that matches on email.
 		-"pending" is a Completion class level method that uses the querying method "where" to gather all chore completions that have not yet been completed.
 [X] Include signup (how e.g. Devise)
 		-User can sign up, using 'bcrypt' and 'has secure password'.
 [X] Include login (how e.g. Devise)
 		-User can sign in, using 'bcrpty' and 'has secure password'.
 [X] Include logout (how e.g. Devise)
 		-User can log out - this destroys the session id.
 [X] Include third party signup/login (how e.g. Devise/OmniAuth)
 		-User can log in through Facebook.
 [X] Include nested resource show or index (URL e.g. users/2/recipes)
 		-This app can view all chores assigned to a certain user e.g. users/1/completions
 		-This app can view all households that a user belongs to e.g. users/1/households
 [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
 		-The user can be viewing the households they belong to, and click "Add a Household" which directs to the path /users/id/households/new
 [X] Include form display of validation errors (form URL e.g. /recipes/new)
 		-This app highlights validation errors (class field_with_errors) in a red box.  This app shows red text for any custom error messages (field_with_error_message)

Confirm:

 [X] The application is pretty DRY
 [X] Limited logic in controllers
 [X] Views use helper methods if appropriate
 [X] Views use partials if appropriate



JAVASCRIPT PORTFOLIO PROJECT SPECS
[X] Must have a Rails Backend and new requirements implemented through JavaScript. 
[X] Makes use of ES6 features as much as possible(e.g Arrow functions, Let & Const, Constructor Functions)
[X] Must translate the JSON responses into Javascript Model Objects using either ES6 class or constructor syntax. 
[X] Must render at least one index page (index resource - 'list of things') via JavaScript and an Active Model Serialization JSON Backend. (Households/index)
[X] Must render at least one show page (show resource - 'one specific thing') via JavaScript and an Active Model Serialization JSON Backend. (Chores/show)
[X] Your Rails application must reveal at least one `has-many` relationship through JSON that is then rendered to the page. (Household/show chores)
[X] Must use your Rails application to render a form for creating a resource that is submitted dynamically through JavaScript. (Chores/new)
[X] At least one of the JS Model Objects must have a method on the prototype. (formatters)

Project Repo Specs:
Read Me file contains:
[X] Application Description
[X] Installation guide (e.g. fork and clone repo, migrate db, bundle install, etc)
[X] Contributors guide (e.g. file an issue, file an issue with a pull request, etc)
[X] Licensing statement at the bottom (e.g. This project has been licensed under the MIT open source license.)
[X] Repo General
[X] You have a large number of small Git commits
[X] Your commit messages are meaningful
[X] You made the changes in a commit that relate to the commit message
[X] You don't include changes in a commit that aren't related to the commit message
