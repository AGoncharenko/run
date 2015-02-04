class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  before_create :generate_slug

  private
  def generate_slug
    string_length = 10
    query_string = rand(36**string_length).to_s(36)
    if self.present?
      while Trip.where(slug: query_string).present?
        string_length += 1
        query_string = rand(36**string_length).to_s(36)
      end
    end

    self.slug = query_string
  end
end
