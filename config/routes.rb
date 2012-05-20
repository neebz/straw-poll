SurveyApp::Application.routes.draw do
  
  get "poll/index"
  root to: "poll#index"

  post "poll/vote"

end
