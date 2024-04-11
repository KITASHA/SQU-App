class BandsController < ApplicationController
  
  def index
    parts = Part.all
    song_parts = SongPart.all
    song_part_names = song_parts.pluck(:name)
  
    # バンドの準備
    bands_1 = prepare_bands_1(parts, song_part_names)
    bands_2 = prepare_bands_2(parts, song_part_names)
  
    order = ["Lead", "top", "2nd", "3rd", "Bass", "V.P."]
    @bands_1 = order.map { |part_name| [part_name, bands_1[part_name]] }.to_h
    @bands_2 = order.map { |part_name| [part_name, bands_2[part_name]] }.to_h
    binding.pry  
    @song_1 = Song.first
    @song_2 = Song.second
  end


  private

  def prepare_bands_1(parts, song_part_names)
    # 各パートごとにニックネームをまとめる
    grouped_parts = parts.group_by { |part| part[:song_part_id_1] }
  
    # バンドを準備
    bands = HashWithIndifferentAccess.new # 順序付きのハッシュを作成
  
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

  def prepare_bands_2(parts, song_part_names)
    # 各パートごとにニックネームをまとめる
    grouped_parts = parts.group_by { |part| part[:song_part_id_2] }
  
    # バンドを準備
    bands = HashWithIndifferentAccess.new # 順序付きのハッシュを作成
  
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