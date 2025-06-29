module Api
  module V1
    class TvshowsController < ApplicationController
      def index
        json_response = Rails.cache.fetch(cache_key, expires_in: 1.hour) do
          episodes = Episode.includes(:show).page(page).per(per_page)
          episodes = apply_filters(episodes)

          {
            episodes: episodes.map { |episode| episode_json(episode) },
            meta: {
              current_page: episodes.current_page,
              total_pages: episodes.total_pages,
              total_count: episodes.total_count
            }
          }
        end

        render json: json_response, status: :ok
      end

      private

      def apply_filters(episodes)
        if params[:date_from].present? && params[:date_to].present?
          episodes = episodes.by_airstamp(params[:date_from].to_date, params[:date_to].to_date)
        end

        episodes = episodes.by_network_name(params[:network_name]) if params[:network_name].present?
        episodes = episodes.by_country_code(params[:country_code]) if params[:country_code].present?

        episodes
      end

      def cache_key
        key = Digest::MD5.hexdigest(
          [
            params[:date_from],
            params[:date_to],
            params[:network_name],
            params[:country_code],
            page,
            per_page
          ].map(&:to_s).join('-')
        )

        "tvshows/#{key}"
      end

      def episode_json(episode)
        {
          id: episode.id,
          name: episode.name,
          season: episode.season,
          number: episode.number,
          summary: episode.summary,
          runtime: episode.runtime,
          rating: episode.rating_average,
          images: {
            original: episode.image_original,
            medium: episode.image_medium
          },
          show: {
            id: episode.show_id,
            name: episode.show.name
          }
        }
      end
    end
  end
end
