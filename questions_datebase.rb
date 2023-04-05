require "singleton"

class QuestionsDatabase < SQLite3::Database
    includes Singleton

    def initialize
        super('questions.db') 
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Questions 
    attr_accessor :title, :id, :body, :user_id
    def self.all
        data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
        data.map {|datum| Questions.new(datum)}
    end

    def self.find_by_id(id)
        question = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                id
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless question != nil
        Question.new(id)
        
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    

end