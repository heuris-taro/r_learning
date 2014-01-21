class User < ActiveRecord::Base
  # �������O�̃��[�U���f�[�^�x�[�X��2�l���Ȃ��������؂���
  validates :name, presence: true, uniqueness: true
  # �^�C�v�����p�X���[�h�Ɍ�肪�Ȃ��������؂���
  has_secure_password
  attr_accessible :name, :password_digest, :password, :password_confirmation
end
