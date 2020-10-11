// SPDX-License-Identifier: GPL-3.0-or-later
// Copyright (c) 2020 Scipp contributors (https://github.com/scipp)
/// @file
/// @author Owen Arnold
#pragma once

#include <tuple>

namespace scipp::core::element {

/// Helper to define lists of supported arguments for transform and
/// transform_in_place.
template <class... Ts> struct arg_list_t {
  constexpr void operator()() const noexcept;
  using types = std::tuple<Ts...>;
};
template <class... Ts> constexpr arg_list_t<Ts...> arg_list{};

} // namespace scipp::core::element
