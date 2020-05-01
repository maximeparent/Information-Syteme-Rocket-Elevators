## RocketElevators-ML
### Machine Learning // Week-12
Project of Mykee, Maxime, Alexis, Ukeme, Younes, Agnes

Rocket Elevators offer those who operate our products safety features that ensure the safety of the users. In addition to the traditional cameras. 
Just as passengers consent to being filmed using our elevators, they are informed that they are subject to audio recording and these audio clips will be processed to serve two purposes:
 - To recognize passengers via voice profiles
 - Transcribe audio for legal purposes

To do so, we applied **Azure's Cognitive Services on Microsoft Azure platform.**


### PATH FOR THE ML FILES:

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
PATH TO THE AUDIOS AND TEXT FILES ```/azure_conversation_analysis```

PATH TO THE SPEAKERS PROFILES ```/azure_speaker_profiles```

PATH TO THE SPEAKERS CONTROLLER ```app/controllers/speakers_controller.rb```

PATH TO THE SPEAKERS VIEW ```app/views/speakers/index.html.erb```

### POSTMAN tests

Here you can find our test's link, if you would like to import in Postman:

**Postman "Speaker Recognition" collection:**

https://www.getpostman.com/collections/800b8cd0e6ba8b4dd15c

**Postman "SpeakerRecognition Conversations" collection:**

https://www.postman.com/collections/ec3df443ec49fd70b099


### Test-Driven-Development (TDD)

We implimented some TDD tests for our new speakers controller form the beginning to help our work.

Path in the Rails App => ```spec/controllers/speakers_spec.rb```

Command to execute the RSpec => ```rspec ./spec/controllers/speakers_spec.rb```

COVERAGE

We implemented SimpleCov, the code coverage analysis tool for Ruby. As it gitignored you can't open in your browser but you will see in our video. Code coverage is a measure which describes the degree of which the source code of the program has been tested. Better to implement this before write a code and continuously test then it will be close to 100%.

Our result: Coverage report generated for RSpec to /mnt/c/Users/Agi Vizvari/Desktop/Rocket-Elevator-Foundation/coverage. 299 / 352 LOC (84.94%) covered.

## Speech-To-Text

### POSTMAN tests

Here you can find our test's link, if you would like to import in Postman:

**Postman "" collection:**



