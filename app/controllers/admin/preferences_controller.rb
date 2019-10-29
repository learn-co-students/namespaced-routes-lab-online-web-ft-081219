class Admin::PreferencesController < ApplicationController
    def index
        @preference = Preference.last
    end

    def new
        @preference = Preference.new
    end

    def create
        Preference.destroy_all
        @preference = Preference.create(preference_params)
        redirect_to admin_preferences_path
    end

    private

    def preference_params
        params.require(:preference).permit(:allow_create_songs, :allow_create_artists, :song_sort_order, :artist_sort_order)
    end
end