# README

This README would normally document whatever steps are necessary to get our application up and running.

First of all you have to clone the repo using this command <br/>
 `git clone https://github.com/ahmedmathlouthi/sports-app.git`

and dont forget about the frontend side here' the command 
<br/>

 `git clone https://github.com/ahmedmathlouthi/sports-app-frontend.git`

## Backend Project setup

Create the database and populate the database with random data using <br/>
 `rails db:create db:migrate db:seed` 

Then all you have to do is to run the project using the following command <br/>
 `rails s -p 3001`

 ### Answers of the questions

 * What are potential pitfalls when expanding on your solution => I chose to do GraphQl even it's my first time using it because I found it as an opportunity to learn it and I really saw the difference between Rest and GraphQl

 * How big would your solution scale to, and what would you do at that point? => It can scale to adding restructions on the users data, for example only the follower can see my informations (if we add any) and there we can define our own policy based on that

  * How would you modify your implementation to support other types of followers than just
Users?
    * Imagine you could also be followed by a Club => Then we change our association by adding polymorphic association and that by adding followable for the user and the following can be a user or a club or another type of model 

