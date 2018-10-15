require 'zip'

module Diplomas
  class Zipping
    attr_reader :folder_name, :url

    def initialize(folder_name)
      @folder_name = folder_name.to_s
      @url = "uploads/#{folder_name}/diplomas.zip"
    end

    def call
      unless File.exist?(zip_filename)
        Zip::File.open(zip_filename, Zip::File::CREATE) do |zip_file|
          input_files.each do |entry, src_path|
            zip_file.add(entry, src_path)
          end
        end
      end

      self
    end

    private

    def input_files
      Hash[input_filenames.zip(input_filepaths)]
    end

    def input_filepaths
      Dir[uploads_folder.to_s + '/*.pdf']
    end

    def input_filenames
      Dir.entries(uploads_folder).select { |f| File.extname(f) == '.pdf' }
    end

    def zip_filename
      uploads_folder.to_s + '/diplomas.zip'
    end

    def uploads_folder
      Rails.root.join('public', 'uploads', folder_name)
    end
  end
end