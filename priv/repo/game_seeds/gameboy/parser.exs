games_file = "priv/repo/game_seeds/gameboy/games.csv"

parse_date = fn date_str ->
  <<month_a, month_b, _, <<day_a, day_b>>, _, year::binary>> = date_str
  "#{year}-#{[month_a, month_b]}-#{[day_a, day_b]}" |> Date.from_iso8601!()
end

games_file
|> File.read!()
|> String.split("\n")
|> Enum.map(fn line ->
  system = "gameboy"
  case String.split(line, ",") do
    [name_part, sub_part, pub, date, _system] ->
      real_name =
        (String.trim_trailing(sub_part, "\"") <> " " <> String.trim_leading(name_part, "\""))
        |> String.trim()

      real_date = parse_date.(date)

      %Gamelists.Games.Game{name: real_name, publisher: pub, release_date: real_date, system: system}
      |> Gamelists.Repo.insert!()

    [name, pub, date, _system] ->
      real_date = parse_date.(date)

      %Gamelists.Games.Game{
        name: String.trim(name),
        publisher: pub,
        release_date: real_date,
        system: system
      }
      |> Gamelists.Repo.insert!()

    [""] ->
      nil
  end
end)
|> Enum.filter(fn uh -> uh end)
