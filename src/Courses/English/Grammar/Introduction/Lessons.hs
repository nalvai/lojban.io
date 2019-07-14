-- | This module defines the course lessons.
module Courses.English.Grammar.Introduction.Lessons  where

import Core
import Courses.English.Grammar.Introduction.Documents
import Courses.English.Grammar.Introduction.Exercises

-- | First lesson: Basics 1.
lesson1 :: LessonBuilder
lesson1 dictionary = Lesson "Basics 1" (exercises1 dictionary) lecture1 plan1

-- | Second lesson: Basics 2.
lesson2 :: LessonBuilder
lesson2 dictionary = Lesson "Basics 2" (exercises2 dictionary) lecture2 plan2

-- | Third lesson: Questions 1.
lesson3 :: LessonBuilder
lesson3 dictionary = Lesson "Questions 1" (exercises3 dictionary) lecture3 plan3

-- | Fourth lesson: Abstractions 1.
lesson4 :: LessonBuilder
lesson4 dictionary = Lesson "Abstractions 1" (exercises4 dictionary) lecture4 plan4

-- | Fifth lesson: Terminator elision.
lesson5 :: LessonBuilder
lesson5 dictionary = Lesson "Terminator elision" (exercises5 dictionary) lecture5 plan5

-- | Sixth lesson: Checkpoint (Lessons 1--5).
checkpoint1to5 :: LessonBuilder
checkpoint1to5 dictionary = Lesson "Checkpoint: Lessons 1–5" (exercises1to5 dictionary) lecture1to5 plan1to5

-- | Seventh lesson: Relative clauses.
lesson7 :: LessonBuilder
lesson7 dictionary = Lesson "Relative clauses" (exercises7 dictionary) lecture7 plan7

-- | Eighth lesson: Linked sumti.
lesson8 :: LessonBuilder
lesson8 dictionary = Lesson "Linked sumti" (exercises8 dictionary) lecture8 plan8

-- | Nineth lesson: Sumtcita
lesson9 :: LessonBuilder
lesson9 dictionary = Lesson "Sumtcita" (exercises9 dictionary) lecture9 plan9

-- | Tenth lesson: Tenses 1
lesson10 :: LessonBuilder
lesson10 dictionary = Lesson "Tenses 1" (exercises10 dictionary) lecture10 plan10

-- | Eleventh lesson: Tanru
lesson11 :: LessonBuilder
lesson11 dictionary = Lesson "Tanru 1" (exercises11 dictionary) lecture11 plan11

-- | Twelveth lesson: Checkpoint (Lessons 7--11)
checkpoint7to11 :: LessonBuilder
checkpoint7to11 dictionary = Lesson "Checkpoint: Lessons 7-11" (exercises7to11 dictionary) lecture7to11 plan7to11

-- | Thirteenth lesson: Quotations 1
lesson13 :: LessonBuilder
lesson13 dictionary = Lesson "Quotations 1" (exercises13 dictionary) lecture13 plan13

-- | Fourteenth lesson: Relative phrases
lesson14 :: LessonBuilder
lesson14 dictionary = Lesson "Relative phrases" (exercises14 dictionary) lecture14 plan14

-- | Fifteenth lesson: Logical connectives 1
lesson15 :: LessonBuilder
lesson15 dictionary = Lesson "Logical connectives 1" (exercises15 dictionary) lecture15 plan15
