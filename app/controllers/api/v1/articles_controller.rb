module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = Article.order('created_at DESC')
        render json: {status: 'SUCCESS', message: "Artykuł załadowane", data:articles}, status: :ok
      end
      def show
        article = Article.find(params[:id])
        @id = params[:id]
        render json: {status: 'SUCCESS', message: "Znalazłeś artykuł o id: #{@id}", data:article}, status: :ok
      end
      def create
        article = Article.new(article_params)
        if article.save
          render json: {status: 'SUCCESS', message: "Dodałeś pomyślnie artykuł", data:article}, status: :ok
          else render json: {status: "ERROR", message: "ERROR: Coś poszło nie tak.", data:article.errors}, status: :unprocessable_entity
        end
      end


      private

      def article_params
        params.permit(:title, :body)
      end
    end
  end
end
