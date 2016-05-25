giris = [
  [:b, {release: 1.50, sleep: 0.8}],
  [[:b, :b], {release: 0.15, sleep: 0.1}],
  [:b, {release: 1.50, sleep: 0.8}],
  [[:b, :b], {release: 0.15, sleep: 0.1}],
  [[:b, :b, :b, :b], {release: 0.25, sleep: 0.25}],
  [:b, {release: 0.25, sleep: 0.5}],
  [:b3]
]

parca = [
  [[:e, :fs4, :g]],
  [:ds,  {release: 0.75, sleep: 0.4}],
  [:fs4, {release: 0.25, sleep: 0.1}],
  [:e,   {release: 3, sleep: 1.5}],
  [[:e, :a, :b]],
  [:c5, {release: 0.75, sleep: 0.4}],
  [:b,  {release: 0.25, sleep: 0.1}],
  [:gs, {release: 0.75, sleep: 0.4}],
  [:b,  {release: 0.25, sleep: 0.1}],
  [:a,  {release: 3.0, sleep: 1.5}],
  [[:b, :as, :b], {release: 0.5, sleep: 0.2}],
  [:fs],
  [:fs, {release: 1.75, sleep: 0.8}],
  [:a,  {release: 0.25, sleep: 0.2}],
  [:g,  {release: 0.75, sleep: 0.4}],
  [:ds, {release: 0.25, sleep: 0.1}],
  [:e,  {release: 0.75, sleep: 0.4}],
  [:fs, {release: 0.25, sleep: 0.1}],
  [:g,  {release: 0.75, sleep: 0.4}],
  [:a,  {release: 0.25, sleep: 0.1}],
  [:b,  {release: 0.75, sleep: 0.4}],
  [:c5, {release: 0.25, sleep: 0.1}],
  [:d5, {release: 0.75, sleep: 0.4}],
  [:e5, {release: 0.25, sleep: 0.1}],
  [:d5],
  [[:d, :cs, :d], {release: 0.5, sleep: 0.2}],
  [[:b, :a]],
  [:g,  {release: 3.0, sleep: 1.5}],
  [[:b3, :as3, :b3], {release: 0.5, sleep: 0.2}],
  [[:fs, :b3]],
  [:b,  {release: 0.75, sleep: 0.4}],
  [:a,  {release: 0.25, sleep: 0.1}],
  [[:g, :fs, :g], {release: 0.5, sleep: 0.2}],
  [:e],
  [:e5, {release: 1.75, sleep: 0.8}],
  [:d5, {release: 0.25, sleep: 0.2}],
  [:c5, {release: 0.75, sleep: 0.4}],
  [:b,  {release: 0.25, sleep: 0.1}],
  [:a,  {release: 0.75, sleep: 0.4}],
  [:g,  {release: 0.25, sleep: 0.1}],
  [:fs, {release: 0.75, sleep: 0.4}],
  [:e,  {release: 0.25, sleep: 0.1}],
  [[:b, :b3]],
  [:e,  {release: 3.0, sleep: 1.5}]
]

# notaları çalmak için kullandığımız ana metot
define :play_notes do |notes_array|
  # release ve sleep için değer belirtilmemişse bu değerler kullanılacak
  default_release = 1.0
  default_sleep = 0.5
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

# giriş bölümü
play_notes(giris)
# iki kıta aynı notalara sahip, bu yüzden iki kere çal
2.times { play_notes(parca); sleep 1 }
