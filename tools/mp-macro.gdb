macro define get_t_next(a) do { mp_get_next (mp); if (cur_cmd() <= mp_max_pre_command)  mp_t_next (mp); } while (0)
macro define NULL ((void*)0)
macro define KPATHSEA_DEBUG_H 1
macro define default_banner "This is MetaPost, Version 1.999"
macro define true 1
macro define DEBUG 1
macro define incr(A) (A) = (A) +1
macro define decr(A) (A) = (A) -1
macro define negate(A) (A) = -(A) 
macro define double(A) (A) = (A) +(A) 
macro define new_string 0
macro define pseudo 2
macro define no_print 3
macro define term_only 4
macro define log_only 5
macro define term_and_log 6
macro define arc_tol_k ((math_data*) mp->math) ->arc_tol_k
macro define coef_bound_k ((math_data*) mp->math) ->coef_bound_k
macro define coef_bound_minus_1 ((math_data*) mp->math) ->coef_bound_minus_1
macro define sqrt_8_e_k ((math_data*) mp->math) ->sqrt_8_e_k
macro define twelve_ln_2_k ((math_data*) mp->math) ->twelve_ln_2_k
macro define twelvebits_3 ((math_data*) mp->math) ->twelvebits_3
macro define one_k ((math_data*) mp->math) ->one_k
macro define epsilon_t ((math_data*) mp->math) ->epsilon_t
macro define unity_t ((math_data*) mp->math) ->unity_t
macro define zero_t ((math_data*) mp->math) ->zero_t
macro define two_t ((math_data*) mp->math) ->two_t
macro define three_t ((math_data*) mp->math) ->three_t
macro define half_unit_t ((math_data*) mp->math) ->half_unit_t
macro define three_quarter_unit_t ((math_data*) mp->math) ->three_quarter_unit_t
macro define twentysixbits_sqrt2_t ((math_data*) mp->math) ->twentysixbits_sqrt2_t
macro define twentyeightbits_d_t ((math_data*) mp->math) ->twentyeightbits_d_t
macro define twentysevenbits_sqrt2_d_t ((math_data*) mp->math) ->twentysevenbits_sqrt2_d_t
macro define warning_limit_t ((math_data*) mp->math) ->warning_limit_t
macro define precision_default ((math_data*) mp->math) ->precision_default
macro define precision_max ((math_data*) mp->math) ->precision_max
macro define fraction_one_t ((math_data*) mp->math) ->fraction_one_t
macro define fraction_half_t ((math_data*) mp->math) ->fraction_half_t
macro define fraction_three_t ((math_data*) mp->math) ->fraction_three_t
macro define one_eighty_deg_t ((math_data*) mp->math) ->one_eighty_deg_t
macro define max_quarterword 0x3FFF
macro define qo(A) (A) 
macro define xfree(A) do{mp_xfree(A) ;A= NULL;}while(0) 
macro define xrealloc(P,A,B) mp_xrealloc(mp,P,(size_t) A,B) 
macro define xmalloc(A,B) mp_xmalloc(mp,(size_t) A,B) 
macro define xstrdup(A) mp_xstrdup(mp,A) 
macro define max_num_token_nodes 1000
macro define max_num_pair_nodes 1000
macro define max_num_knot_nodes 1000
macro define max_num_value_nodes 1000
macro define mp_link(A) (A) ->link
macro define mp_type(A) (A) ->type
macro define symbolic_node_size sizeof(mp_node_data) 
macro define mp_max_command_code mp_stop
macro define mp_max_pre_command mp_mpx_break
macro define mp_min_command (mp_defined_macro+1) 
macro define mp_max_statement_command mp_type_name
macro define mp_min_primary_command mp_type_name
macro define mp_min_suffix_token mp_internal_quantity
macro define mp_max_suffix_token mp_numeric_token
macro define mp_max_primary_command mp_plus_or_minus
macro define mp_min_tertiary_command mp_plus_or_minus
macro define mp_max_tertiary_command mp_tertiary_binary
macro define mp_min_expression_command mp_left_brace
macro define mp_max_expression_command mp_equals
macro define mp_min_secondary_command mp_and_command
macro define mp_max_secondary_command mp_secondary_binary
macro define unknown_tag 1
macro define digit_class 0
macro define period_class 1
macro define space_class 2
macro define percent_class 3
macro define string_class 4
macro define right_paren_class 8
macro define isolated_classes 5:case 6:case 7:case 8
macro define letter_class 9
macro define mp_left_bracket_class 17
macro define mp_right_bracket_class 18
macro define invalid_class 20
macro define set_value_sym(A,B) do_set_value_sym(mp,(mp_token_node) (A) ,(B) ) 
macro define set_value_number(A,B) do_set_value_number(mp,(mp_token_node) (A) ,(B) ) 
macro define set_value_node(A,B) do_set_value_node(mp,(mp_token_node) (A) ,(B) ) 
macro define set_value_str(A,B) do_set_value_str(mp,(mp_token_node) (A) ,(B) ) 
macro define value_sym_NEW(A) (mp_sym) mp_link(A) 
macro define ref_count(A) indep_value(A) 
macro define set_ref_count(A,B) set_indep_value(A,B) 
macro define add_mac_ref(A) set_ref_count((A) ,ref_count((A) ) +1) 
macro define attr_head(A) do_get_attr_head(mp,(mp_value_node) (A) ) 
macro define subscr_head(A) do_get_subscr_head(mp,(mp_value_node) (A) ) 
macro define collective_subscript (void*) 0
macro define subscript(A) ((mp_value_node) (A) ) ->subscript_
macro define x_part(A) ((mp_pair_node) (A) ) ->x_part_
macro define tx_part(A) ((mp_transform_node) (A) ) ->tx_part_
macro define ty_part(A) ((mp_transform_node) (A) ) ->ty_part_
macro define xx_part(A) ((mp_transform_node) (A) ) ->xx_part_
macro define xy_part(A) ((mp_transform_node) (A) ) ->xy_part_
macro define yx_part(A) ((mp_transform_node) (A) ) ->yx_part_
macro define red_part(A) ((mp_color_node) (A) ) ->red_part_
macro define green_part(A) ((mp_color_node) (A) ) ->green_part_
macro define cyan_part(A) ((mp_cmykcolor_node) (A) ) ->cyan_part_
macro define magenta_part(A) ((mp_cmykcolor_node) (A) ) ->magenta_part_
macro define yellow_part(A) ((mp_cmykcolor_node) (A) ) ->yellow_part_
macro define mp_next_knot(A) (A) ->next
macro define mp_left_type(A) (A) ->data.types.left_type
macro define mp_right_type(A) (A) ->data.types.right_type
macro define mp_prev_knot(A) (A) ->data.prev
macro define left_curl left_x
macro define left_given left_x
macro define left_tension left_y
macro define right_curl right_x
macro define right_given right_x
macro define mp_minx mp->bbmin[mp_x_code]
macro define mp_maxx mp->bbmax[mp_x_code]
macro define mp_miny mp->bbmin[mp_y_code]
macro define set_precision() (((math_data*) (mp->math) ) ->set_precision) (mp) 
macro define free_math() (((math_data*) (mp->math) ) ->free_math) (mp) 
macro define scan_numeric_token(A) (((math_data*) (mp->math) ) ->scan_numeric) (mp,A) 
macro define scan_fractional_token(A) (((math_data*) (mp->math) ) ->scan_fractional) (mp,A) 
macro define set_number_from_of_the_way(A,t,B,C) (((math_data*) (mp->math) ) ->from_oftheway) (mp,&(A) ,t,B,C) 
macro define set_number_from_int(A,B) (((math_data*) (mp->math) ) ->from_int) (&(A) ,B) 
macro define set_number_from_scaled(A,B) (((math_data*) (mp->math) ) ->from_scaled) (&(A) ,B) 
macro define set_number_from_boolean(A,B) (((math_data*) (mp->math) ) ->from_boolean) (&(A) ,B) 
macro define set_number_from_double(A,B) (((math_data*) (mp->math) ) ->from_double) (&(A) ,B) 
macro define set_number_from_addition(A,B,C) (((math_data*) (mp->math) ) ->from_addition) (&(A) ,B,C) 
macro define set_number_from_substraction(A,B,C) (((math_data*) (mp->math) ) ->from_substraction) (&(A) ,B,C) 
macro define set_number_from_div(A,B,C) (((math_data*) (mp->math) ) ->from_div) (&(A) ,B,C) 
macro define set_number_from_mul(A,B,C) (((math_data*) (mp->math) ) ->from_mul) (&(A) ,B,C) 
macro define number_int_div(A,C) (((math_data*) (mp->math) ) ->from_int_div) (&(A) ,A,C) 
macro define set_number_to_unity(A) (((math_data*) (mp->math) ) ->clone) (&(A) ,unity_t) 
macro define set_number_to_zero(A) (((math_data*) (mp->math) ) ->clone) (&(A) ,zero_t) 
macro define set_number_to_inf(A) (((math_data*) (mp->math) ) ->clone) (&(A) ,inf_t) 
macro define init_randoms(A) (((math_data*) (mp->math) ) ->init_randoms) (mp,A) 
macro define print_number(A) (((math_data*) (mp->math) ) ->print) (mp,A) 
macro define number_tostring(A) (((math_data*) (mp->math) ) ->tostring) (mp,A) 
macro define make_scaled(R,A,B) (((math_data*) (mp->math) ) ->make_scaled) (mp,&(R) ,A,B) 
macro define take_scaled(R,A,B) (((math_data*) (mp->math) ) ->take_scaled) (mp,&(R) ,A,B) 
macro define make_fraction(R,A,B) (((math_data*) (mp->math) ) ->make_fraction) (mp,&(R) ,A,B) 
macro define take_fraction(R,A,B) (((math_data*) (mp->math) ) ->take_fraction) (mp,&(R) ,A,B) 
macro define pyth_add(R,A,B) (((math_data*) (mp->math) ) ->pyth_add) (mp,&(R) ,A,B) 
macro define pyth_sub(R,A,B) (((math_data*) (mp->math) ) ->pyth_sub) (mp,&(R) ,A,B) 
macro define n_arg(R,A,B) (((math_data*) (mp->math) ) ->n_arg) (mp,&(R) ,A,B) 
macro define m_log(R,A) (((math_data*) (mp->math) ) ->m_log) (mp,&(R) ,A) 
macro define m_exp(R,A) (((math_data*) (mp->math) ) ->m_exp) (mp,&(R) ,A) 
macro define velocity(R,A,B,C,D,E) (((math_data*) (mp->math) ) ->velocity) (mp,&(R) ,A,B,C,D,E) 
macro define ab_vs_cd(R,A,B,C,D) (((math_data*) (mp->math) ) ->ab_vs_cd) (mp,&(R) ,A,B,C,D) 
macro define crossing_point(R,A,B,C) (((math_data*) (mp->math) ) ->crossing_point) (mp,&(R) ,A,B,C) 
macro define n_sin_cos(A,S,C) (((math_data*) (mp->math) ) ->sin_cos) (mp,A,&(S) ,&(C) ) 
macro define square_rt(A,S) (((math_data*) (mp->math) ) ->sqrt) (mp,&(A) ,S) 
macro define slow_add(R,A,B) (((math_data*) (mp->math) ) ->slow_add) (mp,&(R) ,A,B) 
macro define round_unscaled(A) (((math_data*) (mp->math) ) ->round_unscaled) (A) 
macro define floor_scaled(A) (((math_data*) (mp->math) ) ->floor_scaled) (&(A) ) 
macro define fraction_to_round_scaled(A) (((math_data*) (mp->math) ) ->fraction_to_round_scaled) (&(A) ) 
macro define number_to_int(A) (((math_data*) (mp->math) ) ->to_int) (A) 
macro define number_to_boolean(A) (((math_data*) (mp->math) ) ->to_boolean) (A) 
macro define number_to_scaled(A) (((math_data*) (mp->math) ) ->to_scaled) (A) 
macro define number_to_double(A) (((math_data*) (mp->math) ) ->to_double) (A) 
macro define number_negate(A) (((math_data*) (mp->math) ) ->negate) (&(A) ) 
macro define number_add(A,B) (((math_data*) (mp->math) ) ->add) (&(A) ,B) 
macro define number_substract(A,B) (((math_data*) (mp->math) ) ->substract) (&(A) ,B) 
macro define number_half(A) (((math_data*) (mp->math) ) ->half) (&(A) ) 
macro define number_halfp(A) (((math_data*) (mp->math) ) ->halfp) (&(A) ) 
macro define number_double(A) (((math_data*) (mp->math) ) ->do_double) (&(A) ) 
macro define number_add_scaled(A,B) (((math_data*) (mp->math) ) ->add_scaled) (&(A) ,B) 
macro define number_multiply_int(A,B) (((math_data*) (mp->math) ) ->multiply_int) (&(A) ,B) 
macro define number_divide_int(A,B) (((math_data*) (mp->math) ) ->divide_int) (&(A) ,B) 
macro define number_abs(A) (((math_data*) (mp->math) ) ->abs) (&(A) ) 
macro define number_modulo(A,B) (((math_data*) (mp->math) ) ->modulo) (&(A) ,B) 
macro define number_nonequalabs(A,B) (((math_data*) (mp->math) ) ->nonequalabs) (A,B) 
macro define number_odd(A) (((math_data*) (mp->math) ) ->odd) (A) 
macro define number_equal(A,B) (((math_data*) (mp->math) ) ->equal) (A,B) 
macro define number_greater(A,B) (((math_data*) (mp->math) ) ->greater) (A,B) 
macro define number_less(A,B) (((math_data*) (mp->math) ) ->less) (A,B) 
macro define number_clone(A,B) (((math_data*) (mp->math) ) ->clone) (&(A) ,B) 
macro define number_swap(A,B) (((math_data*) (mp->math) ) ->swap) (&(A) ,&(B) ) ;
macro define convert_scaled_to_angle(A) (((math_data*) (mp->math) ) ->scaled_to_angle) (&(A) ) ;
macro define convert_angle_to_scaled(A) (((math_data*) (mp->math) ) ->angle_to_scaled) (&(A) ) ;
macro define convert_fraction_to_scaled(A) (((math_data*) (mp->math) ) ->fraction_to_scaled) (&(A) ) ;
macro define number_zero(A) number_equal(A,zero_t) 
macro define number_infinite(A) number_equal(A,inf_t) 
macro define number_unity(A) number_equal(A,unity_t) 
macro define number_negative(A) number_less(A,zero_t) 
macro define number_nonnegative(A) (!number_negative(A) ) 
macro define number_positive(A) number_greater(A,zero_t) 
macro define number_nonpositive(A) (!number_positive(A) ) 
macro define number_nonzero(A) (!number_zero(A) ) 
macro define number_greaterequal(A,B) (!number_less(A,B) ) 
macro define mp_path_p(A) (A) ->path_p_
macro define mp_pen_p(A) (A) ->pen_p_
macro define mp_color_model(A) ((mp_fill_node) (A) ) ->color_model_
macro define cyan red
macro define grey red
macro define magenta green
macro define yellow blue
macro define mp_pre_script(A) ((mp_fill_node) (A) ) ->pre_script_
macro define mp_text_p(A) ((mp_text_node) (A) ) ->text_p_
macro define is_start_or_stop(A) (mp_type((A) ) >=mp_start_clip_node_type) 
macro define start_clip_size sizeof(struct mp_start_clip_node_data) 
macro define stop_clip_size sizeof(struct mp_stop_clip_node_data) 
macro define start_bounds_size sizeof(struct mp_start_bounds_node_data) 
macro define dash_list(A) (mp_dash_node) (((mp_dash_node) (A) ) ->link) 
macro define bblast(A) ((mp_edge_header_node) (A) ) ->bblast_
macro define no_bounds 0
macro define bounds_set 1
macro define bounds_unset 2
macro define obj_tail(A) ((mp_edge_header_node) (A) ) ->obj_tail_
macro define add_edge_ref(A) incr(edge_ref_count((A) ) ) 
macro define stack_1(A) mp->bisect_stack[(A) ]
macro define stack_2(A) mp->bisect_stack[(A) +1]
macro define stack_3(A) mp->bisect_stack[(A) +2]
macro define u_packet(A) ((A) -5) 
macro define v_packet(A) ((A) -10) 
macro define x_packet(A) ((A) -15) 
macro define y_packet(A) ((A) -20) 
macro define l_packets (mp->bisect_ptr-int_packets) 
macro define r_packets mp->bisect_ptr
macro define ul_packet u_packet(l_packets) 
macro define vl_packet v_packet(l_packets) 
macro define xl_packet x_packet(l_packets) 
macro define yl_packet y_packet(l_packets) 
macro define ur_packet u_packet(r_packets) 
macro define vr_packet v_packet(r_packets) 
macro define xr_packet x_packet(r_packets) 
macro define u1l stack_1(ul_packet) 
macro define u2l stack_2(ul_packet) 
macro define u3l stack_3(ul_packet) 
macro define v1l stack_1(vl_packet) 
macro define v2l stack_2(vl_packet) 
macro define v3l stack_3(vl_packet) 
macro define x1l stack_1(xl_packet) 
macro define x2l stack_2(xl_packet) 
macro define x3l stack_3(xl_packet) 
macro define y1l stack_1(yl_packet) 
macro define y2l stack_2(yl_packet) 
macro define y3l stack_3(yl_packet) 
macro define u1r stack_1(ur_packet) 
macro define u2r stack_2(ur_packet) 
macro define u3r stack_3(ur_packet) 
macro define v1r stack_1(vr_packet) 
macro define v2r stack_2(vr_packet) 
macro define v3r stack_3(vr_packet) 
macro define x1r stack_1(xr_packet) 
macro define x2r stack_2(xr_packet) 
macro define x3r stack_3(xr_packet) 
macro define y1r stack_1(yr_packet) 
macro define y2r stack_2(yr_packet) 
macro define stack_dx mp->bisect_stack[mp->bisect_ptr]
macro define stack_dy mp->bisect_stack[mp->bisect_ptr+1]
macro define stack_tol mp->bisect_stack[mp->bisect_ptr+2]
macro define stack_uv mp->bisect_stack[mp->bisect_ptr+3]
macro define stack_xy mp->bisect_stack[mp->bisect_ptr+4]
macro define indep_scale(A) ((mp_value_node) (A) ) ->data.indep.scale
macro define set_indep_scale(A,B) ((mp_value_node) (A) ) ->data.indep.scale= (B) 
macro define indep_value(A) ((mp_value_node) (A) ) ->data.indep.serial
macro define dep_value(A) ((mp_value_node) (A) ) ->data.n
macro define set_dep_value(A,B) do_set_dep_value(mp,(A) ,(B) ) 
macro define dep_info(A) get_dep_info(mp,(A) ) 
macro define dep_list(A) ((mp_value_node) (A) ) ->attr_head_
macro define prev_dep(A) ((mp_value_node) (A) ) ->subscr_head_
macro define fraction_threshold_k ((math_data*) mp->math) ->fraction_threshold_t
macro define half_fraction_threshold_k ((math_data*) mp->math) ->half_fraction_threshold_t
macro define scaled_threshold_k ((math_data*) mp->math) ->scaled_threshold_t
macro define independent_being_fixed 1
macro define cur_cmd() (unsigned) (mp->cur_mod_->type) 
macro define set_cur_cmd(A) mp->cur_mod_->type= (A) 
macro define cur_mod_int() number_to_int(mp->cur_mod_->data.n) 
macro define cur_mod() number_to_scaled(mp->cur_mod_->data.n) 
macro define cur_mod_number() mp->cur_mod_->data.n
macro define set_cur_mod(A) set_number_from_scaled(mp->cur_mod_->data.n,(A) ) 
macro define set_cur_mod_number(A) number_clone(mp->cur_mod_->data.n,(A) ) 
macro define cur_mod_node() mp->cur_mod_->data.node
macro define set_cur_mod_node(A) mp->cur_mod_->data.node= (A) 
macro define cur_mod_str() mp->cur_mod_->data.str
macro define set_cur_mod_str(A) mp->cur_mod_->data.str= (A) 
macro define cur_sym() mp->cur_mod_->data.sym
macro define set_cur_sym(A) mp->cur_mod_->data.sym= (A) 
macro define cur_sym_mod() mp->cur_mod_->name_type
macro define iindex mp->cur_input.index_field
macro define start mp->cur_input.start_field
macro define limit mp->cur_input.limit_field
macro define is_term (mp_string) 0
macro define is_read (mp_string) 1
macro define is_scantok (mp_string) 2
macro define terminal_input (name==is_term) 
macro define cur_file mp->input_file[iindex]
macro define line mp->line_stack[iindex]
macro define in_ext mp->inext_stack[iindex]
macro define in_name mp->iname_stack[iindex]
macro define in_area mp->iarea_stack[iindex]
macro define absent (mp_string) 1
macro define nloc mp->cur_input.nloc_field
macro define token_type iindex
macro define token_state (iindex<=macro) 
macro define file_state (iindex> macro) 
macro define param_start limit
macro define forever_text 0
macro define loop_text 1
macro define parameter 2
macro define backed_up 3
macro define inserted 4
macro define macro 5
macro define normal 0
macro define skipping 1
macro define flushing 2
macro define absorbing 3
macro define var_defining 4
macro define op_defining 5
macro define btex_code 0
macro define start_def 1
macro define var_def 2
macro define end_def 0
macro define start_forever 1
macro define start_for 2
macro define start_forsuffixes 3
macro define quote 0
macro define macro_prefix 1
macro define macro_at 2
macro define if_line_field(A) ((mp_if_node) (A) ) ->if_line_field_
macro define if_code 1
macro define fi_code 2
macro define else_code 3
macro define cur_exp_value_boolean() number_to_int(mp->cur_exp.data.n) 
macro define cur_exp_value_number() mp->cur_exp.data.n
macro define cur_exp_node() mp->cur_exp.data.node
macro define cur_exp_str() mp->cur_exp.data.str
macro define cur_pic_item mp_link(edge_list(cur_exp_node() ) ) 
macro define mp_floor(a) ((a) >=0?(int) (a) :-(int) (-(a) ) ) 
macro define bezier_error (720*(256*256*16) ) +1
macro define mp_sign(v) ((v) > 0?1:((v) <0?-1:0) ) 
macro define p_nextnext mp_next_knot(mp_next_knot(p) ) 
macro define show_token_code 0
macro define show_stats_code 1
macro define show_code 2
macro define show_var_code 3
macro define double_path_code 0
macro define contour_code 1
macro define with_mp_pre_script 11
macro define message_code 0
macro define err_message_code 1
macro define err_help_code 2
macro define filename_template_code 3
macro define no_tag 0
macro define lig_tag 1
macro define list_tag 2
macro define kern_flag (128) 
macro define skip_byte(A) mp->lig_kern[(A) ].b0
macro define next_char(A) mp->lig_kern[(A) ].b1
macro define op_byte(A) mp->lig_kern[(A) ].b2
macro define ext_top(A) mp->exten[(A) ].b0
macro define ext_mid(A) mp->exten[(A) ].b1
macro define ext_bot(A) mp->exten[(A) ].b2
macro define slant_code 1
macro define space_code 2
macro define space_stretch_code 3
macro define space_shrink_code 4
macro define x_height_code 5
macro define quad_code 6
macro define max_tfm_int 32510
macro define char_list_code 0
macro define lig_table_code 1
macro define extensible_code 2
macro define header_byte_code 3
macro define char_mp_info(A,B) mp->font_info[mp->char_base[(A) ]+(B) ].qqqq
macro define char_width(A,B) mp->font_info[mp->width_base[(A) ]+(B) .b0].sc
macro define char_height(A,B) mp->font_info[mp->height_base[(A) ]+(B) .b1].sc
macro define char_depth(A,B) mp->font_info[mp->depth_base[(A) ]+(B) .b2].sc
macro define mp_sym_info(A)       get_mp_sym_info(mp,(A))
macro define set_mp_sym_info(A,B) do_set_mp_sym_info(mp,(A),(B))
macro define mp_sym_sym(A)        get_mp_sym_sym(mp,(A))
macro define set_mp_sym_sym(A,B)  do_set_mp_sym_sym(mp,(A),(mp_sym)(B))
macro define mp_sym_info(A)        indep_value(A)
macro define set_mp_sym_info(A,B)  set_indep_value(A, (B))
macro define mp_sym_sym(A)        (A)->data.sym
macro define set_mp_sym_sym(A,B)  (A)->data.sym =  (mp_sym)(B)
macro define text(A)         do_get_text(mp, (A))
macro define eq_type(A)      do_get_eq_type(mp, (A))
macro define equiv(A)        do_get_equiv(mp, (A))
macro define equiv_node(A)   do_get_equiv_node(mp, (A))
macro define equiv_sym(A)    do_get_equiv_sym(mp, (A))
macro define text(A)         (A)->text
macro define eq_type(A)      (A)->type
macro define equiv(A)        (A)->v.data.indep.serial
macro define equiv_node(A)   (A)->v.data.node
macro define equiv_sym(A)    (mp_sym)(A)->v.data.node
macro define value_sym(A)    do_get_value_sym(mp,(mp_token_node)(A))
macro define value_number(A) ((mp_token_node)(A))->data.n
macro define value_node(A)   do_get_value_node(mp,(mp_token_node)(A))
macro define value_str(A)    do_get_value_str(mp,(mp_token_node)(A))
macro define value_knot(A)   do_get_value_knot(mp,(mp_token_node)(A))
macro define value_sym(A)    ((mp_token_node)(A))->data.sym
macro define value_number(A) ((mp_token_node)(A))->data.n
macro define value_node(A)   ((mp_token_node)(A))->data.node
macro define value_str(A)    ((mp_token_node)(A))->data.str
macro define value_knot(A)   ((mp_token_node)(A))->data.p
macro define hashloc(A)       do_get_hashloc(mp,(mp_value_node)(A))
macro define set_hashloc(A,B) do_set_hashloc (mp,(mp_value_node)A, B)
macro define parent(A)        do_get_parent(mp, A)
macro define set_parent(A,B)  do_set_parent (mp,(mp_value_node)A, B)
macro define hashloc(A)       ((mp_value_node)(A))->hashloc_
macro define set_hashloc(A,B) ((mp_value_node)(A))->hashloc_ =  B
macro define parent(A)        ((mp_value_node)(A))->parent_
macro define set_parent(A,B)  ((mp_value_node)(A))->parent_ =  B
macro define TOO_LARGE(a) (fabs((a))> 4096.0)
macro define PI 3.1415926535897932384626433832795028841971
macro define IS_DIR_SEP(c) (c=='/' || c=='\\')
