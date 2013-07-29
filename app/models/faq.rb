require 'ostruct'
require 'json'

class KreuzOMat::Faq < OpenStruct

  def self.all
    KreuzOMat.data.faq.map { |faq| new(faq) }
  end

end
