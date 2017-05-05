require 'mail'
require 'yaml'
require 'hashie'

module FinClawler
  class Sendmail

    def initialize
      config = Hashie::Mash.new(YAML.load_file("./config/settings.yml"))
      @mail = Mail.new do
        from config.mail.from
        to config.mail.to
        subject config.mail.subject
      end

      @mail.delivery_method :smtp, {
        address: config.mail.server,
        port: config.mail.port.to_i,
        domain: config.mail.domain,
        user_name: config.mail.user_name,
        passwd: config.mail.passwd,
        openssl_verify_mode: 'none'
      }
    end

    def body(body = nil)
      @mail.body = body
    end

    def deliver
      @mail.deliver!
    end
  end
end

mail = FinClawler::Sendmail.new
mail.body('test')
mail.deliver
