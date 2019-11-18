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


  private
  def overlapping_requests
    CatFosterRequest.where.not(id: id).where(cat_id: cat_id).where("start_date BETWEEN ? AND ? OR end_date BETWEEN ? AND ?", start_date, end_date, start_date, end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end

  def does_not_overlap_approved_requests
    errors[:start_date] << "or end date cannot overlap an existing approved request" if overlapping_approved_requests.exists?
  end

  def start_date_not_in_past
    errors[:start_date] << "cannot be in the past" unless start_date > Time.now
  end

  def end_date_not_before_start
    errors[:end_date] << "cannot be before start date" unless !end_date || start_date < end_date
  end


end