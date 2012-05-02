module AppDrone
class LetterOpener < Drone
  desc "Preview mail in the browser instead of sending it"
  category :dev

  depends_on :bundle

  def align
    bundle.add 'letter_opener', group: :development
  end

  def execute
    do! :development_delivery_method
  end

end
end
