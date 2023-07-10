STL Project
================

This is my first notebook project in R. I will be exploring the
following mocking soil laboratory dataset.

``` r
#Group an exclude years 2017 and 2023----
#Filter unused years
by_years <- STL_2018_2022 %>% 
  group_by (Year) %>% 
  filter (Year<2023, 2017<Year)
by_years
```

    ## # A tibble: 93,587 × 31
    ## # Groups:   Year [5]
    ##    OrderDt   Month   Day  Year LabNo Customer Sector Type     pH Sikora_pH    OM
    ##    <chr>     <dbl> <dbl> <dbl> <chr> <chr>    <chr>  <chr> <dbl>     <dbl> <dbl>
    ##  1 4/13/2022     4    13  2022 10057 Adams, B Priva… <NA>    5.8       6.5   4.8
    ##  2 4/13/2022     4    13  2022 10058 Adams, B Priva… <NA>    6.2       6.7   3.6
    ##  3 11/4/22      11     4  2022 3421  Adee     Priva… <NA>    6.5       6.9   9.7
    ##  4 11/4/22      11     4  2022 3422  Adee     Priva… <NA>    6.2       6.8  11.2
    ##  5 11/2/22      11     2  2022 3258  Agro KA… Priva… <NA>    8.2       7.6   1.6
    ##  6 11/2/22      11     2  2022 3259  Agro KA… Priva… <NA>    5         6.8   1.9
    ##  7 11/2/22      11     2  2022 3260  Agro KA… Priva… <NA>    8         7.5   1.8
    ##  8 11/2/22      11     2  2022 3261  Agro KA… Priva… <NA>    5.9       6.8   3.2
    ##  9 10/12/21     10    12  2021 2617  Agronomy Priva… <NA>    5.9       6.3   0  
    ## 10 10/12/21     10    12  2021 2618  Agronomy Priva… <NA>    6.8       6.9   0  
    ## # ℹ 93,577 more rows
    ## # ℹ 20 more variables: NO3 <dbl>, NO3W <dbl>, P <dbl>, K <dbl>, Ca <dbl>,
    ## #   Mg <dbl>, Na <dbl>, Zn <dbl>, Fe <dbl>, Mn <dbl>, Cu <dbl>, S <dbl>,
    ## #   Cl <dbl>, SS <dbl>, CECS <dbl>, Al <dbl>, B <dbl>, Sand_percent <dbl>,
    ## #   Silt_percent <dbl>, Clay_percent <dbl>

``` r
# Grouping by year----
g_years <- STL_2018_2022 %>% 
  #group_by (Year) %>% 
  filter (Year<2023, 2017<Year) %>% 
  count(Year)
g_years
```

    ## # A tibble: 5 × 2
    ##    Year     n
    ##   <dbl> <int>
    ## 1  2018 15101
    ## 2  2019 17723
    ## 3  2020 18495
    ## 4  2021 20284
    ## 5  2022 21984

``` r
# For testing
t_years <- STL_2018_2022 %>% 
  #group_by (Year) %>% 
  filter (Year<2023, 2017<Year) 
#%>% 
#count(Year)
t_years
```

    ## # A tibble: 93,587 × 31
    ##    OrderDt   Month   Day  Year LabNo Customer Sector Type     pH Sikora_pH    OM
    ##    <chr>     <dbl> <dbl> <dbl> <chr> <chr>    <chr>  <chr> <dbl>     <dbl> <dbl>
    ##  1 4/13/2022     4    13  2022 10057 Adams, B Priva… <NA>    5.8       6.5   4.8
    ##  2 4/13/2022     4    13  2022 10058 Adams, B Priva… <NA>    6.2       6.7   3.6
    ##  3 11/4/22      11     4  2022 3421  Adee     Priva… <NA>    6.5       6.9   9.7
    ##  4 11/4/22      11     4  2022 3422  Adee     Priva… <NA>    6.2       6.8  11.2
    ##  5 11/2/22      11     2  2022 3258  Agro KA… Priva… <NA>    8.2       7.6   1.6
    ##  6 11/2/22      11     2  2022 3259  Agro KA… Priva… <NA>    5         6.8   1.9
    ##  7 11/2/22      11     2  2022 3260  Agro KA… Priva… <NA>    8         7.5   1.8
    ##  8 11/2/22      11     2  2022 3261  Agro KA… Priva… <NA>    5.9       6.8   3.2
    ##  9 10/12/21     10    12  2021 2617  Agronomy Priva… <NA>    5.9       6.3   0  
    ## 10 10/12/21     10    12  2021 2618  Agronomy Priva… <NA>    6.8       6.9   0  
    ## # ℹ 93,577 more rows
    ## # ℹ 20 more variables: NO3 <dbl>, NO3W <dbl>, P <dbl>, K <dbl>, Ca <dbl>,
    ## #   Mg <dbl>, Na <dbl>, Zn <dbl>, Fe <dbl>, Mn <dbl>, Cu <dbl>, S <dbl>,
    ## #   Cl <dbl>, SS <dbl>, CECS <dbl>, Al <dbl>, B <dbl>, Sand_percent <dbl>,
    ## #   Silt_percent <dbl>, Clay_percent <dbl>

``` r
#graph the Evolution of samples per time 
p_years <-ggplot (g_years, aes(x= Year, y=n)) + geom_bar (stat = "identity") + 
  geom_text(aes(label = n, vjust = 2)) + theme_minimal() 
p_years
```

![](STL_SQL_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->
