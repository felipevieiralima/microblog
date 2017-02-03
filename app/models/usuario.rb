class Usuario < ApplicationRecord

  has_many :tweets
  # Include default devise modules. Others available are:

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates_presence_of  :nome

  has_attached_file :foto, styles: { medium: "300x300>", thumb: "60x160>" }, default_url: "/images/missing.jpeg"
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  has_many :relacionamentos_ativos,  class_name:  "Relacionamento",
           foreign_key: "seguidor_id",
           dependent:   :destroy
  has_many :relacionamentos_pasivos, class_name:  "Relacionamento",
           foreign_key: "seguido_id",
           dependent:   :destroy

  has_many :seguindo, through: :relacionamentos_ativos,  source: :seguido
  has_many :seguidores, through: :relacionamentos_pasivos, source: :seguidor

  scope :por_nome_ou_descricao, ->(busca) { where("nome LIKE ? or descricao LIKE ?", "#{busca}%", busca) }

  def seguir(usuario)
    seguindo << usuario
  end

  def deixar_de_seguir(usuario)
    seguindo.delete(usuario)
  end

  def seguindo?(usuario)
    seguindo.include? usuario
  end


end
