module Resources
    module V1
      class Root < Grape::API
        version 'v1'
        format :json
        content_type :json, 'application/json'
  
        # app/api/resources/v1/users.rbをマウント
        mount Resources::V1::Users

        Rails.logger.debug("e.to_json")

        rescue_from Grape::Exceptions::ValidationErrors do |e|
          Rails.logger.debug(e.to_json)
        end
        # swaggerの設定
        #if defined? GrapeSwaggerRails
        #  add_swagger_documentation(
        #    markdown: GrapeSwagger::Markdown::RedcarpetAdapter.new(render_options: { highlighter: :rouge }),
        #    api_version: 'v1',
        #    base_path: '',
        #    hide_documentation_path: true,
        #    hide_format: true)
        #end

        # V1::Rootの末尾に追記
        add_swagger_documentation(
          doc_version: '1.0.0',
            info: {
              title: 'grape-on-rails-api',
              description: 'grape-on-rails-apiのAPIドキュメント'
          }
        )

      end
    end
  end