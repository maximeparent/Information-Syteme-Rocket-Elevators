## RocketElevators-ML
### Machine Learning // Week-12

## Speaker Recognition

### The Goal 
The objective was to identify our referenced speaker (has registered voiceprint) in a recorded audio with the Speaker ID API and also get results about the not referenced speakers.

Code for Speaker Recognition:
```
|-- **app**
|   |-- admin
|   |-- assets
|   |-- channels
|   |-- **controllers**
|       |-- ...
|       `-- **speakers_controller.rb**
|   |-- helpers
|   |-- jobs
|   |-- mailers
|   |-- models
|   |-- views
|       |-- ...
|       |-- **speakers**
|           `-- **index.html.erb**
|-- **azure_conversation_analysis**
|-- **azure_speaker_profiles**
|-- config
|-- db
|-- doc
|-- lib
|-- log
|-- public
|-- **spec**
|   |-- helpers
|   |-- models
|   |-- requests
|   |-- routing
|   |-- views
|   `-- **speakers_spec.rb**
|-- storage
|-- test
|-- tmp
`-- vendor
```
PATH TO THE AUDIOS ```/azure_conversation_analysis```

PATH TO THE SPEAKERS PROFILES ```/azure_speaker_profiles```

PATH TO THE SPEAKERS CONTROLLER ```app/controllers/speakers_controller.rb```

PATH TO THE SPEAKERS VIEW ```app/views/speakers/index.html.erb```

### Test-Driven-Development (TDD)

We implimented some TDD tests for our new speakers controller form the beginning to help our work.

Path in the Rails App => ```spec/controllers/speakers_spec.rb```

Command to execute the RSpec => ```rspec ./spec/controllers/speakers_spec.rb```

COVERAGE



## Speech-To-Text

Code for Speech-To-Text:
```
|-- **RocketElevatorsGoogleChatBot**
|   |-- Examples
|   `-- **graphql_api_index.js**
|   `-- **package.json**
|   `-- **rest_api_index.js**

```
PATH ```RocketElevatorsGoogleChatBot/graphql_api_index.js```

