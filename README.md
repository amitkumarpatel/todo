A tiny RESTful Json API to parse the content found inside the tags h1, h2 and h3 and the links and store its content.

Implemented with jsonapi_resources gem (https://github.com/cerebris/jsonapi-resources)

The API has below endpoints:

First endpoint receives the web url that is to be parsed. 
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"title":"Amit KUmar Patel", "weburl": "https://www.amitkumarpatel.co.in"}}}' http://lim-todo.herokuapp.com/pages 

second endpoint parse the url and stores the content of the tags to elements table.
curl -i -H "Accept: application/vnd.api+json" "http://lim-todo.herokuapp.com/pages/page_id/read_page"

third endpoint To view the json response along with elements  (page_id id the id of the page record in database)
curl -i -H "Accept: application/vnd.api+json" "http://lim-todo.herokuapp.com/pages?include=elements"

Fourth endpint View singlr page entry (page_id id the id of the page record in database)
curl -i -H "Accept: application/vnd.api+json" "http://lim-todo.herokuapp.com/pages/page_id"

Fifth endpoint lists all elements 
curl -i -H "Accept: application/vnd.api+json"  http://lim-todo.herokuapp.com/elements

Sixth endpoint view single elements (element_id is the id of the element record in elements table)
curl -i -H "Accept: application/vnd.api+json"  http://lim-todo.herokuapp.com/elements/element_id
