defmodule Gamelists.Auth.Guardian do
  @moduledoc false
  use Guardian, otp_app: :auth_ex
  alias Gamelists.Auth

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims) do
    user =
      claims["sub"]
      |> Auth.get_user!()

    {:ok, user}
    # If something goes wrong here return {:error, reason}
  end
end
