# Legal Advice QA Board

A small platform where users can submit legal questions and verified lawyers can respond with paid advice.

Built with Ruby on Rails 8.

------------------------------------------------------------------------------

# Live Demo

------------------------------------------------------------------------------

## Setup Instructions

1. Clone the repo:
#bash
git clone #
cd legal-advice-board

2. Install dependencies:
#bash
bundle install

3. Set up the database:
#bash
rails db:create 
rails db:migrate 
rails db:seed

4. Start the server:
#bash
rails s

## Gems & Tools Used

Devise for authentication

turbo-rails for turbo stream

Material Design Bootsrap CSS for clean UI

Haml for haml template file format

Rubocop for code analyzer and code formatter

RSpec for model tests

Heroku for deployment

## Explanation of implementation decisions
1. Login Roles
-> User with devise authentication
-> with 3 roles : admin, lawyer, client(simple user who ask question)
-> User can sign up with default role 'client'

Default created client, lawyer and admin by seed file are:
=> Admins:  email: admin1@example.com, password: '1234567890'
            email: admin2@example.com, password: '1234567890'
=> Lawyers: email: lawyer1@example.com, password: '1234567890'
            email: lawyer2@example.com, password: '1234567890'
=> Clients:  email: client1@example.com, password: '1234567890'
            email: client2@example.com, password: '1234567890'

## Implementation Decisions
