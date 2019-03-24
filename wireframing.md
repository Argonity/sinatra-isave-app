# App Overview

I am building a money savings application, called iSave, which will allow users to create multiple savings accounts for a variety of items they would like to save up for. Each item will have own its own separate savings account.

# User Stories

### As a user, I will be able to:

- sign up, log in, log out
- create a savings account
- see all my savings accounts
- edit my savings accounts
- delete my savings accounts

# Wireframing

## Models will be User and SavingsAccount

## User Model

### Attributes:

- name
- email
- password (will use bcrypt - 'password_digest' in the db)
- account_balance

### Associations:

- has_many :savings_accounts


## SavingsAccount Model

### Attributes:

- item
- price
- save_by_date (not sure about this attr. priority_level might take care of this)
- amount_saved
- priority_level
- user_id <-- this will be the foreign key

### Associations:

- belongs_to :user

# MVP

- User can signup, log in, log out, create, edit, delete and view their own savings accounts

# Stretch Goals

- User can input amount into app and the funds will allocate a specified amount to each savings account (based on item priority set by user)
- write tests

# QUESTIONS

- Why are there items/prices/etc displayed even for new users? DONE
- User's first names do not appear on savings_accounts index pg. DONE
- How to clearly display all of a user's savings accounts? DONE
- Signed in as Brandon but in binding.pry saw another user ie mda2630@aol.com DONE
- Why is 'low' 'medium' 'high' not initial cap? DONE
- Make all fields required for creating new savings account. Because now if a user only enters item, it goes thru. And if you want to edit that item, you can only edit the fields originally inputted by user, in this case item. DONE
- Security to control access so that another user cannot edit address bar and edit/delete another user's savings account. DONE
- Add functionality to route to Home Page; button or link. DONE
- Priority level value not showing on edit form. DONE
- No one is logged in and clicking on the logo to go to home page returns error. Check get '/' code in app controller. DONE
- Logo not appearing on all pages. DONE
- Delete page CSS styling for buttons. DONE

PENDING:
- Converting price and amount_saved inputs with comma.
- Two users cannot have the same email.

Sinatra Tech Coach:
Jennifer Pazos:
10-1 MWF
TTH 8-11