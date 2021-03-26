/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tMain = 258,
    tIf = 259,
    tPO = 260,
    tPF = 261,
    tAO = 262,
    tAF = 263,
    tInt = 264,
    tConst = 265,
    tVirgule = 266,
    tOpPlus = 267,
    tOpMoins = 268,
    tOpMul = 269,
    tOpDiv = 270,
    tFI = 271,
    tPrint = 272,
    tEgal = 273,
    tSup = 274,
    tInf = 275,
    tEqu = 276,
    tNomVar = 277,
    tValInt = 278,
    tOpEgal = 279
  };
#endif
/* Tokens.  */
#define tMain 258
#define tIf 259
#define tPO 260
#define tPF 261
#define tAO 262
#define tAF 263
#define tInt 264
#define tConst 265
#define tVirgule 266
#define tOpPlus 267
#define tOpMoins 268
#define tOpMul 269
#define tOpDiv 270
#define tFI 271
#define tPrint 272
#define tEgal 273
#define tSup 274
#define tInf 275
#define tEqu 276
#define tNomVar 277
#define tValInt 278
#define tOpEgal 279

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 12 "compiler.y" /* yacc.c:1909  */

            char* var;
            int nb;
        

#line 108 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
