## RocketElevators-ML
### Machine Learning // Week-12
Project of Mykee, Maxime, Alexis, Ukeme, Younes, Agnes

Rocket Elevators offer those who operate our products safety features that ensure the safety of the users. In addition to the traditional cameras. 
Just as passengers consent to being filmed using our elevators, they are informed that they are subject to audio recording and these audio clips will be processed to serve two purposes:
 - To recognize passengers via voice profiles
 - Transcribe audio for legal purposes

To do so, we applied **Azure's Cognitive Services on Microsoft Azure platform.**

### PATH FOR THE ML FILES:

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
|   |-- controllers
|       `-- **speakers_spec.rb**
|-- storage
|-- test
|-- tmp
`-- vendor
```
PATH TO THE AUDIOS & TEXT FILES  ```/azure_conversation_analysis```

PATH TO THE SPEAKERS PROFILES  ```/azure_speaker_profiles```

PATH TO THE SPEAKERS CONTROLLER  ```app/controllers/speakers_controller.rb```

PATH TO THE SPEAKERS VIEW   ```app/views/speakers/index.html.erb```


## Speaker identification

### The Goal 
The objective was to identify our referenced speaker (has registered voiceprint) in a recorded audio with the Speaker ID API and also get results about the not referenced speakers.

### POSTMAN tests

Here you can find our test's link, if you would like to import in Postman:

**Postman "Speaker Recognition" collection:**

https://www.getpostman.com/collections/800b8cd0e6ba8b4dd15c

**Postman "SpeakerRecognition Conversations" collection:**

https://www.postman.com/collections/ec3df443ec49fd70b099


### EXTRA MILES

#### HTML PAGE

An html page about Creating speaker profiles is added to the dashboard called machine learning... a model and a controller called Speakers is also added to the Ruby on Rails project... the code allow the creation of an identification and an enrolment of a new speaker.. to test it: upload an audio file (.wav) from the [./azure_conversation_analysis] folder, a speaker ID will be added and an enrolment is created.. You check the results either on the console or using postman.



#### Test-Driven-Development (TDD)

We implimented some TDD tests for our new speakers controller form the beginning to help our work.

Path in the Rails App => ```spec/controllers/speakers_spec.rb```

Command to execute the RSpec => ```rspec ./spec/controllers/speakers_spec.rb```

COVERAGE

We implemented SimpleCov, the code coverage analysis tool for Ruby. As it gitignored you can't open in your browser but you will see in our video. Code coverage is a measure which describes the degree of which the source code of the program has been tested. Better to implement this before write a code and continuously test then it will be close to 100%.

Our result: Coverage report generated for RSpec to /mnt/c/users/mykee/desktop/codeboxx/livrables/week-12/rocketelevators-ml/coverage. 348 / 641 LOC **(54.29%)** covered.


## Speech-To-Text

### The Goal 
The objective was to transcript the audio files that we used for the Speaker identification part, saved in .txt format.
We wanted to see how precise is the result of the audio files where we speak at the same time, different languages and with different accents. 

### POSTMAN tests

Here you can find our test's link, if you would like to import in Postman:

**Postman "SpeechToText" collection:**

https://www.getpostman.com/collections/77e431041852a83e2699


### EXTRA MILES

#### TRANSCRIPTION VIEW IN THE APP

Ruby file was created to view transcriptions in command line within rails app. 
The ruby test goes through but as a translation from python, it doesn't display visible results... you can upload it to show the effort made to replicate it. The file should be in the same folder as the audio files. 

Path in the Rails App => ```azure_conversation_analysis/viewtextinconsol.rb```