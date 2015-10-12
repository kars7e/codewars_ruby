# Ruby’s Eleven 
# Problem URL: http://www.codewars.com/kata/rubys-eleven/ruby 
# Short desc: Find a bug in ruby code and abuse it to override admin's password

module Frontend

  def given_credentials
    pass = 'yoAQNi6fKeC9I'
    pass.instance_eval do 
      def crypt(*args)
        'yoAQNi6fKeC9I'
      end
    end
    sc = SecureCredentials.new('admin',  pass)
    sc.instance_eval do 
      def eql?(a)
        a.password = 'h4xx0r3d'.crypt('you_cannot_break_this')
      end
    end
    sc
  end
end
