<?php

$finder = PhpCsFixer\Finder::create()
    ->exclude('vendor')
    ->in(__DIR__);

$config = new PhpCsFixer\Config();

return $config
    ->setRiskyAllowed(true)
    ->setRules([
        '@PSR2' => true,
        'array_indentation' => true,
        'array_syntax' => [
            'syntax' => 'short',
        ],
        'binary_operator_spaces' => true,
        'blank_line_after_opening_tag' => true,
        'blank_line_before_statement' => [
            'statements' => [
                'break',
                'continue',
                'declare',
                'for',
                'foreach',
                'if',
                'return',
                'throw',
                'try',
            ],
        ],
        'braces' => [
            'allow_single_line_closure' => true,
        ],
        'cast_spaces' => true,
        'class_attributes_separation' => true,
        'concat_space' => true,
        'echo_tag_syntax' => true,
        'explicit_indirect_variable' => true,
        'explicit_string_variable' => true,
        'fully_qualified_strict_types' => [
            'import_symbols' => true,
            'leading_backslash_in_global_namespace' => false,
            'phpdoc_tags' => [
                'param' => true,
                'return' => true,
            ],
        ],
        'function_typehint_space' => true,
        'indentation_type' => true,
        'is_null' => true,
        'lambda_not_used_import' => true,
        'linebreak_after_opening_tag' => true,
        'lowercase_cast' => true,
        'lowercase_static_reference' => true,
        'method_chaining_indentation' => true,
        'multiline_whitespace_before_semicolons' => true,
        'native_function_casing' => true,
        'no_empty_statement' => true,
        'no_extra_blank_lines' => true,
        'no_leading_import_slash' => true,
        'no_leading_namespace_whitespace' => true,
        'no_mixed_echo_print' => true,
        'no_short_bool_cast' => true,
        'no_singleline_whitespace_before_semicolons' => true,
        'no_spaces_around_offset' => true,
        'no_superfluous_elseif' => true,
        'no_unneeded_control_parentheses' => true,
        'no_unset_cast' => true,
        'no_unused_imports' => true,
        'no_useless_else' => true,
        'no_whitespace_in_blank_line' => true,
        'not_operator_with_successor_space' => true,
        'nullable_type_declaration_for_default_null_value' => [
            'use_nullable_type_declaration' => false,
        ],
        'object_operator_without_whitespace' => true,
        'ordered_imports' => true,
        'ordered_interfaces' => true,
        'ordered_traits' => true,
        'phpdoc_indent' => true,
        'phpdoc_order' => [
            'order' => [
                'param',
                'return',
                'throws',
            ],
        ],
        'phpdoc_param_order' => true,
        'phpdoc_trim_consecutive_blank_line_separation' => true,
        'phpdoc_types' => true,
        'phpdoc_types_order' => [
            'null_adjustment' => 'always_last',
        ],
        'phpdoc_var_without_name' => true,
        'php_unit_method_casing' => [
            'case' => 'snake_case',
        ],
        'return_assignment' => true,
        'return_type_declaration' => true,
        'semicolon_after_instruction' => true,
        'short_scalar_cast' => true,
        'simple_to_complex_string_variable' => true,
        'single_quote' => true,
        'single_space_after_construct' => true,
        'space_after_semicolon' => true,
        'standardize_not_equals' => true,
        'static_lambda' => true,
        'ternary_operator_spaces' => true,
        'ternary_to_null_coalescing' => true,
        'trailing_comma_in_multiline' => true,
        'unary_operator_spaces' => true,
        'whitespace_after_comma_in_array' => true,
        'yoda_style' => [
            'equal' => false,
            'identical' => false,
            'less_and_greater' => false,
        ],
    ])
    ->setFinder($finder);
