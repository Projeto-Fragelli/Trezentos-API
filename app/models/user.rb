class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true

  # Messages to login
  def message_login_success
    return "Logado com sucesso!"
  end

  def message_login_error
    return "E-mail ou senha invalidos."
  end

  # Messages to SignUp
  def message_sign_up_success
    return "Usuário registrado com sucesso!"
  end

  def message_sign_up_already_exists
    return "Usuário ja registrado."
  end

  # Messages to delete a user
  def delete_user_success
    return "Usuário deletado com sucesso!"
  end

  def user_not_exist
    return "Usuário não encontrado."
  end

  def delete_user_error
    return "Não foi possível deletar o usuário."
  end
  
end
