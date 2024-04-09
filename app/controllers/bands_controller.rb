class BandsController < ApplicationController
  def create
    parts = Part.all
    song_parts = SongPart.all

    # 最大バンド数を計算
    max_bands = (parts.size.to_f / song_parts.size).ceil
    parts_1 = parts.map { |p| { nickname: p.nickname, song_part: song_parts.find_by(id: p.song_part_id_1)&.name } }
    parts_2 = parts.map { |p| { nickname: p.nickname, song_part: song_parts.find_by(id: p.song_part_id_2)&.name } }

    # parts_1とparts_2のそれぞれについて席次表を生成して保存
    binding.pry
    [parts_1, parts_2].each do |parts|
      parts = parts.shuffle
      bands = song_parts.map { |part| { part: part.name, bands: Array.new(max_bands) } }
      parts_cycle = parts.cycle
      bands.each do |band|
        band[:bands].map! do |_|
          parts_cycle_next = parts_cycle.next
          if parts_cycle_next[:song_part] == band[:part]
            parts_cycle_next[:nickname]
          else
            "Not found"
          end
        end
      end
      save_bands_data(bands)
    end
  end

  private

  # bandsテーブルのデータを保存するためのメソッド
  def save_bands_data(bands)
    bands.each do |row|
      row[:bands].each_with_index do |nickname, index|
        Band.create(part_name: row[:part], band_member: nickname)
      end
    end
  end
end