module Rateable

  def self.included(base)
    base.class_eval do
      def self.rate(*diets)
        diets.each do |diet|
          define_method("#{diet}_rating") do
            rate(diet)
          end
        end
      end
    end
  end

  private

  def rate(diet)
    total_rating = ratings.where("#{diet} = ? OR #{diet} = ?", 0, 1).count
    if total_rating == 0
      "0%"
    else
      score = ratings.where(diet => 1).count / total_rating.to_f
      "#{(score * 100).round(0)}%"
    end
  end
end
