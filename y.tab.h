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
    tElse = 260,
    tWhile = 261,
    tPO = 262,
    tPF = 263,
    tAO = 264,
    tAF = 265,
    tInt = 266,
    tConst = 267,
    tVirgule = 268,
    tOpPlus = 269,
    tOpMoins = 270,
    tOpMul = 271,
    tOpDiv = 272,
    tFI = 273,
    tPrint = 274,
    tEgal = 275,
    tSup = 276,
    tInf = 277,
    tEqu = 278,
    tNomVar = 279,
    tValInt = 280,
    tOpEgal = 281
  };
#endif
/* Tokens.  */
#define tMain 258
#define tIf 259
#define tElse 260
#define tWhile 261
#define tPO 262
#define tPF 263
#define tAO 264
#define tAF 265
#define tInt 266
#define tConst 267
#define tVirgule 268
#define tOpPlus 269
#define tOpMoins 270
#define tOpMul 271
#define tOpDiv 272
#define tFI 273
#define tPrint 274
#define tEgal 275
#define tSup 276
#define tInf 277
#define tEqu 278
#define tNomVar 279
#define tValInt 280
#define tOpEgal 281

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 15 "compiler.y" /* yacc.c:1909  */

            char* var;
            int nb;
        

#line 112 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
