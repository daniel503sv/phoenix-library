defmodule Library.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :name, :string
      add :category, :string
      add :author, :string

      timestamps()
    end

  end
end
