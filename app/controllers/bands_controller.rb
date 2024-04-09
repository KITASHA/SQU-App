class BandsController < ApplicationController
  def index
    @parts = Part.all
    @songs = Song.all
    parts = [
  { nickname: "name1", song_part_1: "Lead", song_part_2: "Lead" },
  { nickname: "name2", song_part_1: "1st", song_part_2: "1st" },
  { nickname: "name3", song_part_1: "2nd", song_part_2: "2nd" },
  { nickname: "name4", song_part_1: "3rd", song_part_2: "3rd" },
  { nickname: "name5", song_part_1: "Bass", song_part_2: "Bass" },
  { nickname: "name6", song_part_1: "V.P", song_part_2: "V.P" },
  { nickname: "name7", song_part_1: "Lead", song_part_2: "Lead" },
  { nickname: "name8", song_part_1: "1st", song_part_2: "1st" },
  { nickname: "name9", song_part_1: "2nd", song_part_2: "2nd" },
  { nickname: "name10", song_part_1: "3rd", song_part_2: "3rd" },
  { nickname: "name11", song_part_1: "Bass", song_part_2: "Bass" },
  { nickname: "name12", song_part_1: "V.P", song_part_2: "V.P" },
  { nickname: "name13", song_part_1: "Lead", song_part_2: "Lead" },
  { nickname: "name14", song_part_1: "1st", song_part_2: "1st" },
  { nickname: "name15", song_part_1: "2nd", song_part_2: "2nd" },
  { nickname: "name16", song_part_1: "3rd", song_part_2: "3rd" },
  { nickname: "name17", song_part_1: "Bass", song_part_2: "Bass" },
  { nickname: "name18", song_part_1: "V.P", song_part_2: "V.P" },
  { nickname: "name19", song_part_1: "Lead", song_part_2: "Lead" },
  { nickname: "name20", song_part_1: "1st", song_part_2: "1st" }
]
# 各パートのリストを定義
song_parts = ["Lead", "1st", "2nd", "3rd", "Bass", "V.P"]

# 最大バンド数を計算
max_bands = (parts.size.to_f / song_parts.size).ceil

# parts配列からsong_part_1とsong_part_2をそれぞれ取り出して新たな配列を作成
parts_1 = parts.map { |p| {nickname: p[:nickname], song_part: p[:song_part_1]}}
parts_2 = parts.map { |p| {nickname: p[:nickname], song_part: p[:song_part_2]}}

# parts_1とparts_2のそれぞれについて処理を行う
[parts_1, parts_2].each do |parts|
  # parts配列をランダムに並べ替え
  parts = parts.shuffle

  # バンドとそのパートを保持する辞書を準備
  # partとはパートの名前、bandsはそのパートのメンバーリスト（初期値はnilのリスト）
  bands = song_parts.map{ |part| { part: part, bands: Array.new(max_bands) } }

  # 無限ループを作るためにpartsをcycleさせてparts_cycleを作成
  parts_cycle = parts.cycle
  # バンドごとにnilをパートに適したメンバー（ニックネーム）で置き換え
  bands.each do |band|
    band[:bands].map! { |b| parts_cycle.next[:nickname] until parts_cycle.peek[:song_part] == band[:part]; parts_cycle.next[:nickname] }
  end

  # 席次表の出力
  puts 'part' + (1..max_bands).map { |i| "\tband#{i}" }.join

  # 各行を出力
  bands.each do |row|
    puts row[:part] + row[:bands].map { |b| "\t#{b}" }.join
  end
end
  end
end
