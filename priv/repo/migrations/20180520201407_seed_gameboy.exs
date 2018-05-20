defmodule Gamelists.Repo.Migrations.SeedGameboy do
  use Ecto.Migration

  def up do
    game_seeds_dir = "#{:code.priv_dir(:gamelists)}/repo/game_seeds"
    game_seeds_dir
    |> File.ls!()
    |> Enum.each(fn(console) ->
      parser_file = "#{game_seeds_dir}/#{console}/parser.exs"
      case File.exists?(parser_file) do
        true ->
          Mix.shell.info "Seeding #{console}!"
          Code.eval_file(parser_file)
        false -> Mix.raise "No parser for #{console}!"
      end
    end)
  end

  def down do
    drop table(:games)
  end
end
