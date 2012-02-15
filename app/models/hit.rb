class Hit < ActiveRecord::Base  
  before_create :init_hit
  
  def reviewable_hits
    RTurk.setup(Constants::TURK_API_KEY, Constants::TURK_SECRET_KEY, :sandbox => true)
    hits = RTurk::Hit.all_reviewable  
  end
  
  private
  
  def init_hit
    RTurk.setup(Constants::TURK_API_KEY, Constants::TURK_SECRET_KEY, :sandbox => true)
    hit = RTurk::Hit.create(:title => self.title) do |hit|
      hit.assignments = self.assignments
      hit.description = self.description
      hit.question(self.question,
                   :frame_height => 1000)  # pixels for iframe
      hit.reward = self.reward
      hit.qualifications.add :approval_rate, { :gt => self.min_approval_rate }
    end    
    self.url = hit.url
  end
  
end
