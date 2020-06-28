#include "wrap_isl.hpp"

namespace isl
{
#include "gen-wrap-part2.inc"
}

void islpy_expose_part2(py::module &m)
{
  MAKE_WRAP(basic_set, BasicSet);
  // wrap_basic_set.enable_pickling();

  MAKE_WRAP(basic_map, BasicMap);
  // wrap_basic_map.enable_pickling();

  MAKE_WRAP(set, Set);
  wrap_set.def(py::init<isl::basic_set &>());
  // wrap_set.enable_pickling();

  MAKE_WRAP(map, Map);
  wrap_map.def(py::init<isl::basic_map &>());
  // wrap_map.enable_pickling();

  MAKE_WRAP(union_set, UnionSet);
  wrap_union_set.def(py::init<isl::set &>());
  // wrap_union_set.enable_pickling();

  MAKE_WRAP(union_map, UnionMap);
  wrap_union_map.def(py::init<isl::map &>());
  // wrap_union_map.enable_pickling();

  MAKE_WRAP(point, Point);
  // wrap_point.enable_pickling();
  MAKE_WRAP(vertex, Vertex);
  // wrap_vertex.enable_pickling();
  MAKE_WRAP(cell, Cell);
  // wrap_cell.enable_pickling();
  MAKE_WRAP(vertices, Vertices);
  MAKE_WRAP(stride_info, StrideInfo);

#include "gen-expose-part2.inc"
}
