require_relative '../../config/environment'
require_relative '../embedding_generator'

generator = EmbeddingGenerator.new(ENV['OPENAI_API_KEY'])

text = """
SQUARE アカペラサークル

コンセプト
「誰でも気軽に入れるアカペラサークル」
岡山にはアカペラに興味がある未経験者が多く、アカペラサークルがなかったため、設立時にこのコンセプトを掲げました。未経験者・経験者問わず入会可能で、県外からのメンバーも多数参加しています。

「SQUARE」という名前は、アカペラを始めたい人たちが集まる「広場」のイメージから付けられました。

基本方針
- **出会いの場**: SQUAREはメンバーが集まり、バンドを組んで自分たちで練習する場所です。
- **サポート**: アカペラ初心者への基礎的な情報提供や導入支援も行っています。
- **パフォーマンスの場**: メンバー全員で協力してパフォーマンスの場を作り上げることを重視しています。

活動費・年会費
- **年会費**: 2000円（半年ごとに1000円徴収、前期：11～4月、後期：5～10月）
- **定期活動会費**: 800円（参加時）
- **休止オプション**: 遠方やライフスタイルの変化により活動が困難な場合、年会費なしで定期活動会参加費1500円。

お問い合わせ
- ご不明点があればいつでもお問い合わせください。
"""

# エンベディングを生成してファイルに保存
embedding = generator.generate_embedding(text)
file_path = 'lib/embeddings/square_embedding.pkl'
File.open(file_path, 'wb') do |file|
  file.write(Marshal.dump(embedding))
end

# 保存したエンベディングをデータベースにインポート
embedding_data = File.open(file_path, 'rb') { |f| Marshal.load(f) }
Embedding.create(text: text, embedding: embedding_data)

puts "Embeddings imported successfully!"
