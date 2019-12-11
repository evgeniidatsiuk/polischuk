# frozen_string_literal: true

module PagesHelper
  def gen_as(n, m)
    form_for(:table, url: cal_path) do |f|
      [f.label(:n),
       f.number_field(:n, value: n, min: 1, max: 10, onChange: 'resize()'),
       f.label(:m),
       f.number_field(:m, value: m, min: 1, max: 10, onChange: 'resize()'),
       f.fields_for(:us) do |s|
         content_tag :div, class: 'row' do
           (1..n).collect { |i| gen_a(s, i, m) }.join(' ').html_safe
         end
       end,
       f.submit].join(' ').html_safe
    end
  end

  def gen_a(f, a, m)
    f.fields_for(a.to_s) do |s|
      [content_tag(:div, a.to_s, class: 'col-2'),
       content_tag(:div, (1..m).collect { |i| gen_f(s, i) }.join(' ').html_safe, class: 'col-8'),
       content_tag(:div, s.number_field(:l, value: 0.5, min: 0, max: 1, step: 0.1), class: 'col-2')].join(' ').html_safe
    end
  end

  def gen_f(f, a)
    content_tag :div, class: 'row' do
      f.fields_for(a.to_s) do |s|
        [content_tag(:div, a.to_s, class: 'col-4'),
         content_tag(:div, s.select(:t, %w[M A H C]), class: 'col-4'),
         content_tag(:div, s.number_field(:u, value: 0.4, min: 0, max: 1, step: 0.2), class: 'col-4')].join(' ').html_safe
      end
    end
  end
end
