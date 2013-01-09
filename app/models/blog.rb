class Blog
  attr_reader :entries
  attr_writer :post_source

  def initialize
    @entries = []
  end

  def new_post
    post_source.call.tap do |p|
      p.blog = self
    end
  end

  def title
    "Watching Paint Dry"
  end
  def subtitle
    "The trusted source for drying paint news & opinion"
  end

  private
  def post_source
    @post_source ||= Post.public_method(:new)
  end
end

# public_method instantiates a call-able Method object
# during normal operation, Blog will use this method reference
# (the equivalent of calling Post.new)
# But, we can subtitute any call-able object when testing the class