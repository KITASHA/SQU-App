class BandsController < ApplicationController
  def index
    parts = Part.all
    song_parts = SongPart.all
    song_part_names = song_parts.pluck(:name)

    # バンドの準備
    bands_1 = prepare_bands(parts, song_part_names)
    bands_2 = prepare_bands(parts, song_part_names)

    @bands_1=bands_1
    @bands_2=bands_2

    @song_1 = Song.first
    @song_2 = Song.second
  end

  private

  def prepare_bands(parts, song_part_names)
    # 各パートごとにニックネームをまとめる
    grouped_parts = parts.group_by { |part| part[:song_part_id_1] }

    # バンドを準備
    bands = {}

    # パートごとにバンドを構築
    grouped_parts.each do |part, members|
      bands[song_part_names[part]] = members.map { |member| member[:nickname] }
    end

    # 最大バンド数を取得
    max_band_count = grouped_parts.values.map(&:size).max

    # 最大バンド数に満たない配列で、配列内の要素をコピーしてすべての配列の要素数を同じにする
    bands.each do |part, members|
      members.shuffle! # メンバーをランダムに並び替える
      while members.size < max_band_count
        element_to_copy = members[members.size % members.size]
        members << element_to_copy
      end
    end

    bands
  end

end