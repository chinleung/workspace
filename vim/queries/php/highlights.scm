;; extends

; For classes and methods that are called statically
(scoped_call_expression
  scope: (name) @type.static
  name: (name) @function.method.call)

(class_constant_access_expression
  (name) @type.static)

(class_constant_access_expression
  (name) @keyword.class
  (#match? @keyword.class "^class$"))

; Conceals
("||" @conceal (#set! conceal "∨"))
("&&" @conceal (#set! conceal "∧"))
("!" @conceal (#set! conceal "❗️"))
("<=" @conceal (#set! conceal "≤"))
(">=" @conceal (#set! conceal "≥"))
("!=" @conceal (#set! conceal "≠"))
("==" @conceal (#set! conceal "≈"))
("===" @conceal (#set! conceal "≡"))
("!==" @conceal (#set! conceal "≢"))
("->" @conceal (#set! conceal "→"))
("=>" @conceal (#set! conceal "⇒"))
("::" @conceal (#set! conceal "∷"))
("..." @conceal (#set! conceal "…"))
("fn" @conceal (#set! conceal "ƒ"))
("function" @conceal (#set! conceal "ƒ"))
((null) @null @conceal (#set! conceal "∅"))
("parent" @conceal (#set! conceal "Ω"))
("return" @conceal (#set! conceal "↪"))
((boolean) @conceal @boolean.true (#eq? @boolean.true "true") (#set! conceal "👍🏼"))
((boolean) @conceal @boolean.false (#eq? @boolean.false "false") (#set! conceal "👎🏼"))
