
if ENV['RAILS_ENV']
  require 'rubygems'

  $:.unshift '/home/aclarke/.rvm/gems/ree-1.8.7-2012.02@tod/gems/hirb-0.7.1/lib'
  require 'hirb'
  require 'active_record'
  extend Hirb::Console
  Hirb.enable


  @@projs = Hash.new
  def proj obj, *fields
    # Convert a plain hash to a format that looks like one row.
    # HMMM - the Hirb doco DOES mention designing your own formatters -
    # must look into it!
    #
    case obj.class
      when Hash : obj = [ obj ]
    end

    # pass nil if you wanna remove the stored fields for a type
    reset = false
    if fields.length == 1 && fields[0].nil?
      fields = []
      reset = true
    end

    xobj = obj.is_a?(Array) && obj.any? ? obj[0] : obj

    if xobj.is_a? ActiveRecord::Base
      if fields.length > 0 || reset
        @@projs[xobj.class.name] = fields
      else
        fields = @@projs[xobj.class.name]
      end
    end

    if fields.length == 0
      table obj
    else
      table obj, :fields => fields
    end
  end
end
