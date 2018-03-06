---
layout: page
title:  subtitles
date:  2018-3-4
categories: languages
---

<html>
<body>


{% for image in site.static_files %}
  {% if image.path contains '/images/theother' %}
      <a href="{{ site.url}}{{image.path }}">
        <img src="{{ site.url | append: image.path }}" alt="">
      </a>
  {% endif %}
{% endfor %}


</body>
</html>




