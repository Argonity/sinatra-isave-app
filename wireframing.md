# App Overview

I am building a money savings application, called iSave, which will allow users to allocate any amount of money to mulitple savings accounts, called pockets, for the items they would like to save up for. 

# User Stories

### As a user, I will be able to:

- sign up, log in, log out
- create a pocket
- see all my pockets
- edit my pockets
- delete my pockets

# Wireframing

## Models will be User and Pocket

## User Model

### Attributes:

- name
- email
- password (will use bcrypt - 'password_digest' in the db)
- account_balance

### Associations:

- has_many :pockets


## Pocket Model

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

- User can signup, log in, log out, create, edit, delete and view their own pockets

# Stretch Goals

- User can input amount into app and the funds will allocate a specified amount to each pocket (based on item priority set by user)
- write tests