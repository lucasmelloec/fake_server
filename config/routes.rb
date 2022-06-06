Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope :config do
    get '/', to: redirect('/config/domains')

    resources :domains do
      resources :expectations do
        resources :responses
      end
    end
  end

  # Defines the root path route ("/")
  root to: redirect('/config')

  match '*path', to: 'default#all', via: :all
end
