# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Fabricate(:card, front: "κακός", back: "bad, ugly")
Fabricate(:card, front: "βασιλεύς", back: "king, chief")
Fabricate(:card, front: "διδάσκαλος", back: "teacher, master")
Fabricate(:card, front: "ἐναντίος", back: "opposite")
Fabricate(:card, front: "ἰατρός", back: "one who heals, physician")
Fabricate(:card, front: "καλός", back: "beautiful, good")
Fabricate(:card, front: "κέρδος", back: "gain, profit")
Fabricate(:card, front: "λόγος", back: "word, reason, account")
Fabricate(:card, front: "παῖς", back: "child")
Fabricate(:card, front: "πρᾶγμα", back: "deed, act")
Fabricate(:card, front: "σῶμα", back: "body")
