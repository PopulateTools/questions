class DeckBuilder
  def deck(&block)
    instance_eval(&block)
  end

  def create_deck(&block)
    @deck = Deck.new
    yield
    @deck.save!
  end

  def deck_name(name)
    @deck.name = name
  end

  def deck_description(description)
    @deck.description = description
  end

  def deck_slug(slug)
    @deck.slug = slug
  end

  def create_question(&block)
    @question = @deck.questions.new
    yield
    @question.save!
  end

  def title(title)
    @question.title = title
  end

  def body(body)
    @question.body = body
  end

  def options(*options)
    options.each_with_index do |option, i|
      @question.options.build value: option, position: i
    end
  end

end
