STL Project
================

This is my first notebook project in R. I will be exploring the
following mocking soil laboratory dataset.

- Data needs to be filter from 2018 to 2022.

``` r
#Group an exclude years 2017 and 2023----
#Filter unused years
by_years <- STL_2018_2022 %>% 
  group_by (Year) %>% 
  filter (Year<2023, 2017<Year)
by_years
```

- Grouping the data for years gives information about how many samples
  where received ina given year.

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

- Making a graph for visualization:

``` r
#graph the Evolution of samples per time 
p_years <-ggplot (g_years, aes(x= Year, y=n)) + geom_bar (stat = "identity") + 
  geom_text(aes(label = n, vjust = 2)) + theme_minimal() 
p_years
```

![](STL_SQL_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->
