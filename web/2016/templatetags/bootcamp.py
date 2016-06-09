from __future__ import print_function, unicode_literals, absolute_import, division
from django import template
from pyblue.templatetags.pytags import markdown, match_file
from django.utils.html import format_html
from django.utils.safestring import mark_safe
from pyblue.templatetags.pytags import find
register = template.Library()

@register.inclusion_tag('divider.html')
def divider(text, icon=None):
    params = dict(text=text, icon=icon)
    return params


@register.inclusion_tag('header.html')
def header(text, icon=None):
    params = dict(text=text, icon=icon)
    return params
