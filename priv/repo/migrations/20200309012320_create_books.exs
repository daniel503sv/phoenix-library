defmodule Library.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :edition, :text
      add :summary, :text

      timestamps()
    end

  end
end
