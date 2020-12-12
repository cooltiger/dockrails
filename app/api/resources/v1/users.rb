module Resources
    module V1
      class Users < Grape::API
        resource :users do
          # http://localhost:3000/api/v1/users
          desc 'user list'
          params do
            # 必須項目
            optional :ids, type: Array[Integer], desc: 'user ids'
          end
          get '/' do
            # byebug
            # binding.pry
            # present User.all
            present User.where(id: params[:ids]), with: Entities::V1::UserEntity2 if params[:ids]
            present User.all, with: Entities::V1::UserEntity if params[:ids].nil?
          end
  
          # http://localhost:3000/api/v1/users/{:id}
          desc 'user'
          # パラメータ設定
          params do
            # 必須項目
            requires :id, type: Integer, desc: 'user id'
          end
          get ':id' do
            # present User.find(params[:id])
            present User.find(params[:id]), with: Entities::V1::UserEntity
          end

        end
      end
    end
  end