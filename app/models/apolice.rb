class Apolice < ActiveRecord::Base

 has_many :coberturaapolices, dependent: :destroy
 has_many :servicos, dependent: :destroy

 def self.search(term, condominio, apartamento_id = 0)
      sql = sql + "lower(pe.cpf) like '%#{term.downcase}%' AND "
     self.joins(sql)
 end

end