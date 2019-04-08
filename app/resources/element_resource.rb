class ElementResource < JSONAPI::Resource
  attributes :title, :content, :page
  has_one :page

	filter :page
end
