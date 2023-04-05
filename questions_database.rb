require "singleton"

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db') 
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Questions 
    attr_accessor :title, :id, :body, :user_id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end   

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map {|datum| Questions.new(datum)}
    end

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless question != nil
        Questions.new(question.first) 
    end
end

class User
    attr_accessor :fname, :lname, :id

    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless user != nil
        User.new(user.first)
    end

    # def self.find_by_name(fname,lname)
    #     user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    #         SELECT
    #             *
    #         FROM
    #             users
    #         WHERE
    #             fname = fname AND lname = lname
    #     SQL
    #     return nil unless fname == fname && lname == lname
    #     User.new(user.first)
    # end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map {|datum| User.new(datum)}
    end

    def initialize(options)
        @fname = options['fname']
        @lname = options['lname']
        @id = options['id']
    end
end
