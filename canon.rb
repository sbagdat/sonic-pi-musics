canon = [
  [[:g, :b, :a, :g, :fs, :d, :e, :cs5, :d5, :fs5, :a5, :a, :b, :g, :a, :fs, :d, :d5], {sleep: 0.6}],
  [:d5, {release: 2, sleep: 1}],
  [:cs5, {release: 0.6, sleep: 0.3}],
  [:a5],
  [[:fs5, :g5], {release: 0.30, sleep: 0.2}],
  [:a5],
  [[:fs5, :g5, :a5, :a, :b, :cs5, :d5, :e5, :fs5, :g5], {release: 0.30, sleep: 0.2}],
  [:fs5],
  [[:d5, :e5], {release: 0.30, sleep: 0.2}],
  [:fs5],
  [[:fs, :g, :a, :b, :a, :g, :a, :fs, :g, :a], {release: 0.30, sleep: 0.2}],
  [:g],
  [[:b, :a], {release: 0.30, sleep: 0.2}],
  [:g],
  [[:fs, :e, :d, :e, :fs, :g, :a, :b], {release: 0.30, sleep: 0.2}],
  [:g],
  [[:b, :a], {release: 0.30, sleep: 0.2}],
  [:b],
  [[:cs5, :d5, :a, :b, :cs5, :d5, :e5, :fs5, :g5, :a5], {release: 0.30, sleep: 0.2}],
  [:fs5],
  [[:d5, :e5], {release: 0.30, sleep: 0.2}],
  [:fs5],
  [[:e5, :d5, :e5, :cs5, :d5, :e5, :fs5, :e5, :d5, :cs5], {release: 0.30, sleep: 0.2}],
  [:d5],
  [[:b, :cs5], {release: 0.30, sleep: 0.2}],
  [[:d5, :d, :e, :fs, :g, :fs, :e, :fs, :d5, :cs5, :d5], {release: 0.30, sleep: 0.2}],
  [:b],
  [[:d5, :cs5], {release: 0.30, sleep: 0.2}],
  [:b],
  [[:a, :g, :a, :g, :fs, :g, :a, :b, :cs5, :d5], {release: 0.30, sleep: 0.2}],
  [:b],
  [[:d5, :cs5], {release: 0.30, sleep: 0.2}],
  [:d5],
  [[:cs5, :b, :cs5, :d5, :e5, :d5, :cs5, :d5, :b, :cs5], {release: 0.30, sleep: 0.2}],
  [:d5, {release: 2, sleep: 1}],
  [:fs5, {release: 0.6, sleep: 0.3}],
  [[:fs5, :g5]],
  [[:fs5, :e5], {release: 0.6, sleep: 0.3}],
  [:d5, {release: 2, sleep: 1}],
  [[:d5, :d5, :e5, :d5, :cs5], {release: 0.6, sleep: 0.3}],
  [[:b, :d5], {release: 3.0, sleep: 1.5}],
  [[:d5, :cs55, :b, :cs5], {release: 0.6, sleep: 0.3}],
  [:a, {release: 2.0, sleep: 1.0}],
  [:a, {release: 0.6, sleep: 0.3}],
  [:d5, {release: 6.0, sleep: 3.0}]
]

# notaları çalmak için kullandığımız ana metot
define :play_notes do |notes_array|
  # release ve sleep için değer belirtilmemişse bu değerler kullanılacak
  default_release = 1.0
  default_sleep = 0.4
  # her bir nota dizisi için
  notes_array.each do |note|
    # notadan başka parametre gönderilmemiş ise; boş sözlük kullan
    params = note.last.is_a?(Hash) ? note.last : {}
    # eğer birden fazla nota bir arada gönderilmişse
    if note.first.is_a? Array
      # dizi içindeki her bir notayı ayrı ayrı çal
      note.first.each do |sub_note|
        play sub_note, release: (params[:release] || default_release)
        sleep params[:sleep] || default_sleep
      end
    else
      # tek bir nota gönderilmişse onu çal
      play note.first, release: (params[:release] || default_release)
      sleep params[:sleep] || default_sleep
    end
  end
end

play_notes(canon)
