module Github
  class User
    include HappyMapper

    element :score,     Float
    element :name,      String
    element :actions,   Integer
    element :language,  String
    element :followers, Integer
    element :username,  String
    element :type,      String
    element :fullname,  String
    element :repos,     Integer
    element :id,        String
    element :pushed,    DateTime
    element :created,   DateTime
    element :location,  String
    element 'public-gist-count', Integer
    element 'public-repo-count', Integer
    element 'following-count', Integer
    element 'followers-count', Integer
    element 'created-at', DateTime
    element :login, String
    element :email, String
    element :blog, String
    element :company, String

    def self.find(username)
      begin
        xml = show_user_resource(username).get
        puts xml.class
        parse(xml)
      rescue TypeError
        xml = xml.body
        parse(xml)
      end
    end

    def self.search(username)
      begin
        xml = search_user_resource(username).get
        puts xml.class
        parse(xml)
      rescue TypeError
        xml = xml.body
        parse(xml)
      end
    end

    def repositories
      Github::Repository.user(login || username)
    end

    protected
      extend ApiResources
  end
end
