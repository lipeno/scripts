DEAD = 0
ALIVE = 1

def run_game
  puts "Enter state in"
  # ... Read cells from a file
  world = World.new(cells)

  while (1)
    world.cells.each do |cell|
      state = world.calculate_next_cell_state(state)
    end
    # ... Display cells on a screen
    sleep(1)
  end
end

class Cell
   def initialize(x, y)
     @x = x
     @y = y
   end
   attr_accessor :x
   attr_accessor :y
end

class World
  def initialize cells
    @cells = cells
  end

  def calculate_neighbors_for_cell cell
    row = [cell.x - 1..cell.x + 1]
    col = [cell.y - 1..cell.y + 1]
    cells_matching = cells.map do |world_cell|
      if row.include?(world_cell.x) && col.include?(world_cell.y)
         return world_cell
      end
    end
    neighbor_cells = cells_matching.count - 1
  end

  def calculate_next_cell_state cell
    cells.select{|current_cell| current_cell if current_cell == cell}
    if cells.any?
      current_cell_state = ALIVE
    else
      current_cell_state = DEAD
    end
    nr_of_alive_neighbour = calculate_neighbors_for_cell cell

    if current_cell_state == ALIVE && (nr_of_alive_neighbour < 2)
      return DEAD
    elsif current_cell_state == ALIVE && (nr_of_alive_neighbour == 2 || nr_of_alive_neighbour == 3)
      return ALIVE
    elsif current_cell_state == DEAD && (nr_of_alive_neighbour == 3)
      return ALIVE
    elsif current_cell_state == ALIVE && (nr_of_alive_neighbour > 3)
      return DEAD
    end
  end

  attr_accessor :cells
end

describe Cell do
  it "it gets succesfully instantiated" do
    x = 1
    y = 1
    new_cell = Cell.new(x,y)
    new_cell.x.should eq(x)
    new_cell.y.should eq(y)
  end
end

describe "calculate_next_cell_state" do
  it "Any live cell with less than two live neighbours dies, as if caused by under-population" do
    x = 1
    y = 1
    new_cell = Cell.new(x,y)
    x = 2
    y = 2
    neighbor = Cell.new(x,y)
    world = World.new([new_cell, neighbor])
    world.calculate_next_cell_state(new_cell).should eq(DEAD)
  end

  it "Any live cell with two or three live neighbours lives on to the next generation" do
    new_cell = Cell.new(1,1)
    world = World.new([new_cell, Cell.new(1,2), Cell.new(2,2)])
    world.calculate_next_cell_state(new_cell).should eq(ALIVE)
  end

  it "Any live cell with more than three live neighbours dies, as if by overcrowding." do
    new_cell = Cell.new(1,1)
    world = World.new([new_cell, Cell.new(1,2), Cell.new(2,2), Cell.new(0,1), Cell.new(2,3)])
    world.calculate_next_cell_state(new_cell).should eq(DEAD)
  end

  it "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
    new_cell = Cell.new(1,1)
    world = World.new([new_cell, Cell.new(1,2), Cell.new(2,2), Cell.new(0,1)])
    world.calculate_next_cell_state(new_cell).should eq(ALIVE)
  end
end

describe World do
  describe "calculate_neighbors_for_cell" do
    it "Calculates number of neigbors, shows 0" do
      x = 1
      y = 1
      cell = Cell.new(x,y)
      world = World.new([cell])
      world.calculate_neighbors_for_cell(cell).should eq(0)
    end

    it "it calculates number of neighbors" do
      x = 1
      y = 1
      new_cell = Cell.new(x,y)
      x = 2
      y = 2
      neighbor = Cell.new(x,y)
      world = World.new([new_cell, neighbor])
      world.calculate_neighbors_for_cell(new_cell).should eq(1)
    end
  end
end