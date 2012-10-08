require 'faraday-webmachine'

describe "testing a 'Hello, World!' Webmachine application" do
  let(:faraday) do
    Faraday.new do |conn|
      conn.adapter :webmachine, webmachine_app
    end
  end
  let(:webmachine_app) do
    Webmachine::Application.new do |app|
      app.routes do
        hello_resource = Class.new(Webmachine::Resource) do
          def to_html
            'Hello, world!'
          end
        end
        howdy_resource = Class.new(Webmachine::Resource) do
          def to_html
            "Howdy, y'all!"
          end
        end
        echo_resource = Class.new(Webmachine::Resource) do
          def allowed_methods
            %w[POST]
          end
          def process_post
            response.headers.merge!(request.headers)
            response.body = request.body
            200
          end
        end

        add ['hello'], hello_resource
        add ['howdy'], howdy_resource
        add ['echo'], echo_resource
      end
    end
  end

  it "greets" do
    response = faraday.get '/hello'
    expect(response.body).to eq('Hello, world!')
  end

  it "greets in dialect" do
    response = faraday.get '/howdy'
    expect(response.body).to eq("Howdy, y'all!")
  end

  it "echoes a POST" do
    response = faraday.post '/echo', 'Sam', { "Foo" => "Bar" }
    expect(response.code).to eq(200)
    expect(response.body).to eq('Sam')
    expect(response.headers["Foo"]).to eq("Bar")
  end
end
