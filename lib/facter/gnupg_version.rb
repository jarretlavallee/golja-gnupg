# Fact: gnupg_version
#
# Purpose: get gpg version
#
# Resolution:
#   Looks for the version of gpg, nil if not installed
#   returns output of gpg --version
#
#
# Notes:
#   None
Facter.add(:gnupg_version) do
  confine :kernel => 'Linux'
  setcode do
    if !Facter.value(:gnupg_command).nil?
      Facter::Core::Execution.execute("gpg --version | grep -Eom1 '[0-9\.]{5,}'")
    end
  end
end
