# [NPC Generator v0.1](https://npc-generator-lhje.herokuapp.com/)

![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Ruby-2.5.3-orange) ![](https://img.shields.io/badge/Code-HTML-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://travis-ci.com/My-Solar-Garden/front_end_rails.svg?branch=main)

NPC Generator is a collaboration between a UX/UI Designer, a Backend Engineer, and, eventually, a Frontend Engineer who were inspired by all the great other NPC Generators out there, but felt they had a few ideas of their own that they wanted to explore.  It utilizes the [Open5e API](https://open5e.com/) and [D&D 5e API](https://www.dnd5eapi.co/api), for which we are eternally grateful.

### Live app
[https://npc-generator-lhje.herokuapp.com/](https://npc-generator-lhje.herokuapp.com/)

## Installation

Clone the repo, and then run the following commands to get the generator up and running on your local machine:

```
bundle install
bundle update
rails db:{create,migrate,seed}
```

This has created a file called `application.yml` in your `config` folder.

In that file, paste this:

```
DND_URL: "https://api.open5e.com"
SECOND_DND_URL: "https://www.dnd5eapi.co/api"
```  

Luckily both of the API's used here are open, so there are no API Keys.

## Usage

After you've run those commands, simply go run `rails s` in your terminal, and go to `localhost:3000` in your web browser, and you should be good to go!

## Schema
Below is our schema.

![our schema](/npc_generator_schema.png)


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Contributors

* Luke Hunter James-Erickson
    * [GitHub](https://github.com/LHJE)
    * [LinkedIn](https://www.linkedin.com/lhje/)

 * Cecile Elliott
    * [Website](https://www.onecreativebird.com)
    * [LinkedIn](https://www.linkedin.com/in/cecileelliott/)

## License
Copyright 2020 Luke Hunter James-Erickson, Cecile Elliott

Permission is hereby granted to any person obtaining a copy of this software and associated materials to make use of the software and associated materials according to the terms of the MIT License IF AND ONLY IF they have not read any portion of this file.

Any person who has read any portion of this file may not make any use of the software and associated materials for any purpose whatsoever. Any permissions previously granted to any person to use this software and associated materials terminate and are revoked with immediate effect upon their reading of any portion of this file.
