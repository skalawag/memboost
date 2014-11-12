Fabricator(:card) do
  front { Faker::Lorem.word }
  back { Faker::Lorem.words(3).join(" ") }
  learning_stage { "unfamiliar" }
  attempts { 0 }
end
