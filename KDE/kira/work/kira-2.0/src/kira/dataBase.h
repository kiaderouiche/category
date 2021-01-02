/*
Copyright (C) 2017-2020 The Kira Developers (see AUTHORS file)

This file is part of Kira.

Kira is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Kira is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Kira.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef DATABASE_H
#define DATABASE_H

#include <string>
#include <tuple>

#include "kira/integral.h"
#include "sqlite3/sqlite3.h"

#define NDBINT 8

struct DBintegral {
  std::string indices;
  int topology;
  std::string coefficient;
  int massDimension;
  std::uint64_t id;
};

class BaseIntegral;

class DataBase {
public:
  DataBase(std::string name);
  void open(std::string name);
  ~DataBase();
  void execute_statement(std::string& sql, std::string message);
  int checkTable(std::string& name);
  void create_integral_table(int l_Indices);
  void create_equation_table();
  void create_skipid_table();
  void create_weight_bits_table();
  void save_weight_bits(std::vector<std::uint32_t>& weightBits);
  int get_weight_bits(std::vector<std::uint32_t>& weightBits);
  int table_weight_bits_empty();
  void create_integral_ordering_table();
  void save_integral_ordering(int integralOrdering);
  int get_integral_ordering();
  void attach_table(std::string& attachName);
  void begin_transaction();
  void commit_transaction();

  void prepare_pyred();
  void prepare_find_master();
  void bind_get_answer(int topology, int sector, int dots, int nums,
                       std::vector<std::uint64_t>& mandatory);

  void prepare_integral();
  void bind_integral(SEEDIntegral& integral, int indices);

  void prepare_backsubstitution();
  void bind_equation(
      BaseIntegral& integral, int length, std::uint64_t ID,
      std::unordered_map<std::uint64_t, std::uint64_t> mastersReMap);
  void bind_denominators(std::uint64_t id, std::string& coefficient, int length,
                         std::uint64_t ID);

  void prepare_skipid();
  void bind_skipid(std::uint64_t ID);
  void select_skipid();
  int find_skipid(std::uint64_t id);
  int bind_id_get_BSequation(
      std::uint64_t id, BaseIntegral*& integral,
      std::vector<std::uint64_t>& masterVectorSkip,
      std::unordered_map<std::uint64_t, unsigned>& occurrence, int flagOcc);

  void prepare_id();
  std::uint64_t bind_get_id(std::vector<int>& indices, int topology);

  void prepare_lookup_id();
  //   void prepare_lookup_id2();
  int bind_id_get_integral(
      std::uint64_t id, std::tuple<std::string, unsigned, unsigned>& integral);
  void bind_id_get_equation(std::uint64_t id,
                            std::vector<DBintegral>& equation);

  void finalize();

  int number_of_columns();
  std::vector<std::string> columnName;

  void merge_databases(std::vector<std::string>& files);

private:
  sqlite3* db;
  char* errorMessage;
  int rc;
  std::string sql;
  sqlite3_stmt* stmt;
  unsigned int totalColumn;
};
#endif // DATABASE_H
