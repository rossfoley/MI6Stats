module WeaponExtensions
  def weapon_sums
    query = self::WEAPONS.map do |weapon|
      "SUM(`#{weapon}_kills`) AS `#{weapon}_kills`, SUM(`#{weapon}_hs`) AS `#{weapon}_hs`, SUM(`#{weapon}_deaths`) AS `#{weapon}_deaths`"
    end.join(", ")

    self.select(query).first
  end
end
