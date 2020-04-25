defmodule Library2.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :biography, :text
      add :birthdate, :date

      timestamps()
    end

  end
end
