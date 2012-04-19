class Object
  # taken from http://stackoverflow.com/a/1088031/317302
  # too lazy to include ActiveSupport::Inflector
  def underscore
    to_s.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end
