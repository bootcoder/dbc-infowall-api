require "google_drive"
require "googleauth"

class Teacher < ActiveRecord::Base

  def auth_sheets

    credentials = Google::Auth::UserRefreshCredentials.new(
      client_id: ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET'],
      scope: [
        "https://www.googleapis.com/auth/drive",
        "https://spreadsheets.google.com/feeds/",
      ],
      redirect_uri: "https://dbc-infowall.herokuapp.com/auth/google_oauth2/callback")
    p "* "  * 90
    # byebug
    auth_url = credentials.authorization_uri
  end

  def get_daily_leads

    # Creates a session. This will prompt the credential via command line for the
    # first time and save it to config.json file for later usages.
    session = GoogleDrive::Session.from_config("config.json")

    # Gets list of remote files.
    session.files.each do |file|
      p file.title
    end

    # Uploads a local file.
    session.upload_from_file("/path/to/hello.txt", "hello.txt", convert: false)

    # Downloads to a local file.
    file = session.file_by_title("hello.txt")
    file.download_to_file("/path/to/hello.txt")

    # Updates content of the remote file.
    file.update_from_file("/path/to/hello.txt")

  end
end
