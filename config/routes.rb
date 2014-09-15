Rails.application.routes.draw do
  get 'hangman/index'

  root 'hangman#index'
end
