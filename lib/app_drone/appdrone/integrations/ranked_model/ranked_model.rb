class RankedModel < Integration
  def align
    (self >> Gems).add 'ranked_model'
  end
end
