$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'assertor'

def make_unnamed_case
  Class.new Assertor::Case
end

def make_named_case(context, name)
  c = make_unnamed_case
  context.class.const_set(name, c)
  c
end

def make_named_and_ignored_case(context, name)
  c = make_named_case(context, name)
  Assertor::Case.ignore c
  c
end
