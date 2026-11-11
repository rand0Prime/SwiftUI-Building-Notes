/* These notes are stream of consciousness and the code for each note in total is 
not intended to be ran for any practical purpose. The goal is to help make sense
of what is happening in the body of an app project, and the notes are written by
a complete coding beginner (me), intended to be used by a beginner (me), and 
likely as a result lack the experience / accuracy of term usage that would be 
prominent in the works of someone more experienced. With that in mind, I hope
that if you are a beginner like me and are learning Swift that these notes
are as helpful to you reading them as they have been to me writing them. 
Alons-y! */

If you find this helpful, send me a cup of tea. :)
https://ko-fi.com/guntherhammel

*** The first entry for each topic will likely have an explanation (as I understood it at the time) of the topic in general, and later entries will likely have more intricate or complicated code.

# Table of Contents

[Alerts, message:](#alerts-message)

[Background (.background, .ultraThinMaterial)](#background-background-ultrathinmaterial)

[Button (buttonStyle, tint, action:, } label {, .destructive, Label, .cancel)](#button-buttonstyle-tint-action--label--destructive-label-cancel)

[Color (color.secondary, custom colors)](#color-colorsecondary-custom-colors)

[@FocusState (.isFocused)](#focusstate-isfocused)

[ForEach](#foreach)

[.foregroundStyle](#foregroundstyle)

[Form](#form)

[.frame](#frame)

[Gradients (Linear, stops:, radial, angular/conical](#gradients-linear-stops-radial-angularconical)
[HStack](#hstack)

[Image (systemName:, decorative, resizable, scaledToFit, .clipShape, .shadow)](#image-systemname-decorative-resizable-scaledtofit-clipshape-shadow)

[.ignoreSafeArea](#ignoresafearea)

[.keyboardType](#keyboardtype)

[Modifier Extensions](#modifier-extensions)

[Navigation Stack](#navigation-stack)

[navigationTitle (and DisplayMode)](#navigationtitle-and-displaymode)

[.padding](#padding)

[Preview](#preview)

[Picker (.pickerStyle)](#picker-pickerstyle)

[\.self](#self)

[Section (and header text)](#section-and-header-text)

[Spacer](#spacer)

[@State](#state)

[Switch](#switch)

[TextField and Text (.font, .subheadline, .semibold)](#textfield-and-text-font-subheadline-semibold)

[.toolbar](#toolbar)

[Views and View Modifiers (custom modifiers, view extensions)](#views-and-view-modifiers-custom-modifiers-view-extensions)

[VStack](#vstack)

[ZStack](#zstack)


# Alerts, message: 
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/cf0109abea7edd90d55fb4855f7c299d44304f48/Project%202%2C%20Day%201%20(5).swift#L19-L43
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/14e785c2812b88b94ac51bd8394eaa5d68d9fd06/SwiftUI%20Practice%20Problems/Dice%20Rolls%20and%20Stat%20Checks.swift#L128-L130


# Background (.background, .ultraThinMaterial)
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/1ec5f3a43f2a11266aad747c485ac522b705330f/Project%202%2C%20Day%201%20(2).swift#L39-L46
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/92470093421930ccfa7e7c8d7787240c6f0b1f13/Project%202%2C%20Day%201%20(3).swift#L50-L52
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L86-L87


# Button (buttonStyle, tint, action:, } label {, .destructive, Label, .cancel)
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(2)swift.swift#L25-L29
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L115-L121
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/841a42c318dc11254629ec073690417611b62299/Project%202%2C%20Day%201%20(4).swift#L27-L33
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/841a42c318dc11254629ec073690417611b62299/Project%202%2C%20Day%201%20(4).swift#L41-L46
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/841a42c318dc11254629ec073690417611b62299/Project%202%2C%20Day%201%20(4).swift#L48-L50
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/841a42c318dc11254629ec073690417611b62299/Project%202%2C%20Day%201%20(4).swift#L52-L66
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/841a42c318dc11254629ec073690417611b62299/Project%202%2C%20Day%201%20(4).swift#L84-L87
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/841a42c318dc11254629ec073690417611b62299/Project%202%2C%20Day%201%20(4).swift#L89-L101
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/cf0109abea7edd90d55fb4855f7c299d44304f48/Project%202%2C%20Day%201%20(5).swift#L19-L43
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L111-L117
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L67-L71
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/975c2615bd8e09c63e67a2dc0280064404b7ab8d/SwiftUI%20Practice%20Problems/Character%20Creator.swift#L73-L88
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/14e785c2812b88b94ac51bd8394eaa5d68d9fd06/SwiftUI%20Practice%20Problems/Dice%20Rolls%20and%20Stat%20Checks.swift#L102-L127


# Color (color.secondary, custom colors)
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/1ec5f3a43f2a11266aad747c485ac522b705330f/Project%202%2C%20Day%201%20(2).swift#L18-L30


# Content
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/61ccc8c4ef8107e38fdd27400491715614c0e267/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(4).swift#L22-L31
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/61ccc8c4ef8107e38fdd27400491715614c0e267/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(4).swift#L37-L42


# @FocusState (.isFocused)
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L27-L30
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L57-L74
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L114-L122
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/7934c97b7ecde295b2ce14eb2d2990c4117bcd9a/Project%202%2C%20Day%201.swift#L18-L19
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/7934c97b7ecde295b2ce14eb2d2990c4117bcd9a/Project%202%2C%20Day%201.swift#L42-L43


# ForEach
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(4).swift#L21-L29
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(5).swift#L37-L45
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L77-L83
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L95-L101
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/7934c97b7ecde295b2ce14eb2d2990c4117bcd9a/Project%202%2C%20Day%201.swift#L30-L33


# .foregroundStyle
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/1ec5f3a43f2a11266aad747c485ac522b705330f/Project%202%2C%20Day%201%20(2).swift#L35-L36
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/92470093421930ccfa7e7c8d7787240c6f0b1f13/Project%202%2C%20Day%201%20(3).swift#L48-L49
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/841a42c318dc11254629ec073690417611b62299/Project%202%2C%20Day%201%20(4).swift#L44-L46
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/36208f91c2a1868f5f2d3e13ecff7a35d2ca8ab6/SwiftUI%20Practice%20Problems/Randomized%20Loot%20Chest.swift#L102-L104


# Form
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(1).swift#L22-L23


# .frame
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/1ec5f3a43f2a11266aad747c485ac522b705330f/Project%202%2C%20Day%201%20(2).swift#L31-L33
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/92470093421930ccfa7e7c8d7787240c6f0b1f13/Project%202%2C%20Day%201%20(3).swift#L46-L47
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/841a42c318dc11254629ec073690417611b62299/Project%202%2C%20Day%201%20(4).swift#L81-L82
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L82-L83


# Gradients (Linear, stops:, radial, angular/conical
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/97deff25c32c96f12352b818369b18afef74c195/Project%202%2C%20Day%201%20(3).swift#L23-L25
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/97deff25c32c96f12352b818369b18afef74c195/Project%202%2C%20Day%201%20(3).swift#L27-L36
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/97deff25c32c96f12352b818369b18afef74c195/Project%202%2C%20Day%201%20(3).swift#L38-L40
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/97deff25c32c96f12352b818369b18afef74c195/Project%202%2C%20Day%201%20(3).swift#L42-L45
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/841a42c318dc11254629ec073690417611b62299/Project%202%2C%20Day%201%20(4).swift#L99-L100
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L27-L35


# HStack
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/fbc7eacccb25bb2381f4d3254aa2e45decb0ce3c/Project%202%2C%20Day%201%20(1).swift#L18-L31

# Image (systemName:, decorative, resizable, scaledToFit, .clipShape, .shadow)
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/841a42c318dc11254629ec073690417611b62299/Project%202%2C%20Day%201%20(4).swift#L68-L72
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/841a42c318dc11254629ec073690417611b62299/Project%202%2C%20Day%201%20(4).swift#L74-L80
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L73-L78
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L88-L89


# .ignoreSafeArea
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/1ec5f3a43f2a11266aad747c485ac522b705330f/Project%202%2C%20Day%201%20(2).swift#L47-L53

# .keyboardType
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L56-L73
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/7934c97b7ecde295b2ce14eb2d2990c4117bcd9a/Project%202%2C%20Day%201.swift#L40-L41


# Modifier Extensions
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/61ccc8c4ef8107e38fdd27400491715614c0e267/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(4).swift#L54-L59
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/61ccc8c4ef8107e38fdd27400491715614c0e267/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(4).swift#L61-L66
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/61ccc8c4ef8107e38fdd27400491715614c0e267/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(4).swift#L74-L79
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/61ccc8c4ef8107e38fdd27400491715614c0e267/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(4).swift#L81-L90
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/f5a228d8249b64b356e37c1b4f3c4cbfc9d0b0b8/SwiftUI%20Practice%20Problems/Character%20Sheet.swift#L55-L58
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/f5a228d8249b64b356e37c1b4f3c4cbfc9d0b0b8/SwiftUI%20Practice%20Problems/Character%20Sheet.swift#L80-L92
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/36208f91c2a1868f5f2d3e13ecff7a35d2ca8ab6/SwiftUI%20Practice%20Problems/Randomized%20Loot%20Chest.swift#L107-L110


# Navigation Stack
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(1).swift#L19-L21
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L49-L51


# navigationTitle (and DisplayMode)
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(1).swift#L45-L50
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L110-L112


# .padding
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/1ec5f3a43f2a11266aad747c485ac522b705330f/Project%202%2C%20Day%201%20(2).swift#L37-L38
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L84-L85


# Preview
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(1).swift#L55-L57


# Picker (.pickerStyle)
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(5).swift#L30-L36
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L76-L86
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/7934c97b7ecde295b2ce14eb2d2990c4117bcd9a/Project%202%2C%20Day%201.swift#L28-L29
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/7934c97b7ecde295b2ce14eb2d2990c4117bcd9a/Project%202%2C%20Day%201.swift#L46-L50
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/975c2615bd8e09c63e67a2dc0280064404b7ab8d/SwiftUI%20Practice%20Problems/Character%20Creator.swift#L100-L109
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/14e785c2812b88b94ac51bd8394eaa5d68d9fd06/SwiftUI%20Practice%20Problems/Dice%20Rolls%20and%20Stat%20Checks.swift#L61-L66


# \.self
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(5).swift#L37-L40

# Section (and header text)
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(1).swift#L25-L26
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L90-L92


# Spacer
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/fbc7eacccb25bb2381f4d3254aa2e45decb0ce3c/Project%202%2C%20Day%201%20(1).swift#L33-L47
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L39-L40
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L91-L94


# @State
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(2)swift.swift#L16-L22
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L19-L26
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/cf0109abea7edd90d55fb4855f7c299d44304f48/Project%202%2C%20Day%201%20(5).swift#L15-L16
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/36208f91c2a1868f5f2d3e13ecff7a35d2ca8ab6/SwiftUI%20Practice%20Problems/Randomized%20Loot%20Chest.swift#L137-L139


# Switch
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/7934c97b7ecde295b2ce14eb2d2990c4117bcd9a/Project%202%2C%20Day%201.swift#L74-L85
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/7934c97b7ecde295b2ce14eb2d2990c4117bcd9a/Project%202%2C%20Day%201.swift#L87-L99

# TextField and Text (.font, .subheadline, .semibold)
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(3).swift#L21-L31
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(4).swift#L25-L28
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/0e52fc6db42dcc9d0ac297cf91ab7833fbc82020/Project%201%2C%20Day%201%20(5).swift#L41-L44
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L78-L83
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/7934c97b7ecde295b2ce14eb2d2990c4117bcd9a/Project%202%2C%20Day%201.swift#L52-L53
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L41-L44
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L53-L55
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L57-L60
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e0b64e51c9befc7cff891d2b314d4c16672489dc/Project%202%2C%20Day%202.swift#L98-L99
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/975c2615bd8e09c63e67a2dc0280064404b7ab8d/SwiftUI%20Practice%20Problems/Character%20Creator.swift#L64
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/14e785c2812b88b94ac51bd8394eaa5d68d9fd06/SwiftUI%20Practice%20Problems/Dice%20Rolls%20and%20Stat%20Checks.swift#L78-L82


# .toolbar
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/4a10684a82ee68f2e1ebbb090097d1aa20f220d3/Project%201%2C%20Day%202%20(1).swift#L113-L120
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/7934c97b7ecde295b2ce14eb2d2990c4117bcd9a/Project%202%2C%20Day%201.swift#L58-L64

# VStack
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/fbc7eacccb25bb2381f4d3254aa2e45decb0ce3c/Project%202%2C%20Day%201%20(1).swift#L23-L31
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/97deff25c32c96f12352b818369b18afef74c195/Project%202%2C%20Day%201%20(3).swift#L17-L21
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/975c2615bd8e09c63e67a2dc0280064404b7ab8d/SwiftUI%20Practice%20Problems/Character%20Creator.swift#L89-L94


# Views and View Modifiers (custom modifiers, view extensions)
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/b31afc3e36cf5883db07f50225296a3ff1ed911c/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(1).swift#L10-L13
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/e45548f683fd3214db4579e1efa6dbb5a3920329/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(1).swift#L28-L34
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/b31afc3e36cf5883db07f50225296a3ff1ed911c/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(1).swift#L37-L40
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/9f1786891bf42c4f2f94268be776dee508388948/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(2).swift#L29-L39
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/9f1786891bf42c4f2f94268be776dee508388948/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(2).swift#L46-L52
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/9f1786891bf42c4f2f94268be776dee508388948/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(2).swift#L56-L58
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/9f1786891bf42c4f2f94268be776dee508388948/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(2).swift#L62-L74
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/3a19a903a28fadaccb16fdbbbd49f0dc1c5c9b81/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(3).swift#L17-L45
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/61ccc8c4ef8107e38fdd27400491715614c0e267/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(4).swift#L17-L20
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/61ccc8c4ef8107e38fdd27400491715614c0e267/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(4).swift#L22-L32
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/61ccc8c4ef8107e38fdd27400491715614c0e267/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(4).swift#L34-L52
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/f5a228d8249b64b356e37c1b4f3c4cbfc9d0b0b8/SwiftUI%20Practice%20Problems/Character%20Sheet.swift#L32-L40
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/f5a228d8249b64b356e37c1b4f3c4cbfc9d0b0b8/SwiftUI%20Practice%20Problems/Character%20Sheet.swift#L44-L51

[back to top](#table-of-contents)


# ZStack
[back to top](#table-of-contents)

https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/1ec5f3a43f2a11266aad747c485ac522b705330f/Project%202%2C%20Day%201%20(2).swift#L16-L29
https://github.com/rand0Prime/SwiftUI-Building-Notes/blob/61ccc8c4ef8107e38fdd27400491715614c0e267/Project%203%20-%20ViewsAndModifiers/Project%203%2C%20Day%201%20(4).swift#L50




