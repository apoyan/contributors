module Diplomas
  class Contributor
    include Prawn::View
    attr_reader :name, :id, :url

    def initialize(id, name)
      @id   = id
      @name = name
      @url  = "uploads/#{id}/#{name}.pdf"
    end

    def call
      title
      body
      save

      self
    end

    private

    def save
      File.open(dir_path.join("#{name}.pdf"), 'wb') { |f| document.render(f) }
    end

    def dir_path
      dir = Rails.root.join('public', 'uploads', id.to_s)
      FileUtils.mkdir_p(dir) unless Dir.exist?(dir)

      dir
    end

    def title
      move_down 100
      text 'PDF', align: :center, size: 40
    end

    def body
      move_down 30
      text "The award goes to", align: :center, size: 30
      move_down 20
      text name, align: :center, size: 30
    end
  end
end
