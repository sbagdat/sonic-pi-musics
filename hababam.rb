hababam = [
  [[:e5, :d5]],
  [:e5, {release: 0.5, sleep: 0.25}],
  [[:b, :a]],
  [:b, {release: 0.5, sleep: 0.25}],
  [[:gs, :f]],
  [[:gs, :gs, :f, :e, :f], {release: 0.5, sleep: 0.25}],
  [[:f, :e]],
  [[:d, :d, :f], {release: 0.5, sleep: 0.25}],
  [:e, {release: 1.0, sleep: 0.5}],
  [[:gs, :a, :gs, :a]],
  [:b, {release: 0.5, sleep: 0.25}],
  [[:e5, :d5]],
  [:e5, {release: 0.5, sleep: 0.25}],
  [[:b, :a]],
  [:b, {release: 0.5, sleep: 0.25}],
  [[:gs, :f]],
  [[:gs, :gs, :f, :e], {release: 0.5, sleep: 0.25}],
  [:e, {release: 1.0, sleep: 0.5}],
  [[:gs, :b], {release: 1.0, sleep: 0.5}],
  [[:e5, :e5], {release: 0.5, sleep: 0.25}],
  [:e5, {release: 1.0, sleep: 0.5}],
  [:b, {release: 1.5, sleep: 0.75}],
  [[:c5, :d5, :c5, :b]],
  [:a, {release: 1.5, sleep: 0.75}],
  [:gs, {release: 0.75, sleep: 0.3750}],
  [:f],
  [[:gs, :gs, :a], {release: 0.5, sleep: 0.25}],
  [:b,  {release: 1.0, sleep: 0.5}],
  [[:e, :f, :gs, :a]],
  [:b,  {release: 0.5, sleep: 0.25}],
  [:e5, {release: 1.0, sleep: 0.5}],
  [:b,  {release: 1.5, sleep: 0.75}],
  [[:c5, :d5, :c5, :b]],
  [:a,  {release: 1.5, sleep: 0.75}],
  [:gs, {release: 0.75, sleep: 0.375}],
  [:e],
  [[:f, :f, :d], {release: 0.5, sleep: 0.25}],
  [:e,  {release: 1.0, sleep: 0.5}],
  [[:b, :a, :gs, :f]],
  [:e,  {release: 0.5, sleep: 0.25}],
  [:e5, {release: 1.0, sleep: 0.5}],
  [:b, {release: 1.5, sleep: 0.75}],
  [[:c5, :d5, :c5, :b]],
  [:a,  {release: 1.5, sleep: 0.75}],
  [:gs, {release: 0.75, sleep: 0.3750}],
  [:f],
  [[:gs, :gs, :a], {release: 0.5, sleep: 0.25}],
  [:b,  {release: 1.0, sleep: 0.5}],
  [[:e, :f, :gs, :a]],
  [:b,  {release: 0.5, sleep: 0.25}],
  [:e5, {release: 1.0, sleep: 0.5}],
  [:b,  {release: 1.5, sleep: 0.75}],
  [[:c5, :d5, :c5, :b]],
  [:a,  {release: 1.5, sleep: 0.75}],
  [:gs, {release: 0.75, sleep: 0.3750}],
  [:e],
  [[:f, :f, :d], {release: 0.5, sleep: 0.25}],
  [:e,  {release: 1.0, sleep: 0.5}],
  [[:b, :a, :gs, :f]],
  [:e,  {release: 0.5,  sleep: 0.25}]
]

use_synth :hoover

# notaları çalmak için kullandığımız ana metot
define :play_notes do |notes_array|
  # release ve sleep için değer belirtilmemişse bu değerler kullanılacak
  default_release = 0.25
  default_sleep = 0.125
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

play_notes(hababam)
