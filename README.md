# [NPCme v0.1](https://npcme.herokuapp.com/)

![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Ruby-2.5.3-orange) ![](https://img.shields.io/badge/Code-HTML-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://api.travis-ci.com/NPCme/NPCme.svg?branch=main)

NPCme is a collaboration between a UX/UI Designer, a Backend Engineer, and a Frontend Engineer who were inspired by all the great other NPC Generators out there, but felt they had a few ideas of their own that they wanted to explore.  It utilizes the [Open5e API](https://open5e.com/) and [D&D 5e API](https://www.dnd5eapi.co/api), for which we are eternally grateful.

### Live app
[https://npcme.herokuapp.com/](https://npcme.herokuapp.com/)

## Installation

- Run the following commands to get the generator up and running on your local machine:
```
git clone https://github.com/LHJE/npc_generator.git
bundle install
bundle update
bundle exec figaro install
```

- This has created a file called `application.yml` in your `config` folder.
* At the bottom of that file, paste this:

```
DND_URL: "https://api.open5e.com"
SECOND_DND_URL: "https://www.dnd5eapi.co/api"
```  
* Luckily both of the API's used here are open, so there are no API Keys.

- Now you have to obtain Google OAuth credentials
    * Visit https://console.developers.google.com/ and create a new project
    * Select the project and on the left click OAuth consent screen, choose external, click create, and proceed with the required fields (if a field is not required you can skip it)
    * Click on Credentials on the left then click '+Create Credentials' at the top. Choose OAuth client ID, choose Web application, and under Authorized redirect URIs if you plan on testing Google OAuth with localhost you will want to include:
    * `http://localhost:3000/auth/google_oauth2/callback`
    * Click Create and you should receive a Client ID and Client secret. These will go in your application.yml file as:
```
GOOGLE_CLIENT_ID: 'your ID'
GOOGLE_CLIENT_SECRET: 'your ID'
```

- Because this app also has a "Contact Us" feature, you'll also need to add this to the application.yml file as well:
```
GMAIL_EMAIL: 'your_gmail_address'
GMAIL_PASSWORD: 'your_password'
```
 * Note: This application.yml file will ONLY EXIST ON YOUR COMPUTER.  Because the `.gitignore` file is told not to upload it, this information will remain on your computer. Don't delete this `.gitignore` file, otherwise you're going to want to change your password...

- Lastly run this in your terminal:  
```
rails db:{create,migrate,seed}
rails db:{migrate,seed} RAILS_ENV=test
```
Seeding may take up to 2 minutes (mainly because there are so many spells!), but you'll only have to do that once.  Make some tea or surf the web!  You've earned it.

## Usage

After you've run those commands, simply go run `rails s` in your terminal, and go to `localhost:3000` in your web browser, and you should be good to go!

## Testing

If you would like to test the repo, we're using `Rspec`.  In your terminal, while in the repo's directory, simply type `bundle exec rspec` and the tests should run!  Because of the random nature of the tests/NPC builds, there's no way to get a consisten 100% testing, but there should be no failing tests, and more than 98% of the lines should be being tested each time..

## Schema
Below is our schema.

![our schema](/app/assets/images/npc_generator_schema.png)


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Contributors

Backend:
* Luke Hunter James-Erickson
    * [GitHub](https://github.com/LHJE)
    * [LinkedIn](https://www.linkedin.com/in/lhje/)

UX/UI:
* Cecile Elliott
    * [Website](https://www.onecreativebird.com)
    * [LinkedIn](https://www.linkedin.com/in/cecileelliott/)

Frontend:
* Caleb Cyphers
    * [GitHub](https://github.com/CalebCyphers)
    * [LinkedIn](https://www.linkedin.com/in/caleb-cyphers/)

## License
Copyright 2020 Luke Hunter James-Erickson, Cecile Elliott, Caleb Cyphers

Permission is hereby granted to any person obtaining a copy of this software and associated materials to make use of the software and associated materials according to the terms of the MIT License IF AND ONLY IF they have not read any portion of this file.

Any person who has read any portion of this file may not make any use of the software and associated materials for any purpose whatsoever. Any permissions previously granted to any person to use this software and associated materials terminate and are revoked with immediate effect upon their reading of any portion of this file. ;)
