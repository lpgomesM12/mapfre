class Apolice < ActiveRecord::Base



 def self.search(term, condominio, apartamento_id = 0)
      sql = sql + "lower(pe.cpf) like '%#{term.downcase}%' AND "
     self.joins(sql)
 end

end
