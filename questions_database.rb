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

    def self.find_by_author_id(user_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                questions
            WHERE
                user_id = ?
        SQL
        return nil unless question != nil
        Questions.new(question.first)
    end

    def author(user_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            fname, lname
        FROM
            users
        WHERE
            user_id = ?
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

    def self.find_by_name(fname,lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?
        SQL
        return nil unless fname == fname && lname == lname
        User.new(user.first)
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map {|datum| User.new(datum)}
    end

    def authored_replies(user_id)
        Replies.find_by_user_id(user_id)
    end

    def authored_question(user_id)
        Questions.find_by_author_id(user_id)
    end

    def initialize(options)
        @fname = options['fname']
        @lname = options['lname']
        @id = options['id']
    end
end


    class QuestionFollows

        attr_accessor :user_id, :question_id, :id

        def initialize(options)
            @user_id = options["user_id"]
            @question_id = options["question_id"]
            @id = options["id"]
        end

        def self.find_by_id(id)
            question = QuestionsDatabase.instance.execute(<<-SQL, id)
                SELECT
                    *
                FROM
                    question_follows
                WHERE
                    id = ?
            SQL
            return nil unless question != nil
            QuestionFollows.new(question.first) 
        end

    end

    class Replies

        attr_accessor :id, :question_id, :user_id, :reply_body, :reply_id

        def initialize(options)
            @id = options['id']
            @question_id = options['question_id']
            @user_id = options['user_id']
            @reply_body = options['reply_body']
            @reply_id = options['reply_id']
        end

        def self.find_by_id(id)
            question = QuestionsDatabase.instance.execute(<<-SQL, id)
                SELECT
                    *
                FROM
                    replies
                WHERE
                    id = ?
            SQL
            return nil unless question != nil
            Replies.new(question.first) 
        end

        def self.find_by_user_id(user_id)
            question = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                user_id = ?
        SQL
        return nil unless question != nil
        Replies.new(question.first)

        end

        def self.find_by_question_id(question_id)
            question = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL
        return nil unless question != nil
        Replies.new(question.first)

        end
    end

    class QuestionLikes
        attr_accessor :user_id, :question_id, :id

        def initialize(options)
            @user_id = options['user_id']
            @question_id = options['question_id']
            @id = options['id']
        end

        def self.find_by_id(id)
            question = QuestionsDatabase.instance.execute(<<-SQL, id)
                SELECT
                    *
                FROM
                    question_likes
                WHERE
                    id = ?
            SQL
            return nil unless question != nil
            QuestionLikes.new(question.first) 
        end
    end
