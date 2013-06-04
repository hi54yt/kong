require 'grape'
require 'helpers'

module Kong
  class API < Grape::API

    helpers APIHelpers

    format :json

    resource :blogs do

      resource :posts do

        desc "返回所有posts"
        get do
          authenticate!
          Post.all
        end

        desc "返回指定id的post"
        get ':id' do
          Post.find(params[:id])
        end

      end

    end
  end
end