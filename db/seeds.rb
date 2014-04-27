# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
location = Location.create(address: "15 Tsar Osvoboditel Blvd,1504 Sofia",
                           city: 'Sofia',
                           country: 'Bulgaria',
                           lat: 42.212131,
                           lng: 23.234141)

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
              location: location,
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
              location: location,
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
              location: location,
              tags: [ruby_tag],
              lecturer: moderator,
              description: '''CS101 teaches the essential ideas of Computer Science for a zero-prior-experience
              audience. The course uses small coding experiments in the browser to play with the nature of computers,
              understanding their strengths and limitations. Sign up for the "To be announced" session to be notified
              by email when the class is next run, and sign up for "Self-Study" to start browsing the class materials
              right away. Self-Study mode makes all the videos and assignments available to be done at your own pace,
              but without a certificate of completion at the end.''',
              min_participants: 3)
computer_science[:picture] = 'computer_science.png'
computer_science.save

game_playing = Course.create(name: 'General Game Playing',
              date: '2014-04-29 15:30',
              approved: true,
              location: location,
              lecturer: admin,
              description: '''Learn about General Game Playing (GGP) and develop GGP programs capable of competing
              against humans and other programs in GGP competitions .''',
              min_participants: 20)
game_playing[:picture] = 'game_playing.jpg'
game_playing.save

request = Request.create(location: location,
                         requester: user,
                         tags: [ruby_tag, python_tag])

Notification.create(seen: false,
                    course: reactive_programming,
                    request: request,
                    lecturer: moderator,
                    subscriber: user)
