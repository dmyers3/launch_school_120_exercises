require 'pry'

class Minilang
  OPERATIONS = { 'PRINT' => print_register }
  
  attr_reader :commands
  attr_accessor :stack, :register
  
  def initialize(commands)
    @commands = commands.split
    p @commands
    @stack = []
    @register = 0
  end
  
  def print_register
    6
  end
  
  def eval
    commands.each do |command|
      if command.to_i != 0
        self.register = command.to_i
      else
        binding.pry
        OPERATIONS[command]
      end
    end
  end

end

Minilang.new('5 PRINT').eval