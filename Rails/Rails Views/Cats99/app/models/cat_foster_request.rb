class CatFosterRequest < ApplicationRecord
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validate :start_date_not_in_past
  validate :end_date_not_before_start
  validate :does_not_overlap_approved_requests
  validates :status, presence: true, inclusion: { in: %w(APPROVED PENDING DENIED), message: "%{value} is not a valid status" }
  
  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def approve!
    raise "This request has already been #{self.status.downcase}" unless self.status == "PENDING"
    transaction do
      self.status = "APPROVED"
      self.save!
      overlapping_pending_requests.each { |request| request.update!(status: "DENIED") }
    end
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  def pending?
    self.status == "PENDING"
  end

  private
  def overlapping_requests
    CatFosterRequest.where.not(id: id).where(cat_id: cat_id).where("start_date BETWEEN ? AND ? OR (end_date IS NULL OR end_date BETWEEN ? AND ?)", start_date, end_date, start_date, end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def does_not_overlap_approved_requests
    errors[:start_date] << "or end date cannot overlap an existing approved request" if status != "DENIED" && overlapping_approved_requests.exists?
  end

  def start_date_not_in_past
    errors[:start_date] << "cannot be in the past" unless !start_date || start_date > Time.now
  end

  def end_date_not_before_start
    errors[:end_date] << "cannot be before start date" unless !end_date || start_date < end_date
  end


end