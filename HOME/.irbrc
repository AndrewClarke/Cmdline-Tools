
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT_MODE] = false

require 'rubygems'
## require 'ruby-debug'

if ENV['RAILS_ENV'] == 'development' && ENV['GEM_HOME']
  require 'rubygems'

  $:.unshift "#{ENV['GEM_HOME']}/gems/hirb-0.7.1/lib"
  require 'hirb'
  require 'active_record'
  extend Hirb::Console
  Hirb.enable


  $_irb_projections = Hash.new
  def proj obj, *fields
    # Convert a plain hash to a format that looks like one row.
    # HMMM - the Hirb doco DOES mention designing your own formatters -
    # must look into it!
    #
    case obj.class
      when Hash then obj = [ obj ]
    end

    # pass nil if you wanna remove the stored fields for a type
    reset = false
    if fields.length == 1 && fields[0].nil?
      fields = []
      reset = true
    end

    # WHAT was I thinking with this???
    xobj = obj.is_a?(Array) && obj.any? ? obj[0] : obj
    # until further notice... this!
    xobj = obj

    if xobj.is_a? ActiveRecord::Base
      if fields.length > 0 || reset
        $_irb_projections[xobj.class.name] = fields
      else
        fields = $_irb_projections[xobj.class.name]
      end
    end

    if fields.length == 0
      table obj
    else
      table obj, :fields => fields
    end
  end
end

