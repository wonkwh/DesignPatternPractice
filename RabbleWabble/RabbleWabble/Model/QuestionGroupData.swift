/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

// MARK: - Data
extension QuestionGroup {

  public static func allGroups() -> [QuestionGroup] {
    return [hiragana(), katakana(), basicPhrases(), numbers()]
  }

  public static func hiragana() -> QuestionGroup {
    let questions = [
      Question(answer: "a", hint: nil, prompt: "아"),
      Question(answer: "i", hint: nil, prompt: "이"),
      Question(answer: "u", hint: nil, prompt: "우"),
      Question(answer: "e", hint: nil, prompt: "에"),
      Question(answer: "o", hint: nil, prompt: "오"),
      Question(answer: "ka", hint: nil, prompt: "가"),
      Question(answer: "ki", hint: nil, prompt: "기"),
      Question(answer: "ku", hint: nil, prompt: "구"),
      Question(answer: "ke", hint: nil, prompt: "케"),
      Question(answer: "ko", hint: nil, prompt: "코"),
      Question(answer: "sa", hint: nil, prompt: "사"),
      Question(answer: "shi", hint: nil, prompt: "시"),
      Question(answer: "su", hint: nil, prompt: "수"),
      Question(answer: "se", hint: nil, prompt: "세"),
      Question(answer: "so", hint: nil, prompt: "소"),
      Question(answer: "ta", hint: nil, prompt: "타"),
      Question(answer: "chi", hint: nil, prompt: "치"),
      Question(answer: "tsu", hint: nil, prompt: "츠"),
      Question(answer: "te", hint: nil, prompt: "테"),
      Question(answer: "to", hint: nil, prompt: "토"),
      Question(answer: "na", hint: nil, prompt: "나"),
      Question(answer: "ni", hint: nil, prompt: "니"),
      Question(answer: "nu", hint: nil, prompt: "누"),
      Question(answer: "ne", hint: nil, prompt: "네"),
      Question(answer: "no", hint: nil, prompt: "노"),
      Question(answer: "ha", hint: nil, prompt: "하"),
      Question(answer: "hi", hint: nil, prompt: "히"),
      Question(answer: "fu", hint: nil, prompt: "푸"),
      Question(answer: "he", hint: nil, prompt: "헤"),
      Question(answer: "ho", hint: nil, prompt: "호"),
      Question(answer: "ma", hint: nil, prompt: "마"),
      Question(answer: "mi", hint: nil, prompt: "미"),
      Question(answer: "mu", hint: nil, prompt: "무"),
      Question(answer: "me", hint: nil, prompt: "메"),
      Question(answer: "mo", hint: nil, prompt: "모"),
      Question(answer: "ya", hint: nil, prompt: "야"),
      Question(answer: "yu", hint: nil, prompt: "유"),
      Question(answer: "yo", hint: nil, prompt: "요"),
      Question(answer: "ra", hint: nil, prompt: "라"),
      Question(answer: "ri", hint: nil, prompt: "리"),
      Question(answer: "ru", hint: nil, prompt: "루"),
      Question(answer: "re", hint: nil, prompt: "레"),
      Question(answer: "ro", hint: nil, prompt: "로"),
      Question(answer: "wa", hint: nil, prompt: "와"),
      Question(answer: "wo", hint: nil, prompt: "우"),
      Question(answer: "n", hint: nil, prompt: "엔")
    ]
    return QuestionGroup(questions: questions, title: "Hiragana")
  }

