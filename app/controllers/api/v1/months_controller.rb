module Api
    module V1
        class MonthsCroller < ApplicationController
            def index
                @months = Month.all
                render json: {status: 'SUCCESS', data: @months}, status: :ok
            end
        end
    end
end