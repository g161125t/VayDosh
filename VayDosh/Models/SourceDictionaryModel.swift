//
//  SourceDictionaryModel.swift
//  VayDosh
//
//  Created by Scottie Illidan on 21/09/2025.
//

import Foundation

struct SourceDictionaryModel: Identifiable {
  let id = UUID()
  let code: String
  let description: String
}

// MARK: - Dictionary/VayDosh Composition
let dictionaries: [SourceDictionaryModel] = [
  SourceDictionaryModel(code: "АНТ17", description: ""),
  SourceDictionaryModel(code: "АНТ21", description: ""),
  SourceDictionaryModel(code: "ДУД15", description: "— Дударов А-М.М. Земледелие ингушей. — 2015."),
  SourceDictionaryModel(code: "ИРсНС", description: "— Ингушско-русский словарь неизвестного составителя."),
  SourceDictionaryModel(code: "ИРТ16", description: "— Барахоева Н.М., Кодзоев Н.Д., Хайров Б.А. Ингушско-русский и русско-ингушский словарь терминов: более 8200 слов. — 2016."),
  SourceDictionaryModel(code: "ИТС33", description: "— Мальсагов З.К. Ингушский терминологический сборник. — 1933."),
  SourceDictionaryModel(code: "КАР95", description: ""),
  SourceDictionaryModel(code: "КОД18", description: ""),
  SourceDictionaryModel(code: "КОД21", description: "— Кодзоев Н.Д. Русско-ингушский словарь (около 22 500 слов). — 2021."),
  SourceDictionaryModel(code: "КОДКТ", description: "— Кодзоев Н.Д. Словарь компьютерных терминов. — 2016."),
  SourceDictionaryModel(code: "КУР05", description: "— Куркиев А.С. Ингушско-русский словарь: 11142 слова. — 2005."),
  SourceDictionaryModel(code: "МЕД19", description: "— Кодзоев Н.Д. Медицина. Русско-ингушский словарь. — 2019."),
  SourceDictionaryModel(code: "ПТИ09", description: "— Кодзоев Н.Д. — Птицы: ингушско-русский словарь. — 2009."),
  SourceDictionaryModel(code: "РАЗ01", description: "— Названия месяцев по разным авторам: Дахкильгов И.; Мерешков С.; Патиев Я.; Арчаков С.; Матенаькъан И."),
  SourceDictionaryModel(code: "РАЗ02", description: "— Ислам (Словарь к Тафсиру Корана на ингушском языке)."),
  SourceDictionaryModel(code: "СЕЛААД", description: "— «СелаӀад» («Радуга»). — Детский журнал."),
  SourceDictionaryModel(code: "УЖА27", description: "— Ужахов М.Г. Ингушско-русский словарь. — 1927."),
  SourceDictionaryModel(code: "ХАЙОР", description: "— Хайров Б. Наименование древнего и средневекового оружия на ингушском языке. — 2012."),
]
