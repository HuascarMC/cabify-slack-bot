# Cabify Slack Bot

Not all tests are passing yet and a few bugs are listed below.

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

## Current issues

This app has different classes that use a variety of 'gems' to provide the service, when testing and using the service there's
a conflict when the 'HTTP gem' is used by the bot so the service only works for addresses in Spain.

The service API provided for the task has wrong coordinates for the 'cab objects' provided. I've developed and deployed a similar API on [Cab's API](https://cabify-json.herokuapp.com/cabs').
The new API is not fully operational but doesn't have a delay functionality when POST requests are made, so POST requests are
still made on the API provided and GET requests are made on the API I created.

The app needs to have more tests for different scenarios.

When the bot is looking for the nearest cab available it narrows the search to the city of the given address, this is faster
than looking for all the cabs in the API but it's still slow and could be improved.

## Desirable Features

1. Add commands that tell the client the current location of the cab, show a map with the location and route the cab will take
to arrive to the given address on slack. This could be done with Google Maps.

2. Add help command to show bot functionality to the client.

3. Tried to deploy the bot and make it available for distribution but Heroku doesn't recognize the app as a Ruby application and I'm still looking into it.

4. Small website with slack button to add bot.
