class StaticController < ApplicationController


 def home

    @aditivos = Apolice.where("page = 'aditivo'")

    @apolices = Apolice.where("page IS NULL and (ramo IS NOT NULL and produto IS NOT NULL and apolice IS NOT NULL)")
 end

end
