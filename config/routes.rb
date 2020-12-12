Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 重要： '/api'設定すると失敗
  mount API => '/'
  # mount GrapeSwaggerRails::Engine => '/docs' if defined? GrapeSwaggerRails
  
  SwaggerUiEngine
  # 省略
  mount SwaggerUiEngine::Engine, at: '/v1/docs'
end
