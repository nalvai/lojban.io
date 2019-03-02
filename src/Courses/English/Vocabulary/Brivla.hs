{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TupleSections #-}

module Courses.English.Vocabulary.Brivla (course, lesson01) where

import Core
import Courses.Util.ExerciseGenerators
import Util (generatorFromList, combineFunctions)
import Control.Arrow (first, second, (***))
import qualified Data.Text as T
import qualified Text.Pandoc as P
import Data.FileEmbed (embedStringFile)
import Data.List.Split (chunksOf)

-- Auxiliar functions
loadTranslationsByExpression :: T.Text -> TranslationsByExpression
loadTranslationsByExpression contents = map loadTranslations $ T.splitOn "\n\n\n" contents where
    loadTranslations :: T.Text -> (T.Text, [Translation])
    loadTranslations contents = (title, translations) where
        title_line:translation_lines = T.lines contents
        title = head $ T.splitOn ":" title_line
        translations = map makeTranslation $ chunksOf 2 translation_lines where
            makeTranslation [lojban_line, english_line] = ([(T.splitOn "\t" lojban_line) !! 1], [(T.splitOn "\t\t" english_line) !! 1])

buildBrivlaExerciseGenerator :: Dictionary -> TranslationsByExpression -> ExerciseGenerator
buildBrivlaExerciseGenerator dictionary translationsByExpression = combineFunctions [(6, translationExercises), (3, brivlaPlacesExercises), (3, brivlaProvidingExercises)] where
    brivla = map fst translationsByExpression
    brivlaWithAtLeastTwoPlaces = filter ((>= 2) . length . retrieveBrivlaPlaces dictionary) brivla
    translationExercises = generateBroadFillingBlanksExerciseByExpression translationGeneratorByExpression
    translationGeneratorByExpression = map (second generatorFromList) translationsByExpression
    brivlaPlacesExercises = generateIsolatedBrivlaPlacesExercise dictionary $ generatorFromList brivlaWithAtLeastTwoPlaces
    brivlaProvidingExercises = generateLexiconProvidingExercise "brivla" dictionary $ generatorFromList brivla

------- Lesson plans
plan01 :: P.Pandoc
Right plan01 = P.runPure $ P.readMarkdown P.def $ ""

------- Translations
translations01 :: TranslationsByExpression
translations01 = loadTranslationsByExpression $(embedStringFile "courses/english/vocabulary/brivla/01_easy.txt")

------- Exercises
exercises01 :: Dictionary -> ExerciseGenerator
exercises01 dictionary = buildBrivlaExerciseGenerator dictionary translations01

------- Lessons
-- TODO: rename: "Brivla 1--20", "Brivla 21--40", ...
lesson01 :: LessonBuilder
lesson01 dictionary = Lesson "Deck #1" (exercises01 dictionary) plan01

-------- Course
course :: CourseBuilder
course = createCourseBuilder title style lessons where
    title = "Common brivla" 
    style = CourseStyle (Just "courses/vocabulary/brivla.css")
    lessons = [lesson01]
