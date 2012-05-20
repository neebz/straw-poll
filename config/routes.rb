SurveyApp::Application.routes.draw do
  
  get "poll/index"
  get "poll/", to: "poll#index"

  post "poll/vote"

  get "poll/results"


end
