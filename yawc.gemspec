Gem::Specification.new do |s|
  s.name = 'yawc'
  s.version = '0.4.0'
  s.summary = 'Yet Another Word Counter (YAWC) makes it convenient to ' + 
      'count the number of words in a string and return the result as a ' + 
      'hash object.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/yawc.rb']
  s.add_runtime_dependency('words2dotdat', '~> 0.1', '>=0.1.1')
  s.signing_key = '../privatekeys/yawc.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/yawc'
end
