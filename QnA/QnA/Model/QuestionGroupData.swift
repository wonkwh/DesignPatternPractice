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
extension QueryGroup {

  public static func allGroups() -> [QueryGroup] {
    return [hiragana(), katakana(), basicPhrases(), numbers()]
  }

  public static func hiragana() -> QueryGroup {
    let querys = [
      Query(answer: "a", hint: nil, prompt: "아"),
      Query(answer: "i", hint: nil, prompt: "이"),
      Query(answer: "u", hint: nil, prompt: "우"),
      Query(answer: "e", hint: nil, prompt: "에"),
      Query(answer: "o", hint: nil, prompt: "오"),
      Query(answer: "ka", hint: nil, prompt: "가"),
      Query(answer: "ki", hint: nil, prompt: "기"),
      Query(answer: "ku", hint: nil, prompt: "구"),
      Query(answer: "ke", hint: nil, prompt: "케"),
      Query(answer: "ko", hint: nil, prompt: "코"),
      Query(answer: "sa", hint: nil, prompt: "사"),
      Query(answer: "shi", hint: nil, prompt: "시"),
      Query(answer: "su", hint: nil, prompt: "수"),
      Query(answer: "se", hint: nil, prompt: "세"),
      Query(answer: "so", hint: nil, prompt: "소"),
      Query(answer: "ta", hint: nil, prompt: "타"),
      Query(answer: "chi", hint: nil, prompt: "치"),
      Query(answer: "tsu", hint: nil, prompt: "츠"),
      Query(answer: "te", hint: nil, prompt: "테"),
      Query(answer: "to", hint: nil, prompt: "토"),
      Query(answer: "na", hint: nil, prompt: "나"),
      Query(answer: "ni", hint: nil, prompt: "니"),
      Query(answer: "nu", hint: nil, prompt: "누"),
      Query(answer: "ne", hint: nil, prompt: "네"),
      Query(answer: "no", hint: nil, prompt: "노"),
      Query(answer: "ha", hint: nil, prompt: "하"),
      Query(answer: "hi", hint: nil, prompt: "히"),
      Query(answer: "fu", hint: nil, prompt: "푸"),
      Query(answer: "he", hint: nil, prompt: "헤"),
      Query(answer: "ho", hint: nil, prompt: "호"),
      Query(answer: "ma", hint: nil, prompt: "마"),
      Query(answer: "mi", hint: nil, prompt: "미"),
      Query(answer: "mu", hint: nil, prompt: "무"),
      Query(answer: "me", hint: nil, prompt: "메"),
      Query(answer: "mo", hint: nil, prompt: "모"),
      Query(answer: "ya", hint: nil, prompt: "야"),
      Query(answer: "yu", hint: nil, prompt: "유"),
      Query(answer: "yo", hint: nil, prompt: "요"),
      Query(answer: "ra", hint: nil, prompt: "라"),
      Query(answer: "ri", hint: nil, prompt: "리"),
      Query(answer: "ru", hint: nil, prompt: "루"),
      Query(answer: "re", hint: nil, prompt: "레"),
      Query(answer: "ro", hint: nil, prompt: "로"),
      Query(answer: "wa", hint: nil, prompt: "와"),
      Query(answer: "wo", hint: nil, prompt: "우"),
      Query(answer: "n", hint: nil, prompt: "엔")
    ]
    return QueryGroup(queries: querys, title: "Hiragana")
  }

