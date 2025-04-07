# Legal Advice QA Board

A small platform where users can submit legal questions and verified lawyers can respond with paid advice.

Built with Ruby on Rails 8.

------------------------------------------------------------------------------

# Live Demo
https://desolate-fjord-14053-c7a0e62bf0d7.herokuapp.com/

------------------------------------------------------------------------------

## Setup Instructions

1. Clone the repo:
- git clone git@github.com:poonam2127/legal_board.git
- cd legal_board

2. Install dependencies:
- bundle install

3. Set up the database:
- rails db:create 
- rails db:migrate 
- rails db:seed

4. Start the server:
- rails s

## Gems & Tools Used

1. Devise for authentication
2. turbo-rails for turbo stream
3. Material Design Bootsrap CSS for clean UI
4. Haml for haml template file format
5. Rubocop for code analyzer and code formatter
6. RSpec for testing model and complex interaction for approve payment
7. Heroku for deployment

## Sample User Credentials
- User with devise authentication
- with 3 roles : admin, lawyer, client(simple user who ask question)
- User can sign up with default role 'client'

- You can log in with the following pre-seeded accounts:
=> Admins:

email: admin1@example.com, password: '1234567890'

email: admin2@example.com, password: '1234567890'

=> Lawyers: 

email: lawyer1@example.com, password: '1234567890'

email: lawyer2@example.com, password: '1234567890'

=> Clients:

email: client1@example.com, password: '1234567890'

email: client2@example.com, password: '1234567890'

You can find these users in the db/seeds.rb file. Feel free to change credentials there if needed.

## Implementation Decisions
=> Role-based access: Used a role column on the User model to simulate user and lawyer or admin roles.

=> Turbo Streams: when answer is available so when user click on 'Approve Payment(£45)' shows answer without "page refresh" also update status of question on the page

=> Authorization: Used simple role checks instead of Pundit to keep the codebase minimal for this demo.
eg: Client cannot access lawyer pages with answers or admin dashboard (in case of url paste direct on browser) 

=> Flash messages: Added flash messages for better UX when question created or answer submitted.

## Core Features
**Client can:
- sign up
- Submit legal questions (title, body, category) on index
- View their questions with title,status,category 
- See lawyer responses after payment approval [After payment approve without page refresh]

**Lawyers can:
- View open questions on index page
- Submit an answer with a proposed fee
- can view their answers

**Payment Flow:
- After a lawyer answers, simulated payment request sent to user.
- The user approves it to unlock the answer.Answer is marked as paid, and question becomes answered.

## Stretch Goals Tackled
- Turbo-powered dynamic updates (no page reloads) when:
  Users approve payments - can view answer with question status updated
- Implement Feature for lawyer::can see answered questions
- Client::add small badge on index page with question if answer is available
- Rspec for model: question, answer and COMPLEX INTERACTION for approve payment
- Add flash meassges
- email notification by logger when answer submits
- Admin dashboard page with cards: total number of paid question, open questions, total payment revenue
- Formatting Design(Quetion/Answer) using material design bootstrap

- ## EXTRA:::User Role Authorization and Access Control::
  1. 
  - client created the question
  - question is open
  - lawyer1 answered -> but still client has not approve payment
  - lawyer2 answered -> Because question is open
  - client approve answer given by lawyer1 => so only visible that answer => question marked as 'answered' 
  2. 
  - lawyer3 try to submit the answer which is already approved by client "because question is answered" => cannot be created answer
  3. 
  - Lawyer can see the answered question only if they give answer of them
  4. 
  - Only user of the question can view answer(if paid) along with that question