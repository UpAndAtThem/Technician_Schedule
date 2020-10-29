# SCHEDULER README

Welcome to SHEDULR a ultra modern interface for technicians to check their daily appointments and check to see the amount of time between scheduled appointments

## Getting Started

Make sure you have the following installed on your computer

`Ruby On Rails` getting started link: https://guides.rubyonrails.org/getting_started.html

### Setting up the data
To import the data for the technicians, work_orders, and locations run the commands:
`rails db:migrate` this will create the 3 tables for the database (technitions, work_orders, locations).
`rake import:all` this command will execute our task runner to load our CSVs and add them to our database via our Models (Technition, Location, WorkOrder)

To run the application run the command `rails server`
