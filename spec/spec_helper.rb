require 'saml'

RSpec::Matchers.define :match_xpath do |xpath, text|
  match do |doc|
    match = REXML::XPath.match(doc, xpath)
    not match.empty?
  end

  failure_message_for_should do |body|
    "expected to find xml tag #{xpath} in:\n#{body}"
  end

  failure_message_for_should_not do |response|
    "expected not to find xml tag #{xpath} in:\n#{body}"
  end

  description do
    "have xml tag #{xpath}"
  end
end
