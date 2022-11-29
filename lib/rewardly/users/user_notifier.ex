defmodule Rewardly.Users.UserNotifier do
  import Swoosh.Email

  alias Rewardly.Mailer

  def reward_info(user, current_user, reward_params) do
    %{"amount" => amount} = reward_params

    new()
    |> to({user.name, user.email})
    |> from({"Rewardly", "zervis@gmail.com"})
    |> subject("You got a new #{amount} reward!")
    |> html_body("<h1>Hello #{user.name} #{user.surname}</h1> You got a new #{amount} reward from #{current_user.name} #{current_user.surname}!")
    |> text_body("Hello #{user.name} #{user.surname}\n You got a new #{amount} reward from #{current_user.name} #{current_user.surname}!")
  end

  # Delivers the email using the application mailer.
  defp deliver(recipient, subject, body) do
    email =
      new()
      |> to(recipient)
      |> from({"Rewardly", "zervis@gmail.com"})
      |> subject(subject)
      |> text_body(body)

    with {:ok, _metadata} <- Mailer.deliver(email) do
      {:ok, email}
    end
  end

  @doc """
  Deliver instructions to confirm account.
  """
  def deliver_confirmation_instructions(user, url) do
    deliver(user.email, "Confirmation instructions", """

    ==============================

    Hi #{user.email},

    You can confirm your account by visiting the URL below:

    #{url}

    If you didn't create an account with us, please ignore this.

    ==============================
    """)
  end

  @doc """
  Deliver instructions to reset a user password.
  """
  def deliver_reset_password_instructions(user, url) do
    deliver(user.email, "Reset password instructions", """

    ==============================

    Hi #{user.email},

    You can reset your password by visiting the URL below:

    #{url}

    If you didn't request this change, please ignore this.

    ==============================
    """)
  end

  @doc """
  Deliver instructions to update a user email.
  """
  def deliver_update_email_instructions(user, url) do
    deliver(user.email, "Update email instructions", """

    ==============================

    Hi #{user.email},

    You can change your email by visiting the URL below:

    #{url}

    If you didn't request this change, please ignore this.

    ==============================
    """)
  end
end
