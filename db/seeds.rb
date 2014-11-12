# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = Fabricate(:user, username: "Test User", email: "test@test.com", password: "test")

greek = Fabricate(:pack, name: "Ancient Greek Vocabulary")
history = Fabricate(:pack, name: "U.S. History")
rails = Fabricate(:pack, name: "Ruby on Rails")

user.packs << greek
user.packs << history
user.packs << rails

greek.cards << Fabricate(:card, front: "κακός", back: "bad, ugly")
greek.cards << Fabricate(:card, front: "βασιλεύς", back: "king, chief")
greek.cards << Fabricate(:card, front: "διδάσκαλος", back: "teacher, master")
greek.cards << Fabricate(:card, front: "ἐναντίος", back: "opposite")
greek.cards << Fabricate(:card, front: "ἰατρός", back: "one who heals, physician")
greek.cards << Fabricate(:card, front: "καλός", back: "beautiful, good")
greek.cards << Fabricate(:card, front: "κέρδος", back: "gain, profit")
greek.cards << Fabricate(:card, front: "λόγος", back: "word, reason, account")
greek.cards << Fabricate(:card, front: "παῖς", back: "child")
greek.cards << Fabricate(:card, front: "πρᾶγμα", back: "deed, act")
greek.cards << Fabricate(:card, front: "σῶμα", back: "body")
