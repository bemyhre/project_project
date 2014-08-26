project_project
===============

## Requirements
 
These are the most basic features and specs for the project.
 
### Clients
 
Attributes:
 
- Name
- Company name
- Email address
- Has many projects
 
Features:
 
1. List all clients
2. Create new clients
3. Edit existing clients
4. List projects for each client
 
### Projects
 
Attributes:
 
- Name
- Description
- Belongs to client
- Has many deliverables
 
Features:
 
1. List projects for a client (Same as Clients #4)
2. Create new projects
3. Edit existing projects
4. List deliverables for each project
 
### Deliverables
 
Attributes:
 
- Name
- Description
- Belongs to project
- Has many issues
 
Features:
 
1. List deliverables for a project (Same as Projects #4)
2. Create new deliverable
3. Edit existing deliverables
4. List issues for each deliverable
 
### Issues
 
Attributes:
 
- Title
- Body
- Budgeted time
- Priority
- Belongs to deliverable
 
Features:
 
1. List issues for a deliverable (Same as Deliverables #4)
2. Create new issues
3. Edit existing issues
 
## Features
 
These are features that will make the app stand out
as being more useful than simply using a spreadsheet.
 
The features are listed in order of importance to the client.
 
### 1. Drag and drop sorting
 
Use JavaScript to create an interface for sorting issues
to change the priority of the issues in a project.
 
### 2. Autocomplete
 
The client would like to be able to easily jump to 
any client, project, or issue by using an autocomplete
search field for each model.
 
Nothing fancy is needed as far as full text search.
A simple `LIKE` query is just fine.
 
Each autocomplete search field should pull from
matches to the following fields:
 
#### Clients
 
- Name
- Company name
- Email address
 
#### Projects
 
- Name
 
#### Issues
 
- Title
- Body
 
#### BONUS
 
An autocomplete search that pulls in matches from all
models and groups them in the search results.
 
### 3. Authentication
 
Require the email address and password from an admin
user to manage clients, projects, etc.
 
Give clients user accounts so they can log in and
view their projects and issues.
 
#### BONUS
 
Use CanCan to lock down all look ups and actions to  
only the records that should be accessible to the user.