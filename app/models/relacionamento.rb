class Relacionamento < ApplicationRecord


  belongs_to :seguidor, class_name: "Usuario"
  belongs_to :seguido, class_name: "Usuario"

  validates_presence_of :situacao_relacionamento, :seguidor_id, :seguido_id, :situacao_relacionamento_id

end
