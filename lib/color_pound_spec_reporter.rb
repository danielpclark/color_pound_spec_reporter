require 'color_pound_spec_reporter/version'
require 'minitest/reporters'
require 'ansi/code'

class ColorPoundSpecReporter < Minitest::Reporters::SpecReporter
  # minitest-reporters methods for version 0.14.24
  def pass(suite, test, test_runner)
    common_print(suite, test, :green, 'PASS')
  end

  def skip(suite, test, test_runner)
    common_print(suite, test, :yellow, 'SKIP')
  end

  def failure(suite, test, test_runner)
    common_print(suite, test, :red, 'FAIL')
    print_exception(test_runner.exception, 'FAIL')
  end

  def error(suite, test, test_runner)
    common_print(suite, test, :red, 'ERROR')
    print_exception(test_runner.exception, 'ERROR')
  end

  # Just in case we load a more recent minitest-reporters v1
  def record(test)
    Minitest::Reporters::BaseReporter.instance_method(:record).bind(self).call(test)
    print_colored_status(test)
    print(" (%.2fs)" % test.time)
    print " :: #{color_pound test.name}"
    if !test.skipped? && test.failure
      print_exception(test.failure, test.error? ? 'ERROR' : '' )
    else
      puts
    end
  end

  private
  def common_print(suite, test, color, message)
    print_suite(suite) unless @suites.include?(suite)
    print( send(color) { pad_mark(message) } )
    print_time(test)
    print " :: #{color_pound test}"
    puts
  end

  def print_exception(ex, kind)
    print color_pound "\n\n"
    # print color_pound "#{ex.exception.class.to_s}: \n" 
    ex.message.each_line.with_index { |line, ind|
      line = line.gsub(/\A */, "")
      if kind.=~(/error/i) && ind.==(0)
        puts "    #{color_pound line}\n"
      else
        puts color_pound line
      end
    }
    puts
    # When e is a Minitest::UnexpectedError, the filtered backtrace is already part of the message printed out
    # by the previous line. In that case, and that case only, skip the backtrace output.
    unless ex.is_a?(MiniTest::UnexpectedError)
      trace = filter_backtrace(ex.backtrace)
      trace.each { |line| puts color_pound line.gsub(/\A */, "") }
    end
    puts
  end

  def color_pound(str)
    str.to_s.gsub(/(?<foo>(?<!:)(?:#|:)\w{1,}\??)/, ANSI::Code.yellow('\k<foo>')).
      gsub(/(?<foo>[A-Z]\S*)/, ANSI::Code.cyan('\k<foo>')).
      gsub(/(?<foo>(?:NIL|NULL|ERROR|FAIL|EXCEPTION|FALSE))/i, ANSI::Code.red('\k<foo>')).
      gsub(/(?<foo>(?:self|true))/, ANSI::Code.green('\k<foo>')).
      gsub(/(?<foo>(?:Expected|Actual):)/, ANSI::Code.bold(ANSI::Code.white('\k<foo>')))
  end

end

