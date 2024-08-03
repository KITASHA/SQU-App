class GroupsController < ApplicationController
  before_action :basic_auth


  def index
    # すべてのPartレコードを取得
    parts = Part.all
    # すべてのSongPartレコードを取得
    song_parts = SongPart.all
    # SongPartのIDをキー、名前を値とするハッシュを作成
    song_part_names = song_parts.index_by(&:id).transform_values(&:name)
    excluded_key = 0
    # グループの準備
    groups_1 = prepare_groups_1(parts, song_part_names)
    groups_2 = prepare_groups_2(parts, song_part_names)
  
    # 表示順序を指定
    order = ["Lead", "top", "2nd", "3rd", "Bass", "V.P."]
    # 表示順序に従ってグループを整形
    @groups_1 = order.map { |part_name| [part_name, groups_1[part_name]] }.to_h
    @groups_2 = order.map { |part_name| [part_name, groups_2[part_name]] }.to_h

    # 最初の2曲を取得
    @song_1 = Song.first
    @song_2 = Song.second
  end

  private

  def prepare_groups_1(parts, song_part_names)
    # パートID1でグループ化
    grouped_parts = parts.group_by(&:song_part_id_1)
    # 通常のハッシュを作成
    groups = {}
  
    # パートごとにニックネームを収集
    grouped_parts.each do |part_id, members|
      groups[song_part_names[part_id]] = members.map(&:nickname)
    end
  
    # 最大グループ数を取得（除外キーを考慮）
    excluded_key = "---"
    max_group_count = grouped_parts.reject { |key, _| song_part_names[key] == excluded_key }.values.map(&:size).max
  
    # メンバーが不足しているグループを補充
    groups.each do |part, members|
      next if part == excluded_key # 除外キーのグループをスキップ
  
      members.shuffle!
      additional_members = members.cycle.take(max_group_count - members.size).shuffle
  
      additional_members.each do |member|
        members << member
      end
    end
  end
  

  def prepare_groups_2(parts, song_part_names)
    # パートID2でグループ化
    grouped_parts = parts.group_by(&:song_part_id_2)
    # 通常のハッシュを作成
    groups = {}
  
    # パートごとにニックネームを収集
    grouped_parts.each do |part_id, members|
      groups[song_part_names[part_id]] = members.map(&:nickname)
    end
  
    # 最大グループ数を取得（除外キーを考慮）
    excluded_key = "---"
    max_group_count = grouped_parts.reject { |key, _| song_part_names[key] == excluded_key }.values.map(&:size).max
  
    # メンバーが不足しているグループを補充
    groups.each do |part, members|
      next if part == excluded_key # 除外キーのグループをスキップ
  
      members.shuffle!
      additional_members = members.cycle.take(max_group_count - members.size).shuffle
  
      additional_members.each do |member|
        members << member
      end
    end
  end
  

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER_SQUARE'] && password == ENV['BASIC_AUTH_PASSWORD_SQUARE']
    end
  end

end