  public static func katakana() -> QueryGroup {
    let querys = [
      Query(answer: "a", hint: nil, prompt: "ア"),
      Query(answer: "i", hint: nil, prompt: "イ"),
      Query(answer: "u", hint: nil, prompt: "ウ"),
      Query(answer: "e", hint: nil, prompt: "エ"),
      Query(answer: "o", hint: nil, prompt: "オ"),
      Query(answer: "ka", hint: nil, prompt: "カ"),
      Query(answer: "ki", hint: nil, prompt: "キ"),
      Query(answer: "ku", hint: nil, prompt: "ク"),
      Query(answer: "ke", hint: nil, prompt: "ケ"),
      Query(answer: "ko", hint: nil, prompt: "コ"),
      Query(answer: "sa", hint: nil, prompt: "サ"),
      Query(answer: "shi", hint: nil, prompt: "シ"),
      Query(answer: "su", hint: nil, prompt: "ス"),
      Query(answer: "se", hint: nil, prompt: "セ"),
      Query(answer: "so", hint: nil, prompt: "ソ"),
      Query(answer: "ta", hint: nil, prompt: "タ"),
      Query(answer: "chi", hint: nil, prompt: "チ"),
      Query(answer: "tsu", hint: nil, prompt: "ツ"),
      Query(answer: "te", hint: nil, prompt: "テ"),
      Query(answer: "to", hint: nil, prompt: "ト"),
      Query(answer: "na", hint: nil, prompt: "ナ"),
      Query(answer: "ni", hint: nil, prompt: "ニ"),
      Query(answer: "nu", hint: nil, prompt: "ヌ"),
      Query(answer: "ne", hint: nil, prompt: "ネ"),
      Query(answer: "no", hint: nil, prompt: "ノ"),
      Query(answer: "ha", hint: nil, prompt: "ハ"),
      Query(answer: "hi", hint: nil, prompt: "ヒ"),
      Query(answer: "fu", hint: nil, prompt: "フ"),
      Query(answer: "he", hint: nil, prompt: "ヘ"),
      Query(answer: "ho", hint: nil, prompt: "ホ"),
      Query(answer: "ma", hint: nil, prompt: "マ"),
      Query(answer: "mi", hint: nil, prompt: "ミ"),
      Query(answer: "mu", hint: nil, prompt: "ム"),
      Query(answer: "me", hint: nil, prompt: "メ"),
      Query(answer: "mo", hint: nil, prompt: "モ"),
      Query(answer: "ya", hint: nil, prompt: "ヤ"),
      Query(answer: "yu", hint: nil, prompt: "ユ"),
      Query(answer: "yo", hint: nil, prompt: "ヨ"),
      Query(answer: "ra", hint: nil, prompt: "ラ"),
      Query(answer: "ri", hint: nil, prompt: "リ"),
      Query(answer: "ru", hint: nil, prompt: "ル"),
      Query(answer: "re", hint: nil, prompt: "レ"),
      Query(answer: "ro", hint: nil, prompt: "ロ"),
      Query(answer: "wa", hint: nil, prompt: "ワ"),
      Query(answer: "wo", hint: nil, prompt: "ヲ"),
      Query(answer: "n", hint: nil, prompt: "ン")
    ]
    return QueryGroup(queries: querys, title: "Katakana")
  }

  public static func basicPhrases() -> QueryGroup {
    let querys = [
      Query(answer: "Hello,\nGood Morning", hint: "ohayou", prompt: "おはよう"),
      Query(answer: "Hello,\nGood Afternoon", hint: "konnichiwa", prompt: "こんにちは"),
      Query(answer: "Hello,\nGood Evening", hint: "konnbanwa", prompt: "こんばんは"),
      Query(answer: "Thanks", hint: "arigatou", prompt: "ありがとう"),
      Query(answer: "You're Welcome", hint: "douitashimashite", prompt: "どういたしまして"),
      Query(answer: "~ is.", hint: "~ Desu", prompt: "〜です"),
      Query(answer: "Please give me ~.", hint: "~　wo kudasai", prompt: "〜をください")
    ]
    return QueryGroup(queries: querys, title: "Basic Phrases")
  }

  public static func numbers() -> QueryGroup {
    let querys = [
      Query(answer: "one", hint: "ichi", prompt: "一"),
      Query(answer: "two", hint: "ni", prompt: "二"),
      Query(answer: "three", hint: "san", prompt: "三"),
      Query(answer: "four", hint: "shi", prompt: "四"),
      Query(answer: "five", hint: "go", prompt: "五"),
      Query(answer: "six", hint: "roku", prompt: "六"),
      Query(answer: "seven", hint: "nana", prompt: "七"),
      Query(answer: "eight", hint: "hachi", prompt: "八"),
      Query(answer: "nine", hint: "kyu", prompt: "九"),
      Query(answer: "ten", hint: "jyuu", prompt: "十"),
    ]
    return QueryGroup(queries: querys, title: "Numbers")
  }
}
