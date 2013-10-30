_.mixin(_.str.exports()); # Make underscore.string functions available under the _ namespace

angular.module('deckBuilder', [
    'ui.bootstrap.buttons',
    'ui.bootstrap.tooltip',
    'pasvaz.bindonce'])
  .config ($locationProvider) ->
    # Very important :)
    printWelcomeMessage()

    # HTML5 mode (won't work on GH pages)
    if (window? and /localhost/.match(window.location.host))
      $locationProvider.html5Mode(true)
    else
      $locationProvider.html5Mode(false).hashPrefix('!')

    # Sidesteps the 300ms click event on mobile devices
    FastClick.attach(document.body)

printWelcomeMessage = ->
  # Build up style information
  titleColors = ['#000']
  fadeColors = ['#2D053D', '#440C59', '#60157C', '#79209D', '#9927BF']
  styles =
    _(fadeColors)
      .chain()
      .clone()
      .reverse()
      .concat(titleColors, fadeColors)
      .map((bgColor) -> "font-size: 10px; background: #{ bgColor }; color: white; padding: 3px 1px;")
      .value()
  fadeFormat = _.repeat('%c ', fadeColors.length)

  # Generate content strings
  len = 16
  margin = _.repeat(' ', len)
  title  = _.center('ONO-SENDAI', len)
  credit = _.center('by scott hyndman', len)

  # Print it!
  _.each [ margin, title, credit, margin ], (str) ->
    console.log("#{ fadeFormat }%c #{ str } #{ fadeFormat }", styles...)
  console.log('')
