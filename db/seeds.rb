# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Document.find_or_create_by(title: "Cloud.gov LATO CRM", description: "OSCAL 1.1.2 Component Definition defining the CRM for a cloud.gov-hosted system persuing a GSA LATO", url: "https://raw.githubusercontent.com/GSA-TTS/docker-trestle/main/templates/component-definitions/cloud_gov/component-definition.json")
