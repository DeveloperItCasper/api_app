module Api
  module V1
    class ContentsController < ApiController
      respond_to :json


      api :GET, '/contents', 'List the urls and content stored in the database'
      formats ['json']
      example <<EOS
        api/v1/contents

        Response:
{
  "contents": [
    {
      "id": 1,
      "url": "http://www.hrpro.co.nz",
      "headers": [
        "You have very useful features like:",
        "Register a new account now",
        "Our goal",
        "Monthly Newsletter",
        "Contact Us"
      ],
      "links": [
        "/faq",
        "#",
        "/",
        "#",
        "#",
        "#",
        "#",
        "#",
        "#",
        "#",
        "#",
        "#",
        "#",
        "#",
        "#",
        "/cdn-cgi/l/email-protection#8ae4e3e9e1cae3fee9ebf9faeff8a4e9e5e7",
        "#",
        "#",
        "/"
      ],
      "created_at": "2016-08-08T09:08:21.426Z",
      "updated_at": "2016-08-08T09:08:21.426Z"
    },
    {
      "id": 2,
      "url": "http://www.google.com",
      "headers": [],
      "links": [
        "http://www.google.co.nz/imghp?hl=en&tab=wi",
        "http://maps.google.co.nz/maps?hl=en&tab=wl",
        "https://play.google.com/?hl=en&tab=w8",
        "http://www.youtube.com/?gl=NZ&tab=w1",
        "http://news.google.co.nz/nwshp?hl=en&tab=wn",
        "https://mail.google.com/mail/?tab=wm",
        "https://drive.google.com/?tab=wo",
        "https://www.google.co.nz/intl/en/options/",
        "http://www.google.co.nz/history/optout?hl=en",
        "/preferences?hl=en",
        "https://accounts.google.com/ServiceLogin?hl=en&passive=true&continue=http://www.google.co.nz/%3Fgfe_rd%3Dcr%26ei%3DyEyoV9i3H8vN8gfQiZPYDQ",
        "/search?site=&ie=UTF-8&q=Olympics&oi=ddle&ct=2016-doodle-fruit-games-day-4-5657433650233344-hp&hl=en&sa=X&ved=0ahUKEwj5wYHtvLHOAhWDF5QKHZuwADAQPQgD",
        "/advanced_search?hl=en-NZ&authuser=0",
        "/language_tools?hl=en-NZ&authuser=0",
        "http://www.google.co.nz/setprefs?sig=0_LTGfNEoCFgB9iA8wirCwWy9eA64%3D&hl=mi&source=homepage",
        "/intl/en/ads/",
        "/services/",
        "/intl/en/about.html",
        "http://www.google.co.nz/setprefdomain?prefdom=US&sig=__ohcQFxbE90biPddDoY7EwjuuwDE%3D",
        "/intl/en/policies/privacy/",
        "/intl/en/policies/terms/"
      ],
      "created_at": "2016-08-08T09:11:36.741Z",
      "updated_at": "2016-08-08T09:11:36.741Z"
    }
  ]
}

EOS
      def index
        @contents = Content.all
      end

      api :POST, '/contents', 'Grab and store content'
      formats ['json']
      param :content, Hash, required: true do
        param :url, String, required: true, desc: 'Url string. Example: http://www.google.com'
      end
      example <<EOS
      api/v1/contents
      Params:
        {"content": {
            "url": "http://www.google.com"
          }
        }

      Response:

        {
          "id": 2,
          "url": "http://www.google.com",
          "headers": [],
          "links": [
            "http://www.google.co.nz/imghp?hl=en&tab=wi",
            "http://maps.google.co.nz/maps?hl=en&tab=wl",
            "https://play.google.com/?hl=en&tab=w8",
            "http://www.youtube.com/?gl=NZ&tab=w1",
            "http://news.google.co.nz/nwshp?hl=en&tab=wn",
            "https://mail.google.com/mail/?tab=wm",
            "https://drive.google.com/?tab=wo",
            "https://www.google.co.nz/intl/en/options/",
            "http://www.google.co.nz/history/optout?hl=en",
            "/preferences?hl=en",
            "https://accounts.google.com/ServiceLogin?hl=en&passive=true&continue=http://www.google.co.nz/%3Fgfe_rd%3Dcr%26ei%3DyEyoV9i3H8vN8gfQiZPYDQ",
            "/search?site=&ie=UTF-8&q=Olympics&oi=ddle&ct=2016-doodle-fruit-games-day-4-5657433650233344-hp&hl=en&sa=X&ved=0ahUKEwj5wYHtvLHOAhWDF5QKHZuwADAQPQgD",
            "/advanced_search?hl=en-NZ&authuser=0",
            "/language_tools?hl=en-NZ&authuser=0",
            "http://www.google.co.nz/setprefs?sig=0_LTGfNEoCFgB9iA8wirCwWy9eA64%3D&hl=mi&source=homepage",
            "/intl/en/ads/",
            "/services/",
            "/intl/en/about.html",
            "http://www.google.co.nz/setprefdomain?prefdom=US&sig=__ohcQFxbE90biPddDoY7EwjuuwDE%3D",
            "/intl/en/policies/privacy/",
            "/intl/en/policies/terms/"
          ],
          "created_at": "2016-08-08T09:11:36.741Z",
          "updated_at": "2016-08-08T09:11:36.741Z"
        }
EOS
      def create
        render json: {error: 'Url params can not be blank'}, status: 402 and return if content_params.blank?
        @content = Content.new(content_params)
        if @content.import
          render json: @content, status: 200
        else
          render json: @content.errors, status: 402
        end
      end

      private

      def content_params
        params.require(:content).permit(:url)
      end
    end
  end
end

