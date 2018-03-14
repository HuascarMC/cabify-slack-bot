# Cabify Slack Bot

Not all tests are passing yet and a few bugs are still to be fixed..

The bot is deployed on heroku and can be added to your workplace [here](cabify.herokuapp.com). 

## Installation

1. Clone repository.

```git clone https://github.com/HuascarMC/cabify-slack-bot```

2. Create an ```.env``` file inside the cloned repo.

```touch .env```

3. Create a new bot user on Slack [here](http://slack.com/services/new/bot), copy the token and paste it inside your .env file like this without the brackets:

```SLACK_TOKEN_API={token}```

4. Get a google API key from [here](https://developers.google.com/maps/documentation/javascript/get-api-key) and copy/paste it inside your .env file like this without the brackets:

```API_KEY={key}```

5. Save your .env file.

6. Run the bot using ```foreman start``` after a few seconds it should say "Succesfully connected to slack". 

## Testing

To run the tests make sure that ```foreman start``` is running, open another tab in terminal and use ```rspec``` to run tests.

## How to use

Make sure you add the bot to a channel, chatting directly to the bot will make it crash. 

1. Add bot to a channel (f.e General)

2. Say ```Cabify``` + ```address```.

Example: ```"Cabify C/Simón Hernández, 62 Madrid"```

3. The bot will reply after a few seconds with:

```"A cab has been ordered to C/Simón Hernández, 62 Madrid, it's name is Opel and it'll pick you up in around 25 mins"```

3. It only works with some addresses at the moment.

