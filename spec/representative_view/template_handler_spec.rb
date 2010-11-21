require 'spec_helper'

describe "a Representative template" do

  def render(file, format = :xml)
    @base = ActionView::Base.new(template_path, {:books => Books.all})
    @base.lookup_context.freeze_formats([format])
    @base.render(:file => file)
  end

  it "can generate XML" do
    render("books-r", :xml).should == undent(<<-XML)
      <?xml version="1.0"?>
      <books type="array">
        <book>
          <title>Sailing for old dogs</title>
        </book>
        <book>
          <title>On the horizon</title>
        </book>
        <book>
          <title>The Little Blue Book of VHS Programming</title>
        </book>
      </books>
    XML
  end

  it "can generate JSON" do
    render("books-r", :json).should == undent(<<-XML)
      [
        {
          "title": "Sailing for old dogs"
        },
        {
          "title": "On the horizon"
        },
        {
          "title": "The Little Blue Book of VHS Programming"
        }
      ]
    XML
  end

end