# myTUT Rails Application - Coder Factory Project 2

## Application Setup

- [x] Ruby 2.3.1 and Rails 5.0
- Gems used:
  * Rolify
  * Boostrap
  * Font-awesome
  * simple_form
  * devise
  * carrierwave
  * cloudinary
  * cancancan
  * stripe

```
bundle
rake db:migrate
rake db:seeds
```
The roles are defined in the seeds.rb file. So run it before using the application.

# Design and Documentation

## Problem definition

Tutors have to travel a long distance to teach their students.
The goal of this app is to allow Tutor to teach his students anywhere. Only
using internet and two laptops.

## Solution

myTUT allows tutors to create a tutor profile online where high school students
would be able to choose from. The student and the tutor will contact each other
using the messaging app and agree on when to meet. The student would then make
a booking request. After approval of the request, the booking is confirmed and
the student will have to pay for the tutoring session.

TO DO

The next step of the myTUT app would be to create a tutoring session between the
tutor and the student. A session in which they can share documents, discuss and
write/view on the same documents.

## User Journey

### Student

Discovery -> Sign Up -> Tutors Selection -> Application(Booking) -> Transaction
-> Session -> Post Session

### Tutor

Education(Rules to follow as a tutor) -> Create Profile -> Application Review
-> Session -> Post Session

## Deliverables

- Wireframes:
* wireframes.pdf

- User Stories:
* Trello link: https://trello.com/b/GC0NBngH/mytut

- Entity Relationship Diagram
  * Initial ERD: assets/images/ERDmyTUT.png
  * Made by rails-erd: erd.pdf

## Project Estimation

$25,000 with delivery time frame of 7-8 weeks.
Link to excel sheet: https://docs.google.com/spreadsheets/d/1qSXGuMaW-1Pf1ZFfhPNunX6kRZ7YSCHYetMV6clzMew/edit?usp=sharing

# Tools and Methodologies

* Use of Trello for planning and progression review
* Use of dbdesigner for ERD creation
* User Slack to discuss with my peers
* Github: liptonite24/mytut
* Rubocop and Rubycritic (NOT DONE)

# Rails Application

- [x] Use of postgresql database in development
- [x] Implemented Omniauth-facebook
- [x] Environment Variables set in Bash and in Heroku Config
- [x] Implemented a payment system using stripe (test mode)
- [x] Implemented Mailgun when transaction is completed (disable because sandbox mode)
- [x] Implemented messaging system
- [x] Search for tutors available
- [x] Implemented carrierwave and cloudinary for profile picture and cloud storage
- [x] Implemented Devise authentication
- [x] Implemented Cancancan for authorisation
- [x] Implemented an Admin dashboard
