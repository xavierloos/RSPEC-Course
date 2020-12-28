# 'raise error' matcher check for the presence of an exception or an error
# in other words, sometimes we want to check that our program experience some kind of error and we are able to resolve something going wrong, we are able to react to something if our program doesn't go as planned
# if all of the prerequisites are not met and in that case, you want the program to fail but you want to fail in an expected manner
RSpec.describe "raise_error matcher" do
  # because x is not defained will raise a name error
  def some_method
    x
  end

  it "can check for any error" do
    expect { some_method }.to raise_error # <- this won't raise a specific error message
  end
  it "can check for a specific error" do
    #  we need to be more explicit about what it is exactly that we expect to happen
    expect { some_method }.to raise_error(NameError) # We pass as an argument the name of the error we want
    # expect { 10 / 0 }.to raise_error(NameError) # This will fail as the NameError is not the expected error
    expect { 10 / 0 }.to raise_error(ZeroDivisionError)
  end

  # Customs errors: You can defined your own custom error that simply inherit from ruby standard class and that allows you to write more descriptive errors
  #   class CustomError < StandardError
  #   end

  #   one-liner syntax
  class CustomError < StandardError; end

  it "can check for a user-created error" do
    expect { raise CustomError }.to raise_error(CustomError)
  end
end

# The Class Hierarchy
# We just made a custom exception by subclassing StandardError, which itself subclasses Exception.

# In fact, if you look at the class hierarchy of any exception in Ruby, you'll find it eventually leads back to Exception. Here, I'll prove it to you. These are most of Ruby's built-in exceptions, displayed hierarchically:
# Exception
#  - fatal
#  - NoMemoryError
#  - ScriptError
#     = LoadError
#     = NotImplementedError
#     = SyntaxError
#  - SignalException
#     = Interrupt
#  - StandardError
#     = ArgumentError
#     = IOError
#       * EOFError
#     = IndexError
#     = LocalJumpError
#     = NameError
#       * NoMethodError
#     = RangeError
#       * FloatDomainError
#     = RegexpError
#     = RuntimeError
#     = SecurityError
#     = SystemCallError
#     = SystemStackError
#     = ThreadError
#     = TypeError
#     = ZeroDivisionError
#  - SystemExit

# Source of the errors list: https://www.honeybadger.io/blog/a-beginner-s-guide-to-exceptions-in-ruby/
