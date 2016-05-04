Gem::Specification.new do |s|
  s.name = 'yawc'
  s.version = '0.1.0'
  s.summary = 'Yet Another Word Counter (YAWC) makes it convenient to count 
  the number of words in a string and return the result as a hash object.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/yawc.rb']
  s.signing_key = '../privatekeys/yawc.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/yawc'
end
