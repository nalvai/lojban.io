{-# LANGUAGE OverloadedStrings #-}
module Lessons.Grammar.Lesson
( exercises1
, exercises2
) where

import Core
import Lessons.Grammar.Vocabulary
import Lessons.Grammar.Sentences (displaySimpleBridi, displayVariantBridi, basicSentenceCannonicalizer)
import Lessons.Grammar.ExerciseGenerators
import Util (combineFunctions, combineFunctionsUniformly)

-------- Vocabulary
vocabularyGenerator1 :: VocabularyGenerator
vocabularyGenerator1 = buildVocabularyGenerator
    -- Gismu
    ["tavla", "dunda", "prenu", "zdani", "pendo", "mlatu"]
    -- Cmavo
    ["zo'e", "mi", "do", "ti", "ta"]
    -- Cmevla
    []
    -- Selbri
    [
        ("actions", ["tavla", "dunda"]),
        ("properties", ["prenu", "zdani", "mlatu"]),
        ("relations", ["pendo"])
    ]
    -- Sumti
    [
        ("persons", ["mi", "do"]),
        ("genericPointable", ["ti", "ta"])
    ]

vocabularyGenerator2 :: VocabularyGenerator
vocabularyGenerator2 = buildVocabularyGenerator
    -- Gismu
    ["tavla", "dunda", "prenu", "zdani", "pendo", "mlatu", "gerku", "citka", "plise", "melbi", "sutra", "nelci"]
    -- Cmavo
    ["zo'e", "lo", "mi", "do", "ti", "ta"]
    -- Cmevla
    []
    -- Selbri
    [
        ("actions", ["tavla", "dunda", "citka"]),
        ("properties", ["prenu", "melbi", "plise", "zdani", "mlatu", "gerku", "pelxu", "sutra"]),
        ("relations", ["nelci", "pendo"])
    ]
    -- Sumti
    [
        ("persons", ["mi", "do", "lo prenu ku"]),
        ("animals", ["lo mlatu ku", "lo gerku ku"]),
        ("genericPointable", ["ti", "ta"]),
        ("places", ["lo zdani ku"]),
        ("subjects", ["lo zdani ku", "lo mlatu ku", "lo gerku ku"]),
        ("aliments", ["lo plise ku"])
    ]

vocabulary3 :: VocabularyGenerator
vocabulary3 = buildVocabularyGenerator
    -- Gismu
    ["tavla", "dunda", "klama", "prenu", "melbi", "sutra", "zdani", "mlatu", "gerku", "pelxu", "nelci", "citka", "catlu", "djica", "djuno", "drata", "kumfa", "mutce", "cusku", "troci", "viska", "xamgu", "gleki"]
    -- Cmavo
    ["zo'e", "mi", "do", "ti"]
    -- Cmevla
    []
    -- Selbri
    [
        ("actions", ["tavla", "dunda", "klama"]),
        ("properties", ["prenu", "melbi", "sutra", "zdani", "mlatu", "gerku", "pelxu"]),
        ("relations", ["nelci"])
    ]
    -- Sumti
    [
        ("persons", ["mi", "do"]),
        ("genericPintable", ["ti", "ta", "tu"])
    ]

-------- Translations
translations1_nice :: [Translation]
translations1_nice =
    [ ("I have a house.", "zdani mi")
    , ("You gave me this.", "do dunda ti mi")
    , ("I gave you that.", "mi dunda ta do")
    , ("I am talking to myself", "mi tavla mi")
    ]

translations1 :: [Translation]
translations1 = translations1_nice ++
    [ ("You are my friend.", "do pendo mi")
    , ("I am your friend.", "mi pendo do")
    , ("I am talking to you.", "mi tavla do")
    , ("You are talking to me.", "do tavla mi")
    , ("You are talking to yourself.", "do tavla do")
    , ("I am a person.", "mi prenu")
    , ("You are a person.", "do prenu")
    , ("That is a house", "ta zdani")
    , ("That is a cat.", "ta mlatu")
    ]

translations2 :: [Translation]
translations2 = translations1_nice ++
    [ ("The house is yellow.", "lo zdani ku pelxu")
    , ("A person is talking to a dog.", "lo prenu ku tavla lo gerku ku")
    , ("The dog likes the cat.", "lo gerku ku nelci lo mlatu ku")
    , ("The house is beautiful!", "lo zdani ku melbi")
    ]

-------- Exercises
exercises1 :: Dictionary -> ExerciseGenerator
exercises1 dictionary =
    combineFunctions
        [ (20, generateGrammaticalClassExercise vocabulary)
        , (15, generateBridiJufraExercise vocabulary displayVariantBridi)
        , (20, generateSelbriIdentificationExercise vocabulary displayVariantBridi)
        , (30, generateEasyGismuPlacesExercise dictionary vocabulary displayVariantBridi)
        , (40, generateTranslationExercise basicSentenceCannonicalizer translations1)
        ]
    where
        vocabulary = vocabularyGenerator1 dictionary

-- TODO: se, te, ...
exercises2 :: Dictionary -> ExerciseGenerator
exercises2 dictionary =
    combineFunctions
        [ (20, generateGrammaticalClassExercise vocabulary)
        , (15, generateBridiJufraExercise vocabulary displayVariantBridi)
        , (20, generateSelbriIdentificationExercise vocabulary displayVariantBridi)
        , (30, generateEasyGismuPlacesExercise dictionary vocabulary displayVariantBridi)
        , (50, generateTranslationExercise basicSentenceCannonicalizer translations2)
        ]
    where
        vocabulary = vocabularyGenerator2 dictionary
