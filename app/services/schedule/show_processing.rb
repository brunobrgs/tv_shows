# frozen_string_literal: true

module Schedule::ShowProcessing
  def process_show(show_data)
    return if show_data.nil?

    show_id = show_data["id"]
    return if shows_data[show_id]

    show = sync_show(
      show_id,
      name: show_data["name"],
      summary: show_data["summary"],
      language: show_data["language"],
      status: show_data["status"],
      runtime: show_data["runtime"],
      premiered: show_data["premiered"],
      ended: show_data["ended"],
      official_site: show_data["officialSite"],
      schedule_time: show_data.dig("schedule", "time"),
      schedule_days: show_data.dig("schedule", "days") || [],
      rating_average: show_data.dig("rating", "average"),
      show_type: show_data["type"],
      genres: show_data["genres"] || [],
      image_original: show_data.dig("image", "original"),
      image_medium: show_data.dig("image", "medium"),
      network: networks_data[show_data.dig("network", "id")]
    )
    shows_data[show_id] = show
  end

  private

  def sync_show(id, attributes)
    show = Show.find_or_initialize_by(id: id)
    show.assign_attributes(attributes)
    show.save!
    show
  end
end
