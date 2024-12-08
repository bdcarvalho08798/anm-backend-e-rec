# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Directorate.create(dircode: 'NA',dirname: ' Not Applicable') # 1
# Directorate.create(dircode: 'DGT',dirname: '  Direção Nacional de Contabilidade e Normalização Contabilística') # 2

# Natdirectorate.create(natdircode: 'NA',natdirname: ' Not Applicable',  directorate_id: 1) # 1
# Natdirectorate.create(natdircode: 'DNCNC', natdirname: ' Direção Nacional de Contabilidade e Normalização Contabilística', directorate_id: 2) # 2
# Natdirectorate.create(natdircode: 'DNGTDP', natdirname: 'Direção Nacional de Gestão da Tesouraria e da Dívida Pública', directorate_id: 2) # 3 
# Natdirectorate.create(natdircode: 'DNMDF', natdirname: 'Direção Nacional de Monitorização da Descentralização Financeira', directorate_id: 2) #
# Natdirectorate.create(natdircode: 'DNPADE', natdirname: 'Direção Nacional de Pagamentos e Administração da Dotação Geral do Estado', directorate_id: 2)

# Department.create(depcode: 'DCP', depname: 'Departamento de Contabilidade Pública', directorate_id: 2, natdirectorate_id: 2  )
# Department.create(depcode: 'DGPP', depname: 'Departamento de Gestão de Participações Públicas', directorate_id: 2, natdirectorate_id: 2  )
# Department.create(depcode: 'DNC', depname: 'Departamento de Normalização Contabilística.', directorate_id: 2, natdirectorate_id: 2  )
# Department.create(depcode: 'DGDP', depname: 'Departamento de Gestão da Dívida Pública', directorate_id: 2, natdirectorate_id: 3  )
# Department.create(depcode: 'DGTE', depname: 'Departamento de Gestão da Tesouraria do Estado', directorate_id: 2, natdirectorate_id: 3  )
# Department.create(depcode: 'DDC', depname: 'Departamento de Descentralização Contabilística', directorate_id: 2, natdirectorate_id: 3  )
# Department.create(depcode: 'DDO', depname: 'Departamento de Descentralização Operacional', directorate_id: 2, natdirectorate_id: 4  )
# Department.create(depcode: 'DSDGE', depname: 'Departamento de Administração da Dotação Geral do Estado', directorate_id: 2, natdirectorate_id: 4 )
# Department.create(depcode: 'DMP', depname: 'Departamento de Monitorização de Pagamentos', directorate_id: 2, natdirectorate_id: 5 )
# Department.create(depcode: 'DPP', depname: 'Departamento de Processamento de Pagamentos', directorate_id: 2, natdirectorate_id: 5 )

Directorate.create(dircode: 'NA', dirname: 'Not Applicable', unit: false)
Natdirectorate.create(natdircode: 'NA', natdirname: 'Not Applicable', directorate_id: 1)
Department.create(depcode: 'NA', depname: 'Not Applicable',natdirectorate_id: 1 , directorate_id: 1)
User.create(email: 'admin@admin.com', password: 'admin', username: 'bdcarvalho', role: 'admin',  directorate_id: 1, natdirectorate_id: 1, department_id: 1)

