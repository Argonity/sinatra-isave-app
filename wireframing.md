# App Overview

I am building a money savings application, called iSave, which will allow users to automatically allocate a certain amount of money to various items they would like to save for. 

Users can create multiple items to save for  

A user can specify an exact amount to be allocated to a specific item; or

# User Stories

## As a user, I can...

- sign up, log in, log out
- create a savings folder
- see all my savings folders
- edit my savings folder
- delete my savings folder

# Wireframing


## Models will be User and SavingsFolder



## User


### Attributes

- name
- email
- password (will use bcrypt - 'password_digest' in the db)

### Associations

- has_many :savingsfolder

## SavingsFolder

### Attributes

- content
- user_id <-- this will be the foreign key
- date

### Associations

- belongs_to user

# MVP

- User can signup, log in, log out, create savings folder, edit their own entries, view their own entries

# Stretch Goals

- user can allocated specified amount to savings folder