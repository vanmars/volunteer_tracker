# _Evergreen State of Mind: Project and Volunteer Tracker_

_9 October 2020_

#### _Application for tracking projects and associated volunteers_

#### By _**Vanessa Stewart**_

## Description

_This is a project for Epicodus to demonstrate mastery using basic SQL database methods with a Sinatra application. The application is for a fake non-profit called Evergreen State of Mind, which is in need of tracking projects and the volunteers working on each project. The original directions for the assignment include:_

Create an application that tracks projects and the volunteers working on them. Each volunteer will belong to only one project (one project, many volunteers).The following user stories should be completed:

* As a non-profit employee, I want to view, add, update and delete projects.
* As a non-profit employee, I want to view and add volunteers.
* As a non-profit employee, I want to add volunteers to a project.

## Specifications
| Spec     | Behavior | Code Translation | 
| -------- | -------- | -------- |
| 1 | User (fake non-profit employee) can view, add, update, and delete projects. | Create a project class with methods for CRUD functionality. | 
| 2 | User (fake non-profit employee) can view and add volunteers. | Create a volunteer class with methods for CRUD functionality.  |  
| 3 | User (fake non-profit employee) can add volunteers to a project. | Volunteer class needs project_id property to connect with projects table primary key. |  

## Stretch Specifications
| Spec     | Behavior | 
| -------- | -------- |
| 4 | Add full CRUD functionality for volunteers. |  
| 5 | Add a search function, so employees can find projects and volunteers by name. | 
| 6 | Add a sort function so projects and volunteers can be sorted alphabetically. |
| 8 | Add an hours field to the volunteers table to track how many hours each volunteer has worked. Employees should be able to sort volunteers by most and least hours. |  
| 9 | Add a method that calculates how many total hours all volunteers have put into a single project. |    
| 10 | Make projects sortable by total hours as well. |   

## Visualization of Data Tables
<img src="./public/img/new_tables.png">

## Setup/Installation Requirements

To View Project:
* Check out the Heroku app [here](https://fierce-cove-34319.herokuapp.com/)!

To Extend This Project:
- Navigate to the directory on your local computer where you would like to clone this repo.
- Clone this repo using the `git clone` command in terminal/command line.
- Navigate to the cloned folder and run `gem install bundler` to install Bundler, which will mange all gem installations for our project.
- Run `bundle` or `bundle install` in your command line to download all dependencies. (If add additional gems later, you will need to run `bundle update <gem name>`.)
- Open the cloned repo in a text editor of your choice.
- You will need Postgres for this project. Find directions [here](https://www.learnhowtoprogram.com/ruby-and-rails/getting-started-with-ruby/installing-postgres) for installing Postgres.
- Once Postgres is installed, access the Postgres server by opening a terminal and run `postgres`.
- In another terminal, run `psql`, which is how you will interact with your Postgres databases.
- Create databases and tables with the following commands:
```
USER=# CREATE DATABASE volunteer_tracker;
USER=# \c volunteer_tracker;
USER=# CREATE TABLE projects (id serial PRIMARY KEY, name varchar);
volunteer_tracker=# CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int, hours int);
volunteer_tracker=# CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;
```
- To Run Tests: While in the root directory of this project, run `rspec` in your command line.
- To Run the App in Browser: While in the root directory of the project, run `ruby app.rb` in the terminal. This will start a server, which you can access by entering `localhost:4567` in your browser.
- Have fun, and be a good person!

## Known Bugs

* If a user enters an apostrophe into any input field, the code breaks. Need to consider edge case inputs and code for them.
* Integration test 2 stopped passing; error message says content not appearing on page, yet project names are in fact being updated on the page when localhost server is run.
* Individual volunteer hours are not being added to volunteer table on individual project pages. Also, an update to a volunteer's hours after an initial update changes the total hours, rather than adding to total.

Items to Improve:
* Attempt last stretch goal: sort porjects table by hours.
* When a project is added on the home page, it would be nice to have the post method go to the place on the page where the table exists to avoid having to scroll down after every project addition.
* Could add more integration test for fuller coverage and more bad input tests to check for edge cases.
* Add in a project description column in projects database and include on project creation form to paste on project detail page.

## Support and Contact Details

_Connect with me at vamariestewart@gmail.com with ideas to improve this project._

## Technologies Used

* HTML5
* CSS/Bootstrap
* Ruby
* Ruby Gems: Capybara, Pry, PG, Rake, RSpec, Sinatra, Sintara-Contrib
* Postgres/psql

### License

Copyright (c) 2020 **_Vanessa Stewart_**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.