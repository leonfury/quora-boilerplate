########################################################################################
# Attempts to create 15 users
# Rejects 5 users due to validation failure
# Creates 10 users successfully
User.create(full_name: 'user1', email: 'user1@mail.com', password: 'user1qwerty')
User.create(full_name: 'user2', email: 'user2@mail.com', password: 'user2qwerty')
User.create(full_name: 'user3', email: 'user3@mail.com', password: 'user3qwerty')
User.create(full_name: 'user4', email: 'user4@mail.com', password: 'user4qwerty')
User.create(full_name: 'user5', email: 'user5@mail.com', password: 'user5qwerty')
User.create(full_name: 'user6', email: 'user6@mail.com', password: 'user6qwerty')
User.create(full_name: 'user7', email: 'user7@mail.com', password: 'user7qwerty')
User.create(full_name: 'user8', email: 'user8@mail.com', password: 'user8qwerty')
User.create(full_name: 'user9', email: 'user9@mail.com', password: 'user9qwerty')
User.create(full_name: 'user10', email: 'user10@mail.com', password: 'user10qwerty')
# Below should fail validation
User.create(full_name: 'user11', email: 'user11@mail.com', password: 'user11')
User.create(full_name: 'user12', email: 'user10@mail.com', password: 'user12qwerty')
User.create(full_name: 'user13', email: 'user13mail.com', password: 'user13qwerty')
User.create(full_name: 'user14', email: 'user14@mail', password: 'user14qwerty')
User.create(full_name: 'user15', email: 'a@b.c', password: 'user15qwerty')

#########################################
Question.create(question: 'Question1 by user1', user_id: '1')
Question.create(question: 'Question2 by user1', user_id: '1')

Answer.create(answer: 'answer1', question_id: '1', user_id: '2')



