from __future__ import print_function, unicode_literals, absolute_import, division
from django import template
register = template.Library()

@register.inclusion_tag('divider.html')
def divider(text, icon=None, anchor=None):
    params = dict(text=text, icon=icon, anchor=anchor)
    return params


@register.inclusion_tag('header.html')
def header(text, icon=None, tag='h2'):
    params = dict(text=text, icon=icon, tag=tag)
    return params


@register.inclusion_tag('speaker.html')
def speaker(name, website, title, recording, internal=None, slides=None, description=None):
    '''
    recording (True/False) - Will the talk be recorded?
    internal - Restrict recording to be shared **only** with PSU students (True)
    '''
    params = dict(name=name, website=website, title=title, recording=recording, internal=internal, slides=slides, description=description)
    return params
