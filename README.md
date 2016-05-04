# Introducing the Yawc gem

    require 'yawc'

    s = '

    Rubbish in, rubbish out. Test123 123 test @dfgf test rest

    Mary had a little lamb,
    His fleece was white as snow,
    And everywhere that Mary went,
    The lamb was sure to go.

    He followed her to school one day,
    Which was against the rule,
    It made the children laugh and play
    To see a lamb at school.

    And so the teacher turned it out,
    But still it lingered near,
    And waited patiently about,
    Till Mary did appear.

    "Why does the lamb love Mary so?"
    The eager children cry.
    "Why, Mary loves the lamb, you know,"
    The teacher did reply
    '

    h = Yawc.new(s).to_h

    #=> {"mary"=>5, "lamb"=>5, "was"=>3, "rubbish"=>2, "out"=>2, "test"=>2, ...

## Resources

* yawc https://rubygems.org/gems/yawc

yawc gem wordcount
