class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one_attached :avatar #para trabajar con active storage

    # Validaciones
    validates :role, inclusion: { in: %w[fan g0d] }
    # Enum de roles
    enum role: {
      fan: 'fan',
      g0d: 'g0d'
    }, _default: 'fan'

    def full_name
      nombre.blank? ? email : nombre
    end

  #si se elimina usuario se eliminan sus comentarios
  has_many :comentarios, dependent: :destroy
end
