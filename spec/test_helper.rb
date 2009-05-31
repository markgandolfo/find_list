# Inspiration gained from Thinking Sphinx's test suite.
# Pat Allan is a genius.

class TestHelper
  attr_accessor :host, :username, :password
  attr_reader   :path
  
  def initialize
    @host     = "localhost"
    @username = "root"
    @password = ""

    @path = File.expand_path(File.dirname(__FILE__))
  end
  
  def setup_mysql
    ActiveRecord::Base.establish_connection(
      :adapter  => 'mysql',
      :database => 'find_list',
      :username => @username,
      :password => @password,
      :host     => @host
    )
    ActiveRecord::Base.logger = Logger.new(File.open("tmp/activerecord.log", "a"))
    
    structure = File.open("spec/fixtures/structure.sql") { |f| f.read.chomp }
    structure.split(';').each { |table|
      ActiveRecord::Base.connection.execute table
    }
    Post.delete_all
    for month in 1..12
      Post.create(:title => Date::MONTHNAMES[month], :text => "testing", :created_at => Time.local(Time.now.year, month, 1))
    end
  end
  
end
