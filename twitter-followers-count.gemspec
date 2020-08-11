require_relative 'lib/twitter_followers_count/version'

Gem::Specification.new do |spec|
  spec.name          = 'twitter-followers-count'
  spec.version       = TwitterFollowersCount::VERSION
  spec.authors       = ['ryoma123']
  spec.email         = ['ryoma.ono.2661@gmail.com']

  spec.summary       = 'Get the count of followers from the Twitter URLs.'
  spec.description   = 'Get the count of followers from the Twitter URLs.'
  spec.homepage      = 'https://github.com/ryoma123/twitter-followers-count'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = ''

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/ryoma123/twitter-followers-count'
  spec.metadata['changelog_uri'] = 'https://github.com/ryoma123/twitter-followers-count/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'dotenv-rails'
  spec.add_dependency 'twitter'
  spec.add_development_dependency 'rubocop'
end
