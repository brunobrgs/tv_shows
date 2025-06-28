module Schedule::EpisodeProcessing
  def process_episode(episode_data)
    return if episode_data.nil?

    show_id = episode_data["show"]["id"]
    return if show_id.nil?

    episode_id = episode_data["id"]
    return if episodes_data.key?(episode_id)

    episode = sync_episode(
      id: episode_id,
      name: episode_data["name"],
      season: episode_data["season"],
      number: episode_data["number"],
      summary: episode_data["summary"],
      runtime: episode_data["runtime"],
      image_original: episode_data.dig("image", "original"),
      image_medium: episode_data.dig("image", "medium"),
      url: episode_data["url"],
      rating_average: episode_data.dig("rating", "average"),
      show_id: show_id
    )
    episodes_data[episode_id] = episode
  end

  private

  def sync_episode(attributes)
    episode = Episode.find_or_initialize_by(id: attributes[:id])
    episode.assign_attributes(attributes)
    episode.save!
    episode
  end
end
