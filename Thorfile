class NewAi < Thor::Group
  include Thor::Actions

  argument :name

  def self.source_root
    File.dirname(__FILE__)
  end

  def create_new_ai
    template('players/template.rb.erb', "players/#{name}.rb")
  end

  private

  def class_style_name
    name.split('_').map(&:capitalize).join
  end
end
