require_relative "kreuz_o_mat/data"
module KreuzOMat
  def self.data
    KreuzOMat::Data.instance
  end
end