  public static func katakana() -> QuestionGroup {
    let questions = [
      Question(answer: "a", hint: nil, prompt: "ア"),
      Question(answer: "i", hint: nil, prompt: "イ"),
      Question(answer: "u", hint: nil, prompt: "ウ"),
      Question(answer: "e", hint: nil, prompt: "エ"),
      Question(answer: "o", hint: nil, prompt: "オ"),
      Question(answer: "ka", hint: nil, prompt: "カ"),
      Question(answer: "ki", hint: nil, prompt: "キ"),
      Question(answer: "ku", hint: nil, prompt: "ク"),
      Question(answer: "ke", hint: nil, prompt: "ケ"),
      Question(answer: "ko", hint: nil, prompt: "コ"),
      Question(answer: "sa", hint: nil, prompt: "サ"),
      Question(answer: "shi", hint: nil, prompt: "シ"),
      Question(answer: "su", hint: nil, prompt: "ス"),
      Question(answer: "se", hint: nil, prompt: "セ"),
      Question(answer: "so", hint: nil, prompt: "ソ"),
      Question(answer: "ta", hint: nil, prompt: "タ"),
      Question(answer: "chi", hint: nil, prompt: "チ"),
      Question(answer: "tsu", hint: nil, prompt: "ツ"),
      Question(answer: "te", hint: nil, prompt: "テ"),
      Question(answer: "to", hint: nil, prompt: "ト"),
      Question(answer: "na", hint: nil, prompt: "ナ"),
      Question(answer: "ni", hint: nil, prompt: "ニ"),
      Question(answer: "nu", hint: nil, prompt: "ヌ"),
      Question(answer: "ne", hint: nil, prompt: "ネ"),
      Question(answer: "no", hint: nil, prompt: "ノ"),
      Question(answer: "ha", hint: nil, prompt: "ハ"),
      Question(answer: "hi", hint: nil, prompt: "ヒ"),
      Question(answer: "fu", hint: nil, prompt: "フ"),
      Question(answer: "he", hint: nil, prompt: "ヘ"),
      Question(answer: "ho", hint: nil, prompt: "ホ"),
      Question(answer: "ma", hint: nil, prompt: "マ"),
      Question(answer: "mi", hint: nil, prompt: "ミ"),
      Question(answer: "mu", hint: nil, prompt: "ム"),
      Question(answer: "me", hint: nil, prompt: "メ"),
      Question(answer: "mo", hint: nil, prompt: "モ"),
      Question(answer: "ya", hint: nil, prompt: "ヤ"),
      Question(answer: "yu", hint: nil, prompt: "ユ"),
      Question(answer: "yo", hint: nil, prompt: "ヨ"),
      Question(answer: "ra", hint: nil, prompt: "ラ"),
      Question(answer: "ri", hint: nil, prompt: "リ"),
      Question(answer: "ru", hint: nil, prompt: "ル"),
      Question(answer: "re", hint: nil, prompt: "レ"),
      Question(answer: "ro", hint: nil, prompt: "ロ"),
      Question(answer: "wa", hint: nil, prompt: "ワ"),
      Question(answer: "wo", hint: nil, prompt: "ヲ"),
      Question(answer: "n", hint: nil, prompt: "ン")
    ]
    return QuestionGroup(questions: questions, title: "Katakana")
  }

  public static func basicPhrases() -> QuestionGroup {
    let questions = [
      Question(answer: "Hello,\nGood Morning", hint: "ohayou", prompt: "おはよう"),
      Question(answer: "Hello,\nGood Afternoon", hint: "konnichiwa", prompt: "こんにちは"),
      Question(answer: "Hello,\nGood Evening", hint: "konnbanwa", prompt: "こんばんは"),
      Question(answer: "Thanks", hint: "arigatou", prompt: "ありがとう"),
      Question(answer: "You're Welcome", hint: "douitashimashite", prompt: "どういたしまして"),
      Question(answer: "~ is.", hint: "~ Desu", prompt: "〜です"),
      Question(answer: "Please give me ~.", hint: "~　wo kudasai", prompt: "〜をください")
    ]
    return QuestionGroup(questions: questions, title: "Basic Phrases")
  }

  public static func numbers() -> QuestionGroup {
    let questions = [
      Question(answer: "one", hint: "ichi", prompt: "一"),
      Question(answer: "two", hint: "ni", prompt: "二"),
      Question(answer: "three", hint: "san", prompt: "三"),
      Question(answer: "four", hint: "shi", prompt: "四"),
      Question(answer: "five", hint: "go", prompt: "五"),
      Question(answer: "six", hint: "roku", prompt: "六"),
      Question(answer: "seven", hint: "nana", prompt: "七"),
      Question(answer: "eight", hint: "hachi", prompt: "八"),
      Question(answer: "nine", hint: "kyu", prompt: "九"),
      Question(answer: "ten", hint: "jyuu", prompt: "十"),
    ]
    return QuestionGroup(questions: questions, title: "Numbers")
  }
}
