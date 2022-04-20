class ExceptionPage
  {% begin %}
    VERSION = {{ `shards version "#{__DIR__}"`.chomp.stringify.downcase }}
  {% end %}
end
