class Book < ApplicationRecord
    self.per_page = 5
    validates :name, presence: true
    validates :author, presence: true
    validates :name, length: { minimum: 2, message: "Minimum 2 letters are needed" }
    validates :name, uniqueness: true

    before_save :merge_names
    after_destroy :update_log

    def merge_names
     self.name = self.name + " By " + self.author
    end

    def update_log
      logger.info "================= Alas ! a book has been deleted with name #{self.name}========"
    end
end
