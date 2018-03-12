# Cabify Slack Bot(unstable)

This project is still in development, custom slack integration that behaves like a bot that makes requests on a Cab JSON API, 
calculates the distance between the location of the cab and a given address and does a POST request on the API after that it
'slacks' the client with the name of the cab and the time it'll take to get to the given address.

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

Add commands that tell the client the current location of the cab, show a mab with the location and route the cab will take
to arrive to the given address on slack. This could be done with Google Maps.

Add help command to show bot functionality to the client.

Tried to deploy the bot and make it available for distribution but Heroku doesn't recognize the app as a Ruby application and 
I'm still looking into it.

Small website with slack button to add bot.

## Use

You'll need a SLACK_TOKEN_API and a google API_KEY that I've set on the environment using 'export env 'SLACK_TOKEN_API=...''

Use bundler or bundle install for dependencies

Use 'rspec' to run tests, it fails if the environment is not properly set up or if the API's are not online. Remember is using
an API deployed on heroku and sometimes it might be put to sleep.

To run the bot use 'foreman start'

