require 'ostruct'
require 'json'

class KreuzOMat::Card < OpenStruct
  def self.all
    KreuzOMat.data.cards.map { |card| new(card) }
  end

  def statements
    super.map { |s| Statement.new(s) }
  end

  class Statement < OpenStruct
    def name
      id
    end

    def to_json
      @table.to_json
    end

    def label
      "aslfdkj"
    end
  end
end
