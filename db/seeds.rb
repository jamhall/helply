User.create!([
                 {email: "admin@example.com", password: "testadminuser", password_confirmation: "testadminuser",
                  reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil,
                  sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10",
                  last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"
                 }
             ])

Topic.create([{name: 'Network'},
              {name: 'Infrastructure'},
              {name: 'Telephony and Communication'},
              {name: 'Web Applications'},
              {name: 'Linux Servers'},
              {name: 'Window Servers'},
              {name: 'Miscellaneous'}])

(1..50).each do |i|
  Article.create ({title: Faker::Lorem.sentence, summary: Faker::Lorem.sentence(3), content: Faker::Lorem.paragraphs(5).join("\n"), published_at: Time.now,  topic: Topic.offset(rand(Topic.count)).first })
end

puts "Done!"
