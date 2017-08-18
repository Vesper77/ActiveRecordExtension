module ActiveRecordExtension
  extend ActiveSupport::Concern

  def next
    self.class.where("id > ?", id).first
  end

  def prev
    self.class.where("id < ?", id).last
  end

  class_methods do
    def auto_increment(*columns)
      columns.each do |column|
        after_create do |record|
          if record.prev
            record[column] = record.prev[column]+ 1 if record[column].present?
            record.save
          end
        end
      end
    end

  end

  ActiveRecord::Base.send :include, ActiveRecordExtension
end