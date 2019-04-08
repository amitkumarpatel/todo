A tiny RESTful Json API to parse the content found inside the tags h1, h2 and h3 and the links and store its content.

Implemented with jsonapi_resources gem (https://github.com/cerebris/jsonapi-resources)

The API must has three endpoints:
first Endpoint receives the web url that is to be parsed. 

curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"title":"Amit KUmar Patel", "weburl": "https://www.amitkumarpatel.co.in"}}}' http://lim-todo.herokuapp.com/pages 

second Endpoint parse the url and stores the content of the tags

curl -i -H "Accept: application/vnd.api+json" "http://lim-todo.herokuapp.com/pages/page_id/read_page"

To view the json response 

curl -i -H "Accept: application/vnd.api+json" "http://lim-todo.herokuapp.com/pages?include=elements"
