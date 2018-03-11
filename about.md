---
layout: page
title: About
permalink: /about/
---


{% for post in site.categories.languages %}
<li>
  <a href="{{ post.url }}">{{ post.title }}</a>
   <p>{{ post.excerpt }}</p>
</li>
{% endfor %}



[email@domain.com](mailto:email@domain.com)
