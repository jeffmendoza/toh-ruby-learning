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
  def move(src, dest, num)
    if num == 1
      self[dest] << self[src].pop
      puts to_s
    else
      tmp = 3 - src - dest
      move src, tmp, num - 1
      move src, dest, 1
      move tmp, dest, num - 1
    end
  end

  def <<(num)
    super []
    num.downto(1) { |i| last << i } # why 1 in paren?
  end

  def to_s
    lines = max  { |a, b| a.count <=> b.count }.count - 1
    out = '-' * ((count) * 2 + 1) + "\n"
    last = String.new(out)
    lines.downto(0) do |line|
      out << '|'
      each do |col|
        out << (col[line].nil? ? ' ' : col[line].to_s)
        out << '|'
      end
      out << "\n"
    end
    out << last
  end
end

def main
  start_state = Towers.new
  end_state = []
  STDIN.readline.chomp.each_char { |ch| start_state << ch.to_i }
  STDIN.readline.chomp.each_char { |ch| end_state << ch.to_i }

  start_col = 0
  start_col += 1 while start_state[start_col].empty?
  end_col = 0
  end_col += 1 while end_state[end_col].zero?
  # lst.each_with_index { |s, i| col = i unless s.zero? }

  puts start_state.to_s
  start_state.move start_col, end_col, start_state[start_col].count
end

main
