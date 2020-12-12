module Entities
    module V1
      class UserEntity < RootEntity
        # name, email, ageのみ表示する
        expose :name, :email, :age
      end
    end
  end