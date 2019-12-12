# frozen_string_literal: true

module PagesHelper
  def gen_as(n, m)
    form_for(:table, url: cal_path, method: :get) do |f|
      [f.label(:n),
       f.number_field(:n, value: n, min: 1, max: 10, onChange: 'resize()'),
       f.label(:m),
       f.number_field(:m, value: m, min: 1, max: 10, onChange: 'resize()'),
       f.fields_for(:us) do |s|
         content_tag :table do
           [content_tag(:tr,
                        [content_tag(:td, 'A(i) - Актив'),
                         content_tag(:td, 'k(i) - Загроза'),
                         content_tag(:td, 't'),
                         content_tag(:td, 'u'),
                         content_tag(:td, 'l'),
                         content_tag(:td, 'w'),
                         content_tag(:td, 'прибуток роботи МІС (серверу) за годину (Євро)'),
                         content_tag(:td, 'час відновлення роботи серверу (година)'),
                         content_tag(:td, 'вартість відновлення роботи МІС (Євро)')].join(' ').html_safe),
            (1..n).collect { |i| gen_a(s, i, m) }.join(' ').html_safe].join(' ').html_safe
         end
       end,
       f.submit].join(' ').html_safe
    end
  end

  def gen_a(f, a, m)
    f.fields_for(a.to_s) do |s|
      content_tag(:tr,
                  [content_tag(:td, a.to_s, rowspan: m),
                   gen_f(s, 1),
                   content_tag(:td, s.number_field(:l, value: 0.5, min: 0, max: 1, step: 0.1), rowspan: m),
                   content_tag(:td, s.number_field(:w, value: 0, min: 0, max: 100, step: 1), rowspan: m),
                   content_tag(:td, s.number_field(:sl, value: 0, min: 0, step: 100), rowspan: m),
                   content_tag(:td, s.number_field(:t, value: 1, min: 1, max: 24, step: 1), rowspan: m),
                   content_tag(:td, s.number_field(:v, value: 0, min: 0, step: 100), rowspan: m),
                   (2..m).collect { |i| content_tag(:tr, gen_f(s, i)) }.join(' ').html_safe].join(' ').html_safe)
    end
  end

  def gen_f(f, a)
    content_tag :div, class: 'row' do
      f.fields_for(a.to_s) do |s|
        [content_tag(:td, a.to_s),
         content_tag(:td, s.select(:t, %w[M A H C])),
         content_tag(:td, s.number_field(:u, value: 0.4, min: 0, max: 1, step: 0.2))].join(' ').html_safe
      end
    end
  end
end
