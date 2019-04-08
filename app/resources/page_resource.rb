class PageResource < JSONAPI::Resource
  attributes :weburl, :title
  has_many :elements

end
