[![Build Status](https://secure.travis-ci.org/kjellm/saml.png)](http://travis-ci.org/kjellm/saml)

SAML implementation for Ruby
============================

SAML - Security Assertion Markup Language


Conformance
-----------

The library is written with the intention that it can be used for
implementing both SAML Identity Providers (IdP) and Service Providers
(SP).

So far I have only implemented what's needed for the feide gem. The
feide gem is a gem for creating SPs that can talk with the Norwegian
FEIDE IdP.


Install
-------

gem install saml


Usage
-----

For an example of how it can be used, take a look at the feide gem
hosted at github https://github.com/kjellm/feide.


Documents describing SAML
-------------------------

# Technical overview

Read this first:

http://www.oasis-open.org/committees/download.php/27819/sstc-saml-tech-overview-2.0-cd-02.pdf

# The specification

Located at http://docs.oasis-open.org/security/saml/v2.0/

* http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf
* http://docs.oasis-open.org/security/saml/v2.0/saml-profiles-2.0-os.pdf
* http://docs.oasis-open.org/security/saml/v2.0/saml-metadata-2.0-os.pdf
* http://docs.oasis-open.org/security/saml/v2.0/saml-bindings-2.0-os.pdf


Author
------

Kjell-Magne Øierud <kjellm AT oierud DOT net>


Bugs
----

Report bugs to http://github.com/kjellm/saml/issues


License
-------

(The MIT License)

Copyright © 2012 Gyldendal ASA

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the ‘Software’), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial
portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
