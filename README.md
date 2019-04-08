A tiny RESTful Json API to parse the content of a web url,search h1, h2 and h3 and the links tags and store its content.

Implemented with jsonapi_resources gem (https://github.com/cerebris/jsonapi-resources)

The API has below endpoints:

First endpoint lists stored web urls and web url along with elements.

curl -i -H "Accept: application/vnd.api+json" "http://lim-todo.herokuapp.com/pages"
curl -i -H "Accept: application/vnd.api+json" "http://lim-todo.herokuapp.com/pages?include=elements"

Second endpoint creates a record that stores the web url in datbase that is to be parsed.

curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"title":"Amit KUmar Patel", "weburl": "https://www.amitkumarpatel.co.in"}}}' http://lim-todo.herokuapp.com/pages 

Third endpoint parse the web url and stores the content of the tags to elements table. (page_id id the id of the page record in database)

curl -i -H "Accept: application/vnd.api+json" "http://lim-todo.herokuapp.com/pages/page_id/read_page"

Fourth endpint To view single page entry. (page_id id the id of the page record in database)

curl -i -H "Accept: application/vnd.api+json" "http://lim-todo.herokuapp.com/pages/page_id"

Fifth endpoint lists all elements. 

curl -i -H "Accept: application/vnd.api+json"  http://lim-todo.herokuapp.com/elements

Sixth endpoint view single elements. (element_id is the id of the element record in elements table)

curl -i -H "Accept: application/vnd.api+json"  http://lim-todo.herokuapp.com/elements/element_id
