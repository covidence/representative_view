require 'action_view'
require 'minstrel'
require 'representative_view'
require 'rspec'

require 'pathname'
require 'fixtures/books'

$tmp_dir = Pathname(__FILE__).parent.parent + "tmp"
$template_dir = $tmp_dir + "templates"
    
module Fixtures
  
  def write_template(name, content)
    template_path = $template_dir + name
    template_path.parent.mkpath
    template_path.open("w") do |io|
      io << content
    end
  end
  
end

Rspec.configure do |config|
  
  config.mock_with :rr
  config.include(Fixtures)
  
  config.before do
    $template_dir.mkpath
  end

  config.after do
    $tmp_dir.rmtree if $tmp_dir.exist?
  end

end

def undent(raw)
  if raw =~ /\A( +)/
    indent = $1
    raw.gsub(/^#{indent}/, '').gsub(/ +$/, '')
  else
    raw
  end
end
