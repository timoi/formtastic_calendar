module ElanDesign
  module Formtastic
    module Calendar
      
      protected

      # Outputs a Javascript calendar using the rails date kit
      # http://www.methods.co.nz/rails_date_kit/rails_date_kit.html
      #
      def calendar_input(method, options = {})
        format = options[:format] || I18n.t(:'date.formats.short') || '%d %b %Y'
        input_simple(:string, method, calendar_options(format, object.send(method)).merge(options))
      end

      # Generate html input options for the calendar_input
      #
      def calendar_options(format, value = nil)
        months = '[' +  I18n.t(:'date.abbr_month_names')[1..12].collect { |m| "'#{m}'" }.join(',') + ']'
        days = '[' + I18n.t(:'date.abbr_day_names').collect { |d| "'#{d}'" }.join(',') + ']'
        calendar_options = {:input_html => {:onfocus => "this.select();calendar_open(this,{format:'#{format}',images_dir:'/images',month_names:#{months},day_names:#{days}})", :onclick => "event.cancelBubble=true;this.select();calendar_open(this,{format:'#{format}',images_dir:'/images',month_names:#{months},day_names:#{days}})", :value => value}}
      end
      
    end
  end
end