intro = [
  [:b, {release: 1.50, sleep: 0.8}],
  [:b, {release: 0.15, sleep: 0.1}],
  [:b, {release: 0.15, sleep: 0.1}],
  [:b, {release: 1.50, sleep: 0.8}],
  [:b, {release: 0.15, sleep: 0.1}],
  [:b, {release: 0.15, sleep: 0.1}],
  [:b, {release: 0.25, sleep: 0.25}],
  [:b, {release: 0.25, sleep: 0.25}],
  [:b, {release: 0.25, sleep: 0.25}],
  [:b, {release: 0.25, sleep: 0.25}],
  [:b, {release: 0.25, sleep: 0.5}],
  [:b3, {}]
]

notalar = [
  [:e, {}],
  [:fs4, {}],
  [:g, {}],
  [:ds, {release: 0.75, sleep: 0.4}],
  [:fs4, {release: 0.25, sleep: 0.1}],
  [:e, {release: 3, sleep: 1.5}],
  [:e, {}],
  [:a, {}],
  [:b, {}],
  [:c5, {release: 0.75, sleep: 0.4}],
  [:b, {release: 0.25, sleep: 0.1}],
  [:gs, {release: 0.75, sleep: 0.4}],
  [:b, {release: 0.25, sleep: 0.1}],
  [:a, {release: 3.0, sleep: 1.5}],
  [:b, {release: 0.5, sleep: 0.2}],
  [:as, {release: 0.5, sleep: 0.2}],
  [:b, {release: 0.5, sleep: 0.2}],
  [:fs, {}],
  [:fs, {release: 1.75, sleep: 0.8}],
  [:a, {release: 0.25, sleep: 0.2}],
  [:g, {release: 0.75, sleep: 0.4}],
  [:ds, {release: 0.25, sleep: 0.1}],
  [:e, {release: 0.75, sleep: 0.4}],
  [:fs, {release: 0.25, sleep: 0.1}],
  [:g, {release: 0.75, sleep: 0.4}],
  [:a, {release: 0.25, sleep: 0.1}],
  [:b, {release: 0.75, sleep: 0.4}],
  [:c5, {release: 0.25, sleep: 0.1}],
  [:d5, {release: 0.75, sleep: 0.4}],
  [:e5, {release: 0.25, sleep: 0.1}],
  [:d5, {}],
  [:d, {release: 0.5, sleep: 0.2}],
  [:cs, {release: 0.5, sleep: 0.2}],
  [:d, {release: 0.5, sleep: 0.2}],
  [:b, {}],
  [:a, {}],
  [:g, {release: 3, sleep: 1.5}],
  [:b3, {release: 0.5, sleep: 0.2}],
  [:as3, {release: 0.5, sleep: 0.2}],
  [:b3, {release: 0.5, sleep: 0.2}],
  [:fs, {}],
  [:b3, {}],
  [:b, {release: 0.75, sleep: 0.4}],
  [:a, {release: 0.25, sleep: 0.1}],
  [:g, {release: 0.5, sleep: 0.2}],
  [:fs, {release: 0.5, sleep: 0.2}],
  [:g, {release: 0.5, sleep: 0.2}],
  [:e, {}],
  [:e5, {release: 1.75, sleep: 0.8}],
  [:d5, {release: 0.25, sleep: 0.2}],
  [:c5, {release: 0.75, sleep: 0.4}],
  [:b, {release: 0.25, sleep: 0.1}],
  [:a, {release: 0.75, sleep: 0.4}],
  [:g, {release: 0.25, sleep: 0.1}],
  [:fs, {release: 0.75, sleep: 0.4}],
  [:e, {release: 0.25, sleep: 0.1}],
  [:b, {}],
  [:b3, {}],
  [:e, {release: 3, sleep: 1.5}]
]

intro.each do |nota|
  stime = nota.last.delete(:sleep) || 0.5
  play nota.first, nota.last
  sleep stime
end

2.times do
  notalar.each do |nota|
    stime = nota.last[:sleep] || 0.5
    play nota.first, nota .last
    sleep stime
  end
end