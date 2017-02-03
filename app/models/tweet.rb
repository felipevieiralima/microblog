class Tweet < ApplicationRecord

  belongs_to :usuario

  validates_presence_of :title, :content
  validates :content, length: { maximum: 140,
                               too_long: "- Máximo de %{count} caracteres permitidos" }

  scope :por_usuarios, ->(usuarios_ids) { where(usuario_id: usuarios_ids) }


end
