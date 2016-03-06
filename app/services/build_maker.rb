class BuildMaker
  def self.make_build_pair(a, bs)
    a.builds = bs.map { |b| b.builds.new }
    a.save
    return a # Pass through, for seeds
  end
end
