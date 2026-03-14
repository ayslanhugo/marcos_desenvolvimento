Rails.application.routes.draw do
  get "errors/not_found"
  get "errors/internal_server_error"
  get "learn/index"
  get "support/index"
  # Página inicial
  root to: "home#index"
  get "entenda_os_marcos", to: "learn#index", as: :learn
  get "apoio", to: "support#index", as: :support
  get "faq", to: "learn#faq", as: :faq
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # Autenticação
  devise_for :users
  # Rotas para páginas de erro personalizadas
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  # Rotas das Crianças e seus Progressos (Aninhadas)
  resources :children do
    resources :progresses, only: [ :create ]
  end

  # Verificação de saúde do sistema
  get "up" => "rails/health#show", as: :rails_health_check
end
