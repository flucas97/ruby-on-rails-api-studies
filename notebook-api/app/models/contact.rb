class Contact < ApplicationRecord
    belongs_to :kind

    def translate_birthdate
        I18n.l(self.birthdate) unless self.birthdate.blank?
    end

    def to_br
        {
            name: self.name,
            email: self.email,
            birthdate: I18n.l(self.birthdate),
        }
    end
    #def kind_description
    #    self.kind.description
    #end

    #def as_json(options={})
    #   super(
    #        root: true,
    #        methods: [:kind_description]
    #    )
    #end
  
end
