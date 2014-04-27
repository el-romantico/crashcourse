# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
location_sofia = Location.create(address: "15 Tsar Osvoboditel Blvd,1504 Sofia",
                                 city: 'Sofia',
                                 country: 'Bulgaria',
                                 lat: 42.7000,
                                 lng: 23.3333)

location_plovdiv = Location.create(address: "bul 'Hristo Botev', 4000 Plovdiv",
                                   city: 'Plovdiv',
                                   country: 'Bulgaria',
                                   lat: 42.1500,
                                   lng: 24.7500)

admin = User.create(name: 'Antonio JAVAldi',
                   email: 'root@example.org',
                   password: 'testtest',
                   password_confirmation: 'testtest',
                   admin: true)

moderator = User.create(name: 'Herr Moderator',
                        email: 'moderator@example.org',
                        password: 'moderator',
                        password_confirmation: 'moderator',
                        admin: true)

user = User.create(name: 'Brigite Larson',
                   email: 'user@example.org',
                   password: 'useruser',
                   password_confirmation: 'useruser')

ruby_tag = Tag.create(label: "Ruby")
python_tag = Tag.create(label: "Python")
economics_tag = Tag.create(label: "Economics")


macroeconomics = Course.create(name: 'Microeconomics Principles',
              date: '2014-04-26 15:30',
              approved: true,
              location: location_sofia,
              lecturer: admin,
              tags: [economics_tag],
              description: '''Introduction to the functions of individual decision-makers,
              both consumers and producers, within the larger economic system. Primary emphasis on the nature
              and functions of product markets, the theory of the firm under varying conditions of competition
              and monopoly, and the role of government in promoting efficiency in the economy.''',
              min_participants: 5)
macroeconomics[:picture] = 'macroeconomics.png'
macroeconomics.save

reactive_programming = Course.create(name: 'Principles of Reactive Programming',
              date: '2014-04-27 10:30',
              approved: true,
              location: location_sofia,
              lecturer: admin,
              tags: [ruby_tag, python_tag],
              description: '''Learn how to write composable software that is event-driven, scalable under load,
              resilient and responsive in the presence of failures. Model systems after human organizations or
              inter-human communication.''',
              min_participants: 10)
reactive_programming[:picture] =  'reactive_programming.jpg'
reactive_programming.save

computer_science = Course.create(name: 'Computer Science 101',
              date: '2014-04-20 15:30',
              approved: true,
              location: location_sofia,
              tags: [ruby_tag],
              lecturer: moderator,
              description: '''CS101 teaches the essential ideas of Computer Science
              for a zero-prior-experience audience. The course uses small coding experiments
              in the browser to play with the nature of computers, understanding their
              strengths and limitations. Sign up for the "To be announced" session to be notified
              by email when the class is next run, and sign up for "Self-Study" to start
              browsing the class materials right away. Self-Study mode makes all the videos
              and assignments available to be done at your own pace,
              but without a certificate of completion at the end.''',
              min_participants: 3)
computer_science[:picture] = 'computer_science.png'
computer_science.save

game_playing = Course.create(name: 'General Game Playing',
              date: '2014-04-29 15:30',
              approved: true,
              location: location_sofia,
              lecturer: admin,
              description: '''Learn about General Game Playing (GGP)
              and develop GGP programs capable of competing
              against humans and other programs in GGP competitions.''',
              min_participants: 20)
game_playing[:picture] = 'game_playing.jpg'
game_playing.save

public_speaking = Course.create(name: 'Introduction to Public Speaking',
                  date: '2014-04-27 19:30',
                  approved: true,
                  location: location_plovdiv,
                  lecturer: moderator,
                  description: '''A report from the National Association of Colleges
                  and Employers shows that employers want job candidates with strong
                  communication skills. Similarly, educational success also requires
                  the ability to articulate your thoughts clearly. In this class,
                  we will study the principles of public speaking; critically examine
                  our own and others’ speeches through interactive practice.''',
                  min_participants: 17)
public_speaking[:picture] = 'public.jpg'
public_speaking.save

caries_management = Course.create(name: 'Caries Management by Risk Assessment (CAMBRA)',
                  date: '2014-04-28 19:30',
                  approved: true,
                  location: location_plovdiv,
                  lecturer: moderator,
                  description: '''This course will provide the scientific basis for caries
                  (dental decay) risk assessment and practice interventions. You will immediately
                  be able to apply “caries management by risk assessment” into your clinical
                  setting or into your personal health care.''',
                  min_participants: 13)
caries_management[:picture] = 'caries.jpg'
caries_management.save

request = Request.create(location: location_sofia,
                         requester: user,
                         tags: [ruby_tag, python_tag])

Notification.create(seen: false,
                    course: reactive_programming,
                    request: request,
                    lecturer: moderator,
                    subscriber: user)
