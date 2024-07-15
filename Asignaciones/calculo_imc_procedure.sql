PROCEDURE P_CALCULO_IMC(Pn_peso            hcl_signos_vitales_x_atencion.peso%TYPE,
                          Pn_talla           hcl_signos_vitales_x_atencion.talla%TYPE,
                          Pd_fechaNacimiento DATE,
                          Pv_genero          VARCHAR2,
                          Pn_valor_imc       OUT NUMBER,
                          Pv_texto_imc       OUT VARCHAR2,
                          Pv_msgExcepcion    OUT VARCHAR2) IS
    --
    Lv_contexto VARCHAR2(60) := 'HCL_K_CONSULTAS.P_CALCULO_IMC';
  
    -- IMC Ni?os y Ni?as entre 5 y 18
    CURSOR imc_menores(CN_IMC   NUMBER,
                       CN_ANIOS NUMBER,
                       CN_MESES NUMBER,
                       CV_SEXO  VARCHAR2) IS
      SELECT Y.IMC_DESCRIPCION /*,
                             Y.COLOR_FONDO_DESCRIPCION,
                             Y.COLOR_LETRA_DESCRIPCION */
        FROM HCL_PARAMETROS_IMC Y
       WHERE Y.ANIOS = CN_ANIOS
         AND Y.MESES = CN_MESES
         AND Y.RANGO_SUPERIOR_IMC >= CN_IMC
         AND Y.SEXO = CV_SEXO
      --AND ROWNUM               =1
       ORDER BY Y.RANGO_SUPERIOR_IMC ASC;
  
    -- IMC Mayores de 18
    CURSOR IMC_MAYORES(CN_IMC NUMBER) IS
      SELECT Y.IMC_DESCRIPCION /*,
                             Y.COLOR_FONDO_DESCRIPCION,
                             Y.COLOR_LETRA_DESCRIPCION */
        FROM HCL_PARAMETROS_IMC Y
       WHERE Y.ANIOS IS NULL
         AND Y.RANGO_SUPERIOR_IMC >= CN_IMC
      --AND ROWNUM               =1
       ORDER BY Y.RANGO_SUPERIOR_IMC ASC;
  
    Ln_total_meses NUMBER;
    Ln_anios       NUMBER;
    Ln_meses       NUMBER;
    Ln_meses_aux   NUMBER;
  
  BEGIN
  
    IF Pn_peso IS NULL THEN
      Pv_msgExcepcion := k_excepciones.f_msg_error_validacion(Lv_contexto,
                                                              'Campo peso obligatorio');
      RETURN;
    END IF;
  
    IF Pn_talla IS NULL THEN
      Pv_msgExcepcion := k_excepciones.f_msg_error_validacion(Lv_contexto,
                                                              'Campo talla obligatorio');
      RETURN;
    END IF;
  
    --CALCULO DE LA EDAD EN A?OS Y MESES
    Ln_total_meses := months_between(SYSDATE, Pd_fechaNacimiento);
    Ln_anios       := TRUNC(Ln_total_meses / 12);
    Ln_meses       := TRUNC((Ln_total_meses / 12 -
                            TRUNC(Ln_total_meses / 12)) * 12);
  
    IF ln_meses IN (0, 1, 2, 3, 4, 5) THEN
      ln_meses_aux := 0;
    ELSE
      ln_meses_aux := 6;
    END IF;
  
    IF ln_anios = 5 AND ln_meses_aux = 0 THEN
      ln_meses_aux := 1;
    END IF;
  
    --FORMULA: Peso(KG) / Talla(metros) ^ 2
    Pn_valor_imc := ROUND(Pn_peso / power(Pn_talla / 100, 2), 2);
    -- dbms_output.put_line(Ln_imc);
  
    IF Pn_valor_imc > 999 THEN
      Pn_valor_imc := 0;
      Pv_texto_imc := 'N/A';
      RETURN;
    END IF;
  
    IF ln_anios > 5 AND ln_anios < 19 THEN
    
      OPEN IMC_MENORES(Pn_valor_imc, ln_anios, ln_meses_aux, Pv_genero);
      FETCH IMC_MENORES
        INTO Pv_texto_imc /*, Pv_color_fondo_desc, Pv_color_letra_desc*/
      ;
      CLOSE IMC_MENORES;
    
    ELSIF ln_anios >= 19 THEN
    
      OPEN IMC_MAYORES(Pn_valor_imc);
      FETCH IMC_MAYORES
        INTO Pv_texto_imc /*, Pv_color_fondo_desc, Pv_color_letra_desc*/
      ;
      CLOSE IMC_MAYORES;
    
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      Pv_msgExcepcion := k_excepciones.f_msg_error_oracle(Lv_contexto);
    
  END P_CALCULO_IMC;
