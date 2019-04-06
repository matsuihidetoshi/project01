Rails.application.routes.draw do
  get 'statics/index'

  root to: 'statics#index'
end
