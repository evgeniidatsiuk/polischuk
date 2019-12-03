class PagesController < ApplicationController
  def index
    n =2
    m =3
  end

  def cal
    as = params[:table]
    as.each do |a|
      x = {}
      f = {}
      a.us.each do |id,u,t|
        t= ret[t.to_sym]
        x[id]= if u<=0.5
          Math.sqrt(u/2)*(t.last-t.first)+t.first
        else
          t.second-Math.sqrt((1-u)/2)*(t.last-t.first)
        end
        f[id] = x[id]/100
      end
      al = f.values.sum/f.length
      r = al*a.k
    end
    # step 4
    w = [1,2,3,4,5,6,7,8,9,10]
    v = []
    w.each do |i|
      puts i
      p "sum", i.to_f/w.sum
      v << i.to_f/w.sum
    end
    v = [0.37, 0.3, 0.33]
    l = [0.2623,0.1262, 0.2915]
    #step 5
    y3 = []
      3.times do |i|
        puts "#{v[i]} * ( 1-#{l[i]})"
         y3 << (v[i]*(1-l[i]))
    end
    y3 = 1- y3.sum
    #step 6
    z = []
    s = [1,2,3,4]
    r = [1,2,3,4]
    4.times do |i|
      z << s[i]*r[i]
    end
    u = []
    a = []
    s.each do |x|
      a << x.to_f * 0.1
    b = []
    s.each do |x|
      b << x
    end
    5.times do |i|
      u << if z[i] <= a[i]
            0
          elsif a[i] < z[i] <= b[i]
            (z[i] - a[i])/b[i]-a[i]
          elsif z[i] > b[i]
            1
    end
    #step 7
    ###
    # step 8
    v = [0.37, 0.3, 0.33]
    o = [0.2623,0.1262, 0.2915]
    y3 = []
      3.times do |i|
        puts "#{v[i]} * ( 1-#{o[i]})"
         y3 << (v[i]*(1-o[i]))
    end
    y3 = 1- y3.sum
  end

  def ret
    {"M":[0,20],"A":[20,50],"H":[50,80],"C":[80,100]}
  end
end
