unless analytics?
  # For developers to understand when tracking code is being invoked.
  class FakeAnalytics
    trackForm: (element, kind) -> console.log('[trackForm]', kind, element)
    trackLink: (element, kind) -> console.log('[trackLink]', kind, element)
    page: (name) -> console.log('[page]', "Viewed page '#{name}'")

  @analytics = new FakeAnalytics()
