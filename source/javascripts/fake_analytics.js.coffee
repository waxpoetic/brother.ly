unless analytics?
  # For developers to understand when tracking code is being invoked.
  class FakeAnalytics
    trackForm: (element, kind, options) -> console.log('[trackForm]', kind, element, options)
    trackLink: (element, kind, options) -> console.log('[trackLink]', kind, element, options)
    page: (name) -> console.log('[page]', "Viewed page '#{name}'")

  @analytics = new FakeAnalytics()
