# My Party

My Party is an application for managing restaurant reservations.

## Setup Instructions

In your terminal, you will need to clone the repo:
`git clone https://github.com/melonious/my-party.git`

Once the repo has been cloned, you will need bundle, in order to make sure you have all of the necessary gems:

`bundle install`

After you bundle, you will need to migrate:

`rake db:migrate`

Once you have done this, you should be ready to run the application on on your localhost:3000 server. In your terminal, start up your server:

`rails server`

All that's left is to open a browser and navigate to:

`localhost:3000`

NB: Our database is powered by PostgreSQL, so you will need to have PostgreSQL running in the background in order for the application to function. If you do not have the software, you can download it [here](https://www.postgresql.org/).

## About the Creators

My Party was created by [Deri Cleland](https://www.linkedin.com/in/deri-cleland-74494441) and [Deanna Melin](https://www.linkedin.com/in/deannamelin) as a project for [Wyncode Academy](http://wyncode.co/). Wyncode is a nine week, intensive, full-stack web development bootcamp where the creators of My Party learned Ruby, Ruby on Rails, Javascript, HTML, and CSS.

This project was assigned on a Friday and the code freeze was the following Tuesday. The purpose of the project was to practice and refine our newly gained knowledge of Ruby on Rails (we only had five days of exposure before this assignment).
