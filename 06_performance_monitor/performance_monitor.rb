def measure(x=1)
  total_time = 0
  x.times do
    start_time = Time.now

    yield

    end_time = Time.now
    total_time += end_time - start_time
  end
  total_time / x
end