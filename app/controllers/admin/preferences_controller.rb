class Admin::PreferencesController < ApplicationController
    def index
        @preference = Preference.last
    end
end