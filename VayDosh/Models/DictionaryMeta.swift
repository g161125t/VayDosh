//
//  DictionaryMeta.swift
//  VayDosh
//
//  Created by Scottie Illidan on 21/09/2025.
//

import Foundation

struct DictionaryMeta: Identifiable {
  let id = UUID()
  let code: String
  let description: String
}

// MARK: - Dictionary/VayDosh Composition
let dictionaries: [DictionaryMeta] = [
  DictionaryMeta(code: "АНТ17", description: ""),
  DictionaryMeta(code: "АНТ21", description: ""),
  DictionaryMeta(code: "ДУД15", description: "— Дударов А-М.М. Земледелие ингушей. — 2015."),
  DictionaryMeta(code: "ИРсНС", description: "— Ингушско-русский словарь неизвестного составителя."),
  DictionaryMeta(code: "ИРТ16", description: "— Барахоева Н.М., Кодзоев Н.Д., Хайров Б.А. Ингушско-русский и русско-ингушский словарь терминов: более 8200 слов. — 2016."),
  DictionaryMeta(code: "ИТС33", description: "— Мальсагов З.К. Ингушский терминологический сборник. — 1933."),
  DictionaryMeta(code: "КАР95", description: ""),
  DictionaryMeta(code: "КОД18", description: ""),
  DictionaryMeta(code: "КОД21", description: "— Кодзоев Н.Д. Русско-ингушский словарь (около 22 500 слов). — 2021."),
  DictionaryMeta(code: "КОДКТ", description: "— Кодзоев Н.Д. Словарь компьютерных терминов. — 2016."),
  DictionaryMeta(code: "КУР05", description: "— Куркиев А.С. Ингушско-русский словарь: 11142 слова. — 2005."),
  DictionaryMeta(code: "МЕД19", description: "— Кодзоев Н.Д. Медицина. Русско-ингушский словарь. — 2019."),
  DictionaryMeta(code: "ПТИ09", description: "— Кодзоев Н.Д. — Птицы: ингушско-русский словарь. — 2009."),
  DictionaryMeta(code: "РАЗ01", description: "— Названия месяцев по разным авторам: Дахкильгов И.; Мерешков С.; Патиев Я.; Арчаков С.; Матенаькъан И."),
  DictionaryMeta(code: "РАЗ02", description: "— Ислам (Словарь к Тафсиру Корана на ингушском языке)."),
  DictionaryMeta(code: "СЕЛААД", description: "— «СелаӀад» («Радуга»). — Детский журнал."),
  DictionaryMeta(code: "УЖА27", description: "— Ужахов М.Г. Ингушско-русский словарь. — 1927."),
  DictionaryMeta(code: "ХАЙОР", description: "— Хайров Б. Наименование древнего и средневекового оружия на ингушском языке. — 2012."),
]
