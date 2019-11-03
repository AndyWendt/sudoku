require 'digest'

class Puzzle
  attr_reader :original, :modified

  def initialize(puzzle)
    @original = puzzle.clone.freeze
    @modified = puzzle.clone
    @cell_candidates = {}
  end

  def get(cell)
    value = convert_to_int(modified[cell])
    return nil unless value

    value
  end

  def set(cell, value)
    modified[cell] = value.to_s
    candidates(cell, [])
  end

  def solved
    !modified.include?('.')
  end

  def hash(string = nil)
    string ||= modified
    Digest::MD5.hexdigest(string)
  end

  def changed(compare_hash = nil)
    compare_hash ||= hash(original)
    hash != compare_hash
  end

  def candidates(cell, candidates = nil)
    @cell_candidates[cell] = candidates if candidates
    @cell_candidates[cell] || []
  end

  def add_candidates(cell, candidates_to_add)
    combined = candidates(cell) + candidates_to_add
    candidates(cell, combined.uniq)
  end

  private

  def convert_to_int(value)
    Integer(value, exception: false)
  end
end
