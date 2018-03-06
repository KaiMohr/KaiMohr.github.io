---
layout: page
title:  gallery
date:  2018-2-24
categories: test
---

<!DOCTYPE html>
<html>
<body>


{% for image in site.static_files %}
  {% if image.path contains '/images/gallery-1' %}
      <a href="{{ site.url}}{{image.path }}">
        <img src="{{ site.url | append: image.path }}" alt="">
      </a>
  {% endif %}
{% endfor %}


</body>
</html>




