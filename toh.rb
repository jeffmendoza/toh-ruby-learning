#!/usr/bin/ruby

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

class Towers < Array
  def move src, dest, num
    if num == 1
      self[src] -= 1
      self[dest] += 1
      p self
    else
      tmp = 3 - src - dest
      move src, tmp, num-1
      move src, dest, 1
      move tmp, dest, num-1
    end
  end
end

def main
  start_state_str = STDIN.readline.chomp
  end_state_str = STDIN.readline.chomp
  start_state = Towers.new
  end_state = []
  start_state_str.each_char { |ch| start_state << ch.to_i }
  end_state_str.each_char { |ch| end_state << ch.to_i }
  start_col = 0
  while start_state[start_col] == 0 do start_col += 1 end
  end_col = 0
  while end_state[end_col] == 0 do end_col += 1 end
  p start_state
  start_state.move start_col, end_col, start_state[start_col]
end


main



