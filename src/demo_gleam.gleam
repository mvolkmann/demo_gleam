import gleam/bool
import gleam/float
import gleam/int
import gleam/io
import gleam/list

@external(erlang, "math", "pi")
fn get_pi() -> Float

// gleam add gleam_community_maths
// import gleam_community/maths/elementary
// import math.{pi}

// This defines a type alias.
pub type Distance =
  Float

pub type Scores =
  List(Int)

// This defines a type variant.
pub type Shape {
  Circle(radius: Float)
  Square(size: Float)
  Rectangle(height: Float, width: Float)
}

fn area(shape: Shape) -> Float {
  let pi = get_pi()
  case shape {
    Circle(radius) -> pi *. radius *. radius
    Square(size) -> size *. size
    Rectangle(height, width) -> height *. width
  }
}

pub fn main() {
  let pi = get_pi()

  let distance: Distance = 26.2
  let scores = [92, 87, 98]
  let circle = Circle(radius: 3.1)
  let square = Square(size: 3.1)
  let rectangle = Rectangle(height: 1.5, width: 2.5)

  io.println("distance = " <> float.to_string(distance))
  io.println("scores =")
  list.each(scores, fn(score) { io.println("  " <> int.to_string(score)) })
  io.println("circle area = " <> float.to_string(area(circle)))
  io.println("square area = " <> float.to_string(area(square)))
  io.println("rectangle area = " <> float.to_string(area(rectangle)))

  let score = 4
  let color = bool.guard(score > 5, "green", fn() { "red" })
  io.println("color = " <> color)

  io.debug(pi)
}
